window.addEventListener('load', () => {
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;

  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor(priceInput.value / 10)

  const addTax = document.getElementById("profit");
  addTax.innerHTML = Math.floor(priceInput.value - addTaxDom.innerHTML)

})
});
