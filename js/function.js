(function ($) {
  "use strict";

  var $window = $(window);
  var $body = $("body");

  /* Preloader Effect */
  $(window).on("load", function () {
    // Fade out preloader first
    $(".preloader").fadeOut("slow", function () {

      // After preloader hides, animate images
      const images = document.querySelectorAll(".grid-image");
      images.forEach((img, index) => {
        setTimeout(() => {
          img.classList.add("show");
        }, index * 200); // staggered delay (200ms each)
      });
    });
  });

  /* Sticky Header */
  if ($(".active-sticky-header").length) {
    $window.on("resize", function () {
      setHeaderHeight();
    });

    function setHeaderHeight() {
      $("header.main-header").css("height", $("header .header-sticky").outerHeight());
    }

    $(window).on("scroll", function () {
      var fromTop = $(window).scrollTop();
      setHeaderHeight();
      var headerHeight = $("header .header-sticky").outerHeight();
      $("header .header-sticky").toggleClass("hide", fromTop > headerHeight + 100);
      $("header .header-sticky").toggleClass("active", fromTop > 600);
    });
  }

  if ($("a[href='#top']").length) {
    $("a[href='#top']").click(function () {
      $("html, body").animate({ scrollTop: 0 }, "slow");
      return false;
    });
  }

  /* Hero Slider Layout JS */
  const hero_slider_layout = new Swiper(".hero-slider-layout .swiper", {
    slidesPerView: 1,
    speed: 1000,
    spaceBetween: 0,
    loop: true,
    autoplay: {
      delay: 4000,
    },
    pagination: {
      el: ".hero-pagination",
      clickable: true,
    },
  });

  /* testimonial Slider JS */
  if ($(".testimonial-slider").length) {
    const testimonial_slider = new Swiper(".testimonial-slider .swiper", {
      slidesPerView: 1,
      speed: 1000,
      spaceBetween: 30,
      loop: true,
      autoplay: {
        delay: 5000,
      },
      pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },
      navigation: {
        nextEl: ".testimonial-button-next",
        prevEl: ".testimonial-button-prev",
      },
      breakpoints: {
        768: {
          slidesPerView: 1,
        },
        991: {
          slidesPerView: 1,
        },
      },
    });
  }

  /* Skill Bar */
  if ($(".skills-progress-bar").length) {
    $(".skills-progress-bar").waypoint(
      function () {
        $(".skillbar").each(function () {
          $(this)
            .find(".count-bar")
            .animate(
              {
                width: $(this).attr("data-percent"),
              },
              2000
            );
        });
      },
      {
        offset: "70%",
      }
    );
  }

  /* Youtube Background Video JS */
  if ($("#herovideo").length) {
    var myPlayer = $("#herovideo").YTPlayer();
  }

  /* Init Counter */
  if ($(".counter").length) {
    $(".counter").counterUp({ delay: 6, time: 3000 });
  }

  /* Image Reveal Animation */
  if ($(".reveal").length) {
    gsap.registerPlugin(ScrollTrigger);
    let revealContainers = document.querySelectorAll(".reveal");
    revealContainers.forEach((container) => {
      let image = container.querySelector("img");
      let tl = gsap.timeline({
        scrollTrigger: {
          trigger: container,
          toggleActions: "play none none none",
        },
      });
      tl.set(container, {
        autoAlpha: 1,
      });
      tl.from(container, 1, {
        xPercent: -100,
        ease: "power2.out",
      });
      tl.from(image, 1, {
        xPercent: 100,
        scale: 1,
        delay: -1,
        ease: "power2.out",
      });
    });
  }

  /* Parallaxie js */
  var $parallaxie = $(".parallaxie");
  if ($parallaxie.length && $window.width() > 991) {
    if ($window.width() > 768) {
      $parallaxie.parallaxie({
        speed: 0.55,
        offset: 0,
      });
    }
  }

  /* Zoom Gallery screenshot */
  $(".gallery-items").magnificPopup({
    delegate: "a",
    type: "image",
    closeOnContentClick: false,
    closeBtnInside: false,
    mainClass: "mfp-with-zoom",
    image: {
      verticalFit: true,
    },
    gallery: {
      enabled: true,
    },
    zoom: {
      enabled: true,
      duration: 300, // don't foget to change the duration also in CSS
      opener: function (element) {
        return element.find("img");
      },
    },
  });

  /* Contact form validation */
  var $contactform = $("#contactForm");
  $contactform.validator({ focus: false }).on("submit", function (event) {
    if (!event.isDefaultPrevented()) {
      event.preventDefault();
      submitForm();
    }
  });

  function submitForm() {
    /* Ajax call to submit form */
    $.ajax({
      type: "POST",
      url: "form-process.php",
      data: $contactform.serialize(),
      success: function (text) {
        if (text == "success") {
          formSuccess();
        } else {
          submitMSG(false, text);
        }
      },
    });
  }

  function formSuccess() {
    $contactform[0].reset();
    submitMSG(true, "Message Sent Successfully!");
  }

  function submitMSG(valid, msg) {
    if (valid) {
      var msgClasses = "h4 text-success";
    } else {
      var msgClasses = "h4 text-danger";
    }
    $("#msgSubmit").removeClass().addClass(msgClasses).text(msg);
  }
  /* Contact form validation end */

  /* Appointment form validation */
  var $appointmentForm = $("#appointmentForm");
  $appointmentForm.validator({ focus: false }).on("submit", function (event) {
    if (!event.isDefaultPrevented()) {
      event.preventDefault();
      submitappointmentForm();
    }
  });

  function submitappointmentForm() {
    /* Ajax call to submit form */
    $.ajax({
      type: "POST",
      url: "form-appointment.php",
      data: $appointmentForm.serialize(),
      success: function (text) {
        if (text == "success") {
          appointmentformSuccess();
        } else {
          appointmentsubmitMSG(false, text);
        }
      },
    });
  }

  function appointmentformSuccess() {
    $appointmentForm[0].reset();
    appointmentsubmitMSG(true, "Message Sent Successfully!");
  }

  function appointmentsubmitMSG(valid, msg) {
    if (valid) {
      var msgClasses = "h3 text-success";
    } else {
      var msgClasses = "h3 text-danger";
    }
    $("#msgSubmit").removeClass().addClass(msgClasses).text(msg);
  }
  /* Appointment form validation end */

  /* Animated Wow Js */
  new WOW().init();

  /* Popup Video */
  if ($(".popup-video").length) {
    $(".popup-video").magnificPopup({
      type: "iframe",
      mainClass: "mfp-fade",
      removalDelay: 160,
      preloader: false,
      fixedContentPos: true,
    });
  }

function initLogoMarquee(selector, speedMs = 4000, perView = 5.5) {
  return new Swiper(selector, {
    slidesPerView: perView,
    spaceBetween: 32,
    loop: true,
    speed: speedMs,
    autoplay: {
      delay: 0,                   // continuous movement
      disableOnInteraction: false,// don’t stop autoplay on interaction
      pauseOnMouseEnter: false     // pause only when hovering
    },

    allowTouchMove: false,        // ⬅️ disables drag/swipe (fixes click issue)
    breakpoints: {
      320:  { slidesPerView: 2, spaceBetween: 20 },
      768:  { slidesPerView: 3, spaceBetween: 30 },
      1024: { slidesPerView: 5, spaceBetween: 40 }
    }
  });
}

document.addEventListener("DOMContentLoaded", function () {
  initLogoMarquee('.client-slider--psu', 4200, 5.5);
  initLogoMarquee('.client-slider--private', 4000, 5.5);
  initLogoMarquee('.client-slider--global', 3800, 5.5);

  var currentPage = location.pathname.split("/").pop().toLowerCase();

// List of industry pages
var industryPages = [
  "agriculture.html",
  "datacenter.html",
  "electricalpower.html",
  "marine.html",
  "mining.html",
  "processindustry.html",
  "renewable.html",
  "smeindusrty.html",
  "waterscada.html"
];

document.querySelectorAll('.main-menu ul li a').forEach(function(link) {
  var href = link.getAttribute('href');
  if (href) {
    var page = href.toLowerCase();

    // Highlight the exact match
    if (page === currentPage) {
      link.classList.add('active');
    }

    // If current page belongs to industry pages → highlight main "Industry" menu
    if (industryPages.includes(currentPage) && link.classList.contains('industry-menu')) {
      link.classList.add('active');
    }
  }
});

});

//header, footer add and slicknav initialization
        $(document).ready(function () {
            // Destroy any existing SlickNav instance
            if ($('#menu').hasClass('slicknav_nav')) {
                $('#menu').slicknav('destroy');
            }

            // till 1199.98 px hide .gradient-bg, .content-wrapper and show .newname so write js for this 
            function handleResize() {
              if (window.innerWidth < 1199.98) {
                document.querySelectorAll('.gradient-bg, .content-wrapper').forEach(el => el.style.display = 'none');
                document.querySelectorAll('.newname').forEach(el => el.style.display = 'block');
              } else {
                document.querySelectorAll('.gradient-bg, .content-wrapper').forEach(el => el.style.display = 'flex');
                document.querySelectorAll('.newname').forEach(el => el.style.display = 'none');
              }
            }
            handleResize(); // Initial check
            // Fetch header and initialize SlickNav
            fetch('header.html')
                .then(r => r.text())
                .then(html => {
                    document.getElementById('header').innerHTML = html;

                    function setHeroBannerPadding() {
                      var header = document.querySelector('.main-header');
                      var heroSection = document.getElementById('bannerHeroSection');
                          if (header && heroSection) {
                              var headerHeight = header.offsetHeight;
                              heroSection.style.paddingTop = headerHeight + 'px';
                          }
                    }

                    //call this fucniton  only when @media screen and (max-width: 1199.98px)
                    if (window.innerWidth >= 1199.98) {
                      setHeroBannerPadding();
                      window.addEventListener('resize', setHeroBannerPadding);
                    }

                    // Ensure header-fixed is set correctly on page load
                    var $header = $('header.main-header');
                    function toggleHeader() {
                        var scrollY = $(window).scrollTop();
                        if (scrollY > 80 && !$header.hasClass('header-fixed')) {
                            $header.addClass('header-fixed');
                        } else if (scrollY <= 80 && $header.hasClass('header-fixed')) {
                            $header.removeClass('header-fixed');
                        }
                    }
                    toggleHeader(); // Run once after header is loaded
                    $(window).on('scroll', toggleHeader);

                    if ($('#menu').length) { // Check if #menu exists
                        $('#menu').slicknav({
                                label: '', // No label for clean button
                                duration: 300, // Sync with CSS transitions
                                prependTo: '.responsive-menu', // Keep in header's .responsive-menu
                                closeOnClick: true, // Close on link click
                                allowParentLinks: true, // Make parent text clickable for link
                                nestedParentLinks: false, // Separate toggle to arrow only (click text for link, arrow for sub-menu)
                                afterOpen: function() {
                                    // console.log('hell');
                                    $('body').addClass('menu-open'); // Slide content
                                    $('body').addClass('slicknav_opened');
                                    $('.main-header').addClass('navpaddingzero');
                                },
                                afterClose: function() {
                                  // console.log('clo');
                                    $('body').removeClass('menu-open'); // Reset
                                    $('body').removeClass('slicknav_opened');
                                    $('.main-header').removeClass('navpaddingzero');
                                    $('#menu').slicknav('close');
                                    // $('.navbar-toggle a').removeClass('slicknav_open');
                                    // $('.navbar-toggle a').addClass('slicknav_collapsed');
                                }
                            });

                            // Hierarchical active class logic
                            const currentPage = window.location.pathname.split('/').pop() || 'index.html';
                            $('.navbar-nav .nav-link').each(function () {
                                const href = $(this).attr('href');
                                if (href === currentPage) {
                                    $(this).closest('.nav-item, .slicknav_parent').addClass('active');
                                    // Add .active to all parent .slicknav_parent up the hierarchy
                                    $(this).parents('.slicknav_parent').each(function () {
                                        $(this).addClass('active');
                                    });
                                }
                            });
                    }
                    else {
                        console.error('Error: <ul id="menu"> not found in header.html');
                    }

                        // Close on backdrop click
                        $(document).on('click', '.slicknav_menu', function(e) {
                            if ($(e.target).hasClass('slicknav_menu')) {
                                $('#menu').slicknav('close');
                            }
                        });
                    console.log('SlickNav initialized:', $('.slicknav_menu').length);
                })
                .catch(error => console.error('Error loading header:', error));

            // Fetch footer
            fetch('footer.html')
                .then(r => r.text())
                .then(html => {
                    document.getElementById('footer').innerHTML = html;
                })
                .catch(error => console.error('Error loading footer:', error));
        });


})(jQuery);
