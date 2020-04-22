const game = {
  id: null,
};

function toTitleCase(s) {
  return s[0].toUpperCase() + s.slice(1);
}


// *** ROUTER ***
const PAGES = ["#join", "#lobby", "#question", "#answer", "#stats"];


window.addEventListener("hashchange", function() {
  const curVisiblePage = findVisiblePageElement();
  window[`on${toTitleCase(curVisiblePage.id)}Exit`]();
  curVisiblePage.classList.remove("visible");

  const newVisiblePageName = document.getElementById(pageNameFrom(location.hash));
  window[`on${toTitleCase(newVisiblePageName.id)}Enter`]();
  newVisiblePageName.classList.add("visible");
}, false);


function pageNameFrom(locationHash) {
  if (locationHash.length <= 1 || !PAGES.includes(locationHash))
    return "join";
  return locationHash.slice(1);
}


// returns the root div Element of the visible page
function findVisiblePageElement() {
  return document.querySelector("div.visible.page");
}


// start on the Join page
location.hash = "#join";


// *** JOIN ***
const joinForm = document.getElementById("join-form");


function onJoinEnter() {
  joinForm.addEventListener("submit", joinFormSubmitHandler);
}


function joinFormSubmitHandler(event) {
  const playerName = document.getElementById("name-input").value;
  fetch(`join?name=${playerName}`, {method: "POST"})
    .then(response => response.text())
    .then(game_id => {
      game.id = game_id;
      location.hash = "#lobby";
    });
  const joinButton = document.getElementById("join-button")
  joinButton.disabled = true;
  event.preventDefault();
}


function onJoinExit() {
  joinForm.removeEventListener("submit", joinFormSubmitHandler);
}


// *** LOBBY ***
function onLobbyEnter() {
}


function onLobbyExit() {
}
