/**
   * Hero carousel indicators
   */
let heroCarouselIndicators = select("#hero-carousel-indicators")
let heroCarouselItems = select('#heroCarousel .carousel-item', true)

heroCarouselItems.forEach((item, index) => {
    (index === 0) ?
        heroCarouselIndicators.innerHTML += "<li data-bs-target='#heroCarousel' data-bs-slide-to='" + index + "' class='active'></li>" :
        heroCarouselIndicators.innerHTML += "<li data-bs-target='#heroCarousel' data-bs-slide-to='" + index + "'></li>"
});

/* Countdown */
const counts = document.querySelectorAll('.count')
const speed = 97

counts.forEach((counter) => {
    function upDate() {
        const target = Number(counter.getAttribute('data-target'))
        const count = Number(counter.innerText)
        const inc = target / speed
        if (count < target) {
            counter.innerText = Math.floor(inc + count)
            setTimeout(upDate, 15)
        } else {
            counter.innerText = target
        }
    }
    upDate()
})