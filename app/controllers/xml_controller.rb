class XmlController < ApplicationController
  def input; end

  def output
    @result = []
    first = 1
    factorial = 1
    fac_num = 1
    count = 0
    i = 0
    while count < 4
      i += 1
      num = first * (first + 1) * (first + 2)
      if factorial < num
        @result << [i, fac_num, first, (first + 1), (first + 2), 'Нет']
        factorial = (factorial * (fac_num + 1))
        fac_num += 1
      elsif factorial == num
        @result << [i, fac_num, first, (first + 1), (first + 2), 'Да']
        first += 1
        count += 1
      else
        @result << [i, fac_num, first, (first + 1), (first + 2), 'Нет']
        first += 1
      end
    end
    data = @result.map { |elem| {number: elem[0], factorial: elem[1], first: elem[2], second: elem[3], third: elem[4], result: elem[5]} }
    respond_to do |format|
      format.html { render inline: data.to_s }
      format.xml { render xml: data.to_xml }
      format.rss { render xml: data.to_xml }
    end
  end
end
