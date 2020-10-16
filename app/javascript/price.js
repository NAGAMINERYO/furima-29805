window.addEventListener('load', function(){
  const price = document.getElementById("item-price")
  const fee = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  price.addEventListener('keyup', function(){
    const cost = price.value
    
  
    if( 300 <= cost && cost <= 9999999) {
      const tax = (cost / 10)
      const gain = (cost - tax)
      fee.innerHTML = tax
      profit.innerHTML = gain
    }else {
      const tax = '-'
      const gain = '-'
      fee.innerHTML = tax
      profit.innerHTML = gain
    }
    
  })
})