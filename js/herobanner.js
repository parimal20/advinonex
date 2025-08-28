// gsap.registerPlugin(ScrollTrigger, TextPlugin, SplitText)
jQuery(document).ready(function ($) {
  'use strict'
  // gsap.registerPlugin(ScrollTrigger, TextPlugin, SplitText)
  /************ TABLE OF CONTENTS ***************
03. Back to normal state of menu
05. Open respective page when user click on any nav item
06. Animation for hero text after navigation go full width
07. Animation for all child element (e.g FadeIn, Animated Numbers, Animated Ruler)

**********************************************/

  //02. START -- reset all animation for .animate-child class in each section
  function resetAnimations() {
    gsap.set('.animate-child > *', {opacity: 0, y: 60, rotate: 3})
    gsap.set('hr', {width: 0})
    gsap.set('.count', {innerText: 0})
  }
  resetAnimations()
  //02. END -- reset all animation for .animate-child class in each section

  //03. START -- back to normal state of menu
  $('.back-to-menu').on('click', function () {
    $('.navbar-block').removeClass('remove')
    $('.navbar-block').css('z-index', '');
    $('.go-back').css('z-index', '');
    $('.navbar-block').removeClass('full')
    $('.customherosection').removeClass('page-active')
    $('.page-section').removeClass('active-page')
  })
  //03. END -- back to normal state of menu


  //05. START -- open respective page when user click on any nav item
  $('.navbar-block').on('click', function () {
    console.log($(this));
    if (!$(this).hasClass('full')) {
      console.log('clicked');
      var targetDiv = '#' + $(this).attr('data-target')
      var targetHeroText = $(this).find('.hero-heading')
      $('.navbar-block').addClass('remove')
      $(this).css('z-index', '1000');
      $('.go-back').css('z-index', '1000');
      $(this).addClass('full');
      $('.customherosection').addClass('page-active')
      $('.page-section').addClass('d-none').removeClass('active-page')
      $(targetDiv).removeClass('d-none').addClass('active-page')
      heroTextAnimation(targetHeroText)
      runAnimations(targetDiv)
    }
  })
  //05. END -- open respective page when user click on any nav item

  //06. START -- animation for hero text after navigation go full width
  function heroTextAnimation(targetHeroText) {
    var heroText = $(targetHeroText)
    var heroTextSplit = new SplitText(heroText, {type: 'words'})
    //now animate each character into place
    gsap.from(heroTextSplit.words, {delay: 0.5, duration: 0.7, x: 20, autoAlpha: 0, stagger: 0.05})

    // Revert the text back to its original state after the animation
    setTimeout(function () {
      heroTextSplit.revert()
    }, 3000) // Adjust the timeout duration as needed
  }
  //06. END -- animation for hero text after navigation go full width

  //07. START -- Animation for all child element (e.g FadeIn, Animated Numbers, Animated Ruler)
  function runAnimations(targetDiv) {
    resetAnimations()
    // Animate child tags of each .animate-child class on scroll
    $(targetDiv + ' .animate-child').each(function () {
      // Animate each child element within the active parent
      gsap.to($(this).children(), {
        opacity: 1, // End state
        y: 0,
        rotate: 0,
        duration: 1, // Duration of 2 seconds for each child
        stagger: 0.3, // Stagger timing of 0.3 seconds between each child
        ease: 'power4.out', // Adding easing for smooth transition
        scrollTrigger: {
          trigger: this, // Start animation when this parent comes into view
          start: 'top 80%', // Trigger animation when the top of the parent is 80% from the top of the viewport
          end: 'bottom 20%', // End animation when the bottom of the parent is 20% from the top of the viewport
          toggleActions: 'play none none none', // Play the animation on enter, no actions on leave, enter back, or leave back
        },
      })
    })

    // Animate all <hr> tags on scroll
    $(targetDiv + ' hr').each(function () {
      // Animate each hr tag
      gsap.to($(this), {
        width: '100%', // End state

        duration: 0.7, // Duration of 2 seconds for each child
        ease: 'power1.out', // Adding easing for smooth transition
        scrollTrigger: {
          trigger: this, // Start animation when this parent comes into view
          start: 'top 80%', // Trigger animation when the top of the parent is 80% from the top of the viewport
          end: 'bottom 20%', // End animation when the bottom of the parent is 20% from the top of the viewport
          toggleActions: 'play none none none', // Play the animation on enter, no actions on leave, enter back, or leave back
        },
      })
    })

    // Animate all numbers with .count class on scroll
    $(targetDiv + ' .count').each(function () {
      let $numberElem = $(this)
      let targetValue = $numberElem.data('target')
      ScrollTrigger.create({
        trigger: $numberElem,
        start: 'top 90%',
        once: true,
        onEnter: function () {
          gsap.fromTo(
            $numberElem,
            {innerText: 0},
            {
              innerText: targetValue,
              duration: 2,
              snap: {innerText: 1},
              ease: 'power1.inOut',
              onUpdate: function () {
                $numberElem.text(Math.ceil($numberElem.text()))
              },
            }
          )
        },
      })
    })
  }

  //07. END -- Animation for all child element (e.g FadeIn, Animated Numbers, Animated Ruler)

});