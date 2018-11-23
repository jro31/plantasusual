import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["recipes", "community", "food", "cooking"],
    typeSpeed: 100,
    loop: true
  });
}

export { loadDynamicBannerText };
