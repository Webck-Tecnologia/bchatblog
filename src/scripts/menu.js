const hamburgerElement = document.querySelector(".hamburger");
const navLinksElements = document.querySelector(".nav-links");

hamburgerElement
  .addEventListener("click", () => {
    navLinksElements
      .classList.toggle("expanded")
  });
