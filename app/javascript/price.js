function taxCalc() {
  let itemPrice = document.getElementById("item-price");
  let addTaxPrice = document.getElementById("add-tax-price");
  let profit = document.getElementById("profit");

  function calc() {
      let itemPriceValue = Number(itemPrice.value) * 0.1;
      let profitValue = Number(itemPrice.value) - itemPriceValue;
  
      addTaxPrice.textContent = Math.floor(itemPriceValue).toFixed(0);
      profit.textContent = Math.floor(profitValue).toFixed(0);;
  }
  itemPrice.addEventListener('input', calc);
  calc();
}

window.addEventListener("turbo:load", taxCalc);
window.addEventListener("turbo:render", taxCalc);