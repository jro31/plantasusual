import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["recipes", "food", "cooking"],
    typeSpeed: 100,
    loop: true
  });
}

export { loadDynamicBannerText };
