

function onFieldChanged(field_id) {
    document.getElementById(`notification-${field_id}`).innerHTML = "";
}

function refreshRootScrollPadding() {
  var nav_top_header_el = document.getElementById(
    "nav-top-header");

  var body_el = document.body;
  var body_style = body_el.currentStyle || window.getComputedStyle(body_el);
  var body_margin_top = parseInt(body_style.marginTop);

  var top_padding = nav_top_header_el.offsetHeight + body_margin_top;

  var narea_el = document.getElementById(
    "page-notification-area")
  if (narea_el.classList.contains("sticky")) {
    top_padding = top_padding + narea_el.offsetHeight;
  }

  document.documentElement.style["scroll-padding-top"] = `${top_padding}px`;
}

function initNotificationArea() {
  var narea_el = document.getElementById(
    "page-notification-area")
  narea_el.classList.add("sticky");
  document.getElementById(
    "page-notification-area-unpin").style.display = "";

  refreshRootScrollPadding()
}

function onPageNotificationAreaUnpinClick(this_elem) {
  this_elem.parentNode.classList.remove("sticky");
  this_elem.style.display = "none";
  document.getElementById("page-notification-area-pin").style.display = "";
  refreshRootScrollPadding()
}

function onPageNotificationAreaPinClick(this_elem) {
  this_elem.parentNode.classList.add("sticky");
  this_elem.style.display = "none";
  document.getElementById("page-notification-area-unpin").style.display = "";
  refreshRootScrollPadding()
}

function onPageLoad() {
  initNotificationArea()
}
