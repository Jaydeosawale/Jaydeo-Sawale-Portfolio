const menu = document.querySelector('.menu');
const nav = document.querySelector('#navigation');
menu?.addEventListener('click', () => {
  const expanded = menu.getAttribute('aria-expanded') === 'true';
  menu.setAttribute('aria-expanded', String(!expanded));
  nav.classList.toggle('open', !expanded);
});
nav?.addEventListener('click', (event) => {
  if (event.target.closest('a')) { nav.classList.remove('open'); menu.setAttribute('aria-expanded', 'false'); }
});
document.addEventListener('keydown', (event) => {
  if(event.key === 'Escape' && nav?.classList.contains('open')) {
    nav.classList.remove('open'); menu.setAttribute('aria-expanded','false'); menu.focus();
  }
});
