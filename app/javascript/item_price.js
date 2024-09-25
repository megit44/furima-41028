const price = () => {

  const priceInput = document.getElementById("item-price");
  
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);

    const fee = Math.floor(inputValue * 0.1);
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = fee; 

     const profit = inputValue - fee;
     const profitDom = document.getElementById("profit");
     profitDom.innerHTML = profit;

  })
  
};
  
  window.addEventListener("turbo:load", price);
  window.addEventListener("turbo:render", price);