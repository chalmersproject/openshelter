if (location.href.endsWith("#")) {
  location.hash = "";
  history.replaceState("", "", location.pathname);
}
