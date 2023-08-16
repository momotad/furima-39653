const calc = () => {
  const priceInput = document.getElementById("item-price");
   priceInput.addEventListener("input", () => {
     const TaxForm = document.getElementById("add-tax-price");
     TaxForm.innerHTML = Math.floor(priceInput.value * 0.1 );
     const addProfitDom = document.getElementById("profit");
     addProfitDom.innerHTML = Math.floor(priceInput.value - TaxForm.innerHTML)
 })
};

window.addEventListener("turbo:load", calc);