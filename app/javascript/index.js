window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
   priceInput.addEventListener("input", () => {
     const TaxForm = document.getElementById("add-tax-price");
     TaxForm.innerHTML = Math.round(priceInput.value * 0.1 );
     const addProfitDom = document.getElementById("profit");
     addProfitDom.innerHTML = Math.round(priceInput.value - TaxForm.innerHTML)
 })
});