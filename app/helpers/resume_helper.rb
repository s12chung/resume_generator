module ResumeHelper
  #reads the stylesheet in public/stylesheets/<source> and returns the inline code (for jobmine)
  def stylesheet_contents(source)
    s = '<style type="text/css">'

    file = File.new "public/stylesheets/#{source}.css", "r"
    while line = file.gets
      s += line
    end
    file.close

    s += '</style>'
  end

  def handle_present_and_format(date, date_format)
    if date
      #show the date nicely in like sep 2009, i like lowercase because it de-emphasises the date
      date.to_s(date_format)
    else
      #if there's no date
      "Present"
    end
  end

  #converts shorthand formatted string to proper html (all referred variables or called methods are protected below)
  #link_to(text, url) to <a href="url" onlick="window.open(this.href); return false;">text</a> is  implemented
  #ex. this is some string with link_to(link_to, my_link) => this is some string with <a href="my_link"...>link_to</a>
  #page_break() is also implemented
  def c_s(string)
    formatted_s_array = []

    #split the string based on the regexp, the string will take groups from the regexp
    string.split(LINK_TO_REGEXP).each_with_index do |item, index|
      if index % 3 == 0
        formatted_s_array << item
      elsif index % 3 == 1
        #item is "text, url"
        formatted_s_array << format_link_to(item)
      end
    end
    #returns a string with all the elements in the array concatenated to each other
    converted_string = formatted_s_array.join
    converted_string.gsub(PAGE_BREAK_REGEXP, get_page_break)
  end

  protected
  #see http://rubular.com/ to play around with ruby regexps and documentation
  #/x means ignore whitespace in regexp
  IN_BRACKET_REGEXP = /(( (\( [^\(\)]* \)) | [^\(\)] )*)/x

  #link_to((stuff in brackets or not stuff in brackets)*)
  LINK_TO_REGEXP = /link_to\( #{IN_BRACKET_REGEXP} \)/x

  PAGE_BREAK_REGEXP = /page_break\(\)/

  require 'csv'

  def get_params(match_string)
    array = []
    #params are formatted in csv formatted (yeah, I didn't wanna implement this using regexp)
    CSV::parse_row match_string, 0, array
    #removes whitespace around each element
    array.each {|element| element.strip!}
    array
  end

  def format_link_to(match_string)
    params = get_params match_string
    if params.size == 1: params << "" end
    #rails helper function to use the parameters and make the anchor tag
    link_to params[0], params[1], :popup => true
  end

  def get_page_break
    '<span style="page-break-after:always;"></span>'
  end
end
