import "./main.css";
import { Main } from "./Main.elm";
import registerServiceWorker from "./registerServiceWorker";

Main.embed(document.getElementById("root"));

//callback
const addedCallBack = node => {
  node.setAttribute("class", "red");
};

//callback
const removedCallBack = node => {
  node.removeAttribute("class", "red");
};

const observer = (targetID, addedCallBack, removedCallBack) => {
  // Starts listening for changes in the root HTML element of the page.
  const observer = new MutationObserver(function(mutations) {
    mutations.forEach(function(mutation) {
      mutation.addedNodes.forEach(node => {
        if (node.id === targetID) {
          addedCallBack(node);
        }
      });
      mutation.removedNodes.forEach(node => {
        if (node.id === targetID) {
          removedCallBack(node);
        }
      });
    });
  });
  observer.observe(document.documentElement, {
    childList: true,
    subtree: true
  });
  return observer;
};

const a = observer("editor", addedCallBack, removedCallBack);
