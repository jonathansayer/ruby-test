class HomeController < ApplicationController
  def index
    
  end

  def create
    @value = params[:number]
    @number = convert(params[:number].to_i)
    render :index
  end

  private
  $singles =  ['', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen']
  $tens =     ['', 'ten', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety']
  $units =    ['', 'thousand', 'million', 'billion', 'trillion']

  def convert(num)
    result = ''
    unitIndex = 0

    while num > 0 do
      if num % 1000 != 0
        result = "#{convertHundreds(num % 1000)} #{$units[unitIndex]} #{result}"
      end
      unitIndex = unitIndex + 1 # unitIndex++ not a thing?
      num /= 1000
    end

    return result
  end

  def convertHundreds(num)
    if num % 100 >= 20
      result = "#{$tens[(num / 10) % 10]} #{$singles[num % 10]}"
    else
      result = $singles[num % 100]
    end

    if num / 100 === 0
      return result
    else
      return "#{$singles[num / 100]} hundred #{result}"
    end
  end
end