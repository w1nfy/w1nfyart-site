document.addEventListener('DOMContentLoaded', () => {
    // === 1. ПРЕЛОАДЕР ===
    const preloader = document.createElement('div');
    preloader.className = 'preloader';
    preloader.innerHTML = '<div class="preloader-logo">W1NFY<span>_CUSTOMS</span></div>';
    document.body.appendChild(preloader);

    // Убираем прелоадер через 1.2 секунды
    setTimeout(() => {
        preloader.classList.add('hidden');
        setTimeout(() => preloader.remove(), 500);
    }, 1200);

    // === 2. ПЛАВНЫЙ ПЕРЕХОД МЕЖДУ СТРАНИЦАМИ ===
    // Находим все внутренние ссылки (кроме якорей и внешних)
    document.querySelectorAll('a').forEach(link => {
        const href = link.getAttribute('href');
        if (href && !href.startsWith('#') && !href.startsWith('http') && !link.target) {
            link.addEventListener('click', (e) => {
                e.preventDefault();
                document.body.classList.add('fade-out');
                setTimeout(() => {
                    window.location.href = href;
                }, 400);
            });
        }
    });

    // === 3. ПОЯВЛЕНИЕ ЭЛЕМЕНТОВ ПРИ СКРОЛЛЕ ===
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('visible');
                observer.unobserve(entry.target);
            }
        });
    }, { threshold: 0.1 });

    // Добавляем класс анимации карточкам и заголовкам
    document.querySelectorAll('.card, .section-header, .hero h1, .hero p, .install-guide').forEach(el => {
        el.classList.add('fade-in-up');
        observer.observe(el);
    });
});
// === 4. SPOTLIGHT HOVER ===
document.querySelectorAll('.card').forEach(card => {
    card.addEventListener('mousemove', e => {
        const rect = card.getBoundingClientRect();
        const x = e.clientX - rect.left;
        const y = e.clientY - rect.top;
        card.style.setProperty('--mouse-x', `${x}px`);
        card.style.setProperty('--mouse-y', `${y}px`);
    });
});