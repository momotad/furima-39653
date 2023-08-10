window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
 //  console.log(priceInput)
   priceInput.addEventListener("input", () => {
     const TaxForm = document.getElementById("add-tax-price");
     // console.log(priceInput.innerHTML);
     TaxForm.innerHTML = Math.round(priceInput.value * 0.1 );
     const addProfitDom = document.getElementById("profit");
     // console.log(priceInput.innerHTML);
     addProfitDom.innerHTML = Math.round(priceInput.value - TaxForm.innerHTML)
 })
});