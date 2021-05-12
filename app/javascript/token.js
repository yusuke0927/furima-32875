const pay = () => {
  Payjp.setPublicKey("pk_test_00f8c39d736dea7b053299ac");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("user_street_address[number]"),
      exp_month: formData.get("user_street_address[exp_month]"),
      exp_year: `20${formData.get("user_street_address[exp_year]")}`,
      cvc: formData.get("user_street_address[cvc]"),
    }

   
    Payjp.createToken(card, (status, response) => {

      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form")
        const token0bj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", token0bj);
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");

      document.getElementById("charge-form").submit();
    })
  })
};

window.addEventListener("load", pay)