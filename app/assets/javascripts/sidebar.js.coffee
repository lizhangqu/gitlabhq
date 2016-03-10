mobileWidth = 768
collapsed = 'page-sidebar-collapsed'
expanded = 'page-sidebar-expanded'

toggleSidebar = ->
  $('.page-with-sidebar').toggleClass("#{collapsed} #{expanded}")
  $('header').toggleClass("header-collapsed header-expanded")
  $('.sidebar-wrapper').toggleClass("sidebar-collapsed sidebar-expanded")
  $('.toggle-nav-collapse i').toggleClass("fa-angle-right fa-angle-left")
  $.cookie("collapsed_nav", $('.page-with-sidebar').hasClass(collapsed), { path: '/' })

  setTimeout ( ->
    niceScrollBars = $('.nicescroll').niceScroll();
    niceScrollBars.updateScrollBar();
  ), 300

$(document).on("click", '.toggle-nav-collapse', (e) ->
  e.preventDefault()

  toggleSidebar()
)

$ ->
  if $(window).width() < mobileWidth
    if $('.page-with-sidebar').hasClass(expanded)
      toggleSidebar()
