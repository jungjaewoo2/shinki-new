<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Floating Button -->
<button class="floating-btn" data-bs-toggle="modal" data-bs-target="#consult">
    <i class="bi bi-headset"></i>
    상담받기
</button>

</div>

<!-- Modal -->
<div class="modal fade" id="consult" tabindex="-1" aria-labelledby="consultLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5 mt-0" id="exampleModalLabel">상담 신청</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="d-flex flex-column gap-2">
                    <div class="text-end">필수입력란 <span class="text-danger">*</span></div>
                    <div>
                        <div class="label">이름 <span class="text-danger">*</span></div>
                        <div><input type="text" class="form-control" id="consultationName" name="name" placeholder="이름을 입력해주세요" required></div>
                    </div>
                    <div>
                        <div class="label">병원명 <span class="text-danger">*</span></div>
                        <div><input type="text" class="form-control" id="consultationHospital" name="hospitalName" placeholder="병원명을 입력해주세요" required></div>
                    </div>
                    <div>
                        <div class="label">전화번호 <span class="text-danger">*</span></div>
                        <div><input type="text" class="form-control" id="consultationPhone" name="phone" placeholder="전화번호를 입력해주세요" required></div>
                    </div>
                    <div>
                        <div class="label">상담날짜 <span class="text-danger">*</span></div>
                        <div><input type="date" class="form-control" id="consultationDate" name="consultationDate" placeholder="" required></div>
                    </div>
                    <div>
                        <div class="label">상담시간 <span class="text-danger">*</span></div>
                        <div><input type="time" class="form-control" id="consultationTime" name="consultationTime" placeholder="" required></div>
                    </div>
                    <div>
                        <div class="label">상담내용 <span class="text-danger">*</span></div>
                        <div><textarea class="form-control" id="consultationContent" name="consultationContent" rows="3" placeholder="상담내용을 입력해주세요" required></textarea></div>
                    </div>
                    <div class="d-flex align-items-center gap-1">
                        <div><input class="form-check-input" type="checkbox" value="" id="privacyAgreement" required></div>
                        <div>(필수) 개인정보 수집 및 이용동의</div>
                    </div>
                    <div class="d-flex align-items-center gap-1">
                        <div><input class="form-check-input" type="checkbox" value="" id="callAgreement" required></div>
                        <div>(필수) 상담과 관련된 안내 전화가 진행되는 것에 동의하십니까?</div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-info text-white" id="submitConsultation">상담 신청하기</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="consult2" aria-hidden="true" aria-labelledby="consultLabel2" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalToggleLabel2"></h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body text-center">
                상담 신청이 완료되었습니다.<br>
                요청 하신 날짜와 시간에 전화드리겠습니다.<br>
                감사합니다.
            </div>
            <div class="modal-footer">
                 <button type="button" class="btn btn-info text-white" data-bs-dismiss="modal">확인</button>
            </div>
        </div>
    </div>
</div>

<script>
    console.log('Footer script loaded.');

    // Page Navigation
    let currentPage = 'home';

    function navigateTo(page) {
        document.querySelectorAll('.page-section').forEach(section => {
            section.classList.remove('active');
        });
        document.getElementById(page).classList.add('active');

        document.querySelectorAll('.nav-link').forEach(link => {
            link.classList.remove('active');
        });
        event.target?.classList.add('active');

        currentPage = page;
    }

    // Carousel
    function initializeCarousel(tabPane) {
        const carousel = tabPane.querySelector('.carousel');
        if (!carousel) return;

        let currentSlide = 0;
        const carouselItems = carousel.querySelectorAll('.carousel-item');
        const carouselDots = carousel.querySelectorAll('.carousel-dot');
        const prevButton = carousel.querySelector('.carousel-prev');
        const nextButton = carousel.querySelector('.carousel-next');

        function setCarouselSlide(index) {
            carouselItems.forEach(item => item.classList.remove('active'));
            carouselDots.forEach(dot => dot.classList.remove('active'));

            carouselItems[index].classList.add('active');
            carouselDots[index]?.classList.add('active');
            currentSlide = index;

            if (prevButton && nextButton) {
                prevButton.style.display = index === 0 ? 'none' : 'flex';
                nextButton.style.display = index === carouselItems.length - 1 ? 'none' : 'flex';
            }
        }

        if (prevButton) {
            prevButton.addEventListener('click', () => {
                const prevIndex = (currentSlide - 1 + carouselItems.length) % carouselItems.length;
                setCarouselSlide(prevIndex);
            });
        }

        if (nextButton) {
            nextButton.addEventListener('click', () => {
                const nextIndex = (currentSlide + 1) % carouselItems.length;
                setCarouselSlide(nextIndex);
            });
        }

        carouselDots.forEach((dot, index) => {
            dot.addEventListener('click', () => setCarouselSlide(index));
        });

        // Auto-rotate carousel for this tab
        let autoRotate = setInterval(() => {
            if (currentPage === 'application' && tabPane.classList.contains('show') && tabPane.classList.contains('active')) {
                const nextIndex = (currentSlide + 1) % carouselItems.length;
                setCarouselSlide(nextIndex);
            }
        }, 3000);

        // Initialize carousel
        setCarouselSlide(0);

        // Stop auto-rotation when tab is not active
        const tabPaneId = tabPane.id;
        document.getElementById(tabPaneId).addEventListener('hidden.bs.tab', () => {
            clearInterval(autoRotate);
        });

        document.getElementById(tabPaneId).addEventListener('shown.bs.tab', () => {
            autoRotate = setInterval(() => {
                if (currentPage === 'application' && tabPane.classList.contains('show') && tabPane.classList.contains('active')) {
                    const nextIndex = (currentSlide + 1) % carouselItems.length;
                    setCarouselSlide(nextIndex);
                }
            }, 3000);
            setCarouselSlide(0);
        });
    }

    // Initialize carousels for all tabs
    document.querySelectorAll('.tab-pane').forEach(tabPane => {
        initializeCarousel(tabPane);
    });

    // Neuro Particles Canvas
    const neuroCanvas = document.getElementById('neuroCanvas');
    const neuroCtx = neuroCanvas.getContext('2d');
    const particles = [];
    const particleDensity = 0.00014;
    const particleSpeed = 0.4;

    function resizeCanvas() {
        const dpi = Math.min(2, window.devicePixelRatio || 1);
        neuroCanvas.width = window.innerWidth * dpi;
        neuroCanvas.height = window.innerHeight * dpi;
        neuroCanvas.style.width = window.innerWidth + 'px';
        neuroCanvas.style.height = window.innerHeight + 'px';

        const count = Math.floor(window.innerWidth * window.innerHeight * particleDensity);
        particles.length = 0;
        for (let i = 0; i < count; i++) {
            particles.push({
                x: Math.random() * neuroCanvas.width,
                y: Math.random() * neuroCanvas.height,
                vx: (Math.random() * 2 - 1) * particleSpeed,
                vy: (Math.random() * 2 - 1) * particleSpeed
            });
        }
    }

    function drawNeuroParticles() {
        neuroCtx.clearRect(0, 0, neuroCanvas.width, neuroCanvas.height);
        neuroCtx.fillStyle = 'rgba(255, 255, 255, 0.55)';
        particles.forEach(p => {
            p.x += p.vx;
            p.y += p.vy;

            if (p.x < 0 || p.x > neuroCanvas.width) p.vx *= -1;
            if (p.y < 0 || p.y > neuroCanvas.height) p.vy *= -1;

            neuroCtx.beginPath();
            neuroCtx.arc(p.x, p.y, 1.5, 0, Math.PI * 2);
            neuroCtx.fill();
        });

        neuroCtx.lineWidth = 0.6;
        for (let i = 0; i < particles.length; i++) {
            for (let j = i + 1; j < particles.length; j++) {
                const dx = particles[i].x - particles[j].x;
                const dy = particles[i].y - particles[j].y;
                const distance = Math.sqrt(dx * dx + dy * dy);

                if (distance < 110) {
                    const opacity = (1 - distance / 110) * 0.18;
                    neuroCtx.strokeStyle = `rgba(200, 220, 255, ${opacity})`;
                    neuroCtx.beginPath();
                    neuroCtx.moveTo(particles[i].x, particles[i].y);
                    neuroCtx.lineTo(particles[j].x, particles[j].y);
                    neuroCtx.stroke();
                }
            }
        }

        requestAnimationFrame(drawNeuroParticles);
    }

    // Flow Grid Canvas
    const gridCanvas = document.getElementById('gridCanvas');
    const gridCtx = gridCanvas.getContext('2d');
    let gridTime = 0;

    function resizeGridCanvas() {
        const dpi = Math.min(2, window.devicePixelRatio || 1);
        gridCanvas.width = window.innerWidth * dpi;
        gridCanvas.height = window.innerHeight * dpi;
        gridCanvas.style.width = window.innerWidth + 'px';
        gridCanvas.style.height = window.innerHeight + 'px';
    }

    function drawFlowGrid() {
        gridCtx.clearRect(0, 0, gridCanvas.width, gridCanvas.height);
        gridCtx.strokeStyle = 'rgba(255, 255, 255, 0.06)';
        gridCtx.lineWidth = 1;

        const gap = 28;
        gridTime += 0.006;

        for (let y = 0; y <= gridCanvas.height; y += gap) {
            gridCtx.beginPath();
            for (let x = 0; x <= gridCanvas.width; x += gap) {
                const offset = Math.sin((x * 0.003) + gridTime) * 6 +
                    Math.cos((y * 0.003) - gridTime) * 6;
                const yy = y + offset;

                if (x === 0) {
                    gridCtx.moveTo(x, yy);
                } else {
                    gridCtx.lineTo(x, yy);
                }
            }
            gridCtx.stroke();
        }

        requestAnimationFrame(drawFlowGrid);
    }

    // Initialize canvases
    window.addEventListener('resize', () => {
        resizeCanvas();
        resizeGridCanvas();
    });

    resizeCanvas();
    resizeGridCanvas();
    drawNeuroParticles();
    drawFlowGrid();

    // Form submissions (prevent default)
    document.querySelectorAll('form').forEach(form => {
        form.addEventListener('submit', (e) => {
            e.preventDefault();
            alert('폼이 제출되었습니다. (데모 버전)');
        });
    });

    // Add smooth scroll behavior
    document.documentElement.style.scrollBehavior = 'smooth';

    // Interactive hover effects for feature cards
    document.querySelectorAll('.feature-card').forEach(card => {
        card.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-4px)';
            this.style.transition = 'transform 0.3s ease';
        });

        card.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0)';
        });
    });

    // Add ripple effect to buttons
    document.querySelectorAll('button').forEach(button => {
        button.addEventListener('click', function(e) {
            const ripple = document.createElement('span');
            const rect = this.getBoundingClientRect();
            const size = Math.max(rect.width, rect.height);
            const x = e.clientX - rect.left - size / 2;
            const y = e.clientY - rect.top - size / 2;

            ripple.style.width = ripple.style.height = size + 'px';
            ripple.style.left = x + 'px';
            ripple.style.top = y + 'px';
            ripple.classList.add('ripple');

            this.appendChild(ripple);

            setTimeout(() => {
                ripple.remove();
            }, 600);
        });
    });

    // Add ripple animation styles
    const style = document.createElement('style');
    style.textContent = `
        button {
            position: relative;
            overflow: hidden;
        }
        
        .ripple {
            position: absolute;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.5);
            transform: scale(0);
            animation: ripple-animation 0.6s ease-out;
            pointer-events: none;
        }
        
        @keyframes ripple-animation {
            to {
                transform: scale(4);
                opacity: 0;
            }
        }
        
        .feature-card {
            cursor: pointer;
        }
        
        .feature-card::after {
            content: '';
            position: absolute;
            bottom: -40px;
            right: 0;
            width: 96px;
            height: 96px;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 50%;
            filter: blur(32px);
            transition: all 0.5s ease;
            opacity: 0;
        }
        
        .feature-card:hover::after {
            bottom: 0;
            opacity: 1;
        }
        
        .carousel-controls {
            position: absolute;
            top: 50%;
            width: 100%;
            display: flex;
            justify-content: space-between;
            transform: translateY(-50%);
            padding: 0 20px;
            box-sizing: border-box;
        }

        .carousel-prev, .carousel-next {
            background: rgba(255, 255, 255, 0.1);
            border: none;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: background 0.3s ease;
        }

        .carousel-prev:hover, .carousel-next:hover {
            background: rgba(255, 255, 255, 0.3);
        }

        .carousel-prev::before, .carousel-next::before {
            content: '';
            display: inline-block;
            width: 12px;
            height: 12px;
            border: solid rgba(255, 255, 255, 0.8);
            border-width: 0 3px 3px 0;
        }

        .carousel-prev::before {
            transform: rotate(135deg);
        }

        .carousel-next::before {
            transform: rotate(-45deg);
        }
    `;
    document.head.appendChild(style);

    // Parallax effect for background blobs
    document.addEventListener('mousemove', (e) => {
        const x = e.clientX / window.innerWidth;
        const y = e.clientY / window.innerHeight;

        const blob1 = document.querySelector('.moving-blob-1');
        const blob2 = document.querySelector('.moving-blob-2');

        if (blob1) {
            blob1.style.transform = `translate(${x * 20}px, ${y * 20}px) rotate(${x * 30}deg)`;
        }

        if (blob2) {
            blob2.style.transform = `translate(${-x * 20}px, ${-y * 20}px)`;
        }
    });

    // Typing effect for main heading
    const heading = document.querySelector('h1');
    if (heading) {
        const text = heading.textContent;
        heading.textContent = '';
        let index = 0;

        function typeWriter() {
            if (index < text.length) {
                heading.textContent += text.charAt(index);
                index++;
                setTimeout(typeWriter, 30);
            }
        }

        setTimeout(typeWriter, 500);
    }

    // Performance optimization
    let ticking = false;

    function requestTick() {
        if (!ticking) {
            requestAnimationFrame(updateAnimations);
            ticking = true;
        }
    }

    function updateAnimations() {
        ticking = false;
    }

    // Intersection Observer for fade-in animations
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.style.animation = 'fadeInUp 0.6s forwards';
            }
        });
    }, observerOptions);

    document.querySelectorAll('.feature-card').forEach(card => {
        observer.observe(card);
    });

    console.log('SHINKISA Medical 3D Visualization Site - Loaded Successfully');
    
    // 즉시 실행되는 간단한 테스트
    console.log('🧪 DOM 상태 테스트:', {
        readyState: document.readyState,
        body: !!document.body,
        getElementById: typeof document.getElementById
    });

    // 🚀 상담 신청 - 가장 단순한 방식
    /*
    console.log('🔥 상담 신청 스크립트 시작');
    
    // 즉시 실행되는 간단한 함수
    function setupConsultationForm() {
        console.log('🔄 상담 폼 설정 시작');
        
        const submitBtn = document.getElementById('submitConsultation');
        const privacyCheckbox = document.getElementById('privacyAgreement');
        const callCheckbox = document.getElementById('callAgreement');
        
        console.log('요소 확인:', {
            submitBtn: !!submitBtn,
            privacyCheckbox: !!privacyCheckbox,
            callCheckbox: !!callCheckbox
        });
        
        if (!submitBtn) {
            console.error('❌ 상담 신청 버튼을 찾을 수 없습니다!');
            return;
        }
        
        if (!privacyCheckbox || !callCheckbox) {
            console.error('❌ 체크박스를 찾을 수 없습니다!');
            return;
        }
        
        console.log('✅ 모든 요소 발견됨!');
        
        // 버튼 상태 업데이트 함수
        function updateButton() {
            const bothChecked = privacyCheckbox.checked && callCheckbox.checked;
            submitBtn.disabled = !bothChecked;
            submitBtn.style.opacity = bothChecked ? '1' : '0.6';
            console.log('버튼 상태:', bothChecked ? '활성화' : '비활성화');
        }
        
        // 체크박스 이벤트
        privacyCheckbox.addEventListener('change', updateButton);
        callCheckbox.addEventListener('change', updateButton);
        
        // 초기 상태 설정
        updateButton();
        
        // 🖱️ 버튼 클릭 이벤트 - 가장 단순하게
        submitBtn.onclick = function(e) {
            e.preventDefault();
            console.log('🖱️ 버튼 클릭됨!');
            
            // 체크박스 확인
            if (!privacyCheckbox.checked || !callCheckbox.checked) {
                alert('개인정보 수집 및 이용동의와 상담 관련 안내 전화 동의 모두 체크해주세요.');
                return;
            }
            
            // 폼 데이터 수집
            const name = document.getElementById('consultationName').value.trim();
            const hospitalName = document.getElementById('consultationHospital').value.trim();
            const phone = document.getElementById('consultationPhone').value.trim();
            const consultationDate = document.getElementById('consultationDate').value;
            const consultationTime = document.getElementById('consultationTime').value;
            const consultationContent = document.getElementById('consultationContent').value.trim();
            
            console.log('폼 데이터:', { name, hospitalName, phone, consultationDate, consultationTime, consultationContent });
            
            // 필수 필드 검증
            if (!name) { alert('이름을 입력해주세요.'); return; }
            if (!hospitalName) { alert('병원명을 입력해주세요.'); return; }
            if (!phone) { alert('전화번호를 입력해주세요.'); return; }
            if (!consultationDate) { alert('상담날짜를 선택해주세요.'); return; }
            if (!consultationTime) { alert('상담시간을 선택해주세요.'); return; }
            if (!consultationContent) { alert('상담내용을 입력해주세요.'); return; }
            
            // FormData 생성
            const formData = new FormData();
            formData.append('name', name);
            formData.append('hospitalName', hospitalName);
            formData.append('phone', phone);
            formData.append('consultationDate', consultationDate);
            formData.append('consultationTime', consultationTime);
            formData.append('consultationContent', consultationContent);
            
            console.log('🚀 서버 전송 시작');
            
            // 서버 전송
            fetch('/consultation/register', {
                method: 'POST',
                body: formData
            })
            .then(response => {
                console.log('📡 서버 응답:', response.status);
                return response.json();
            })
            .then(data => {
                console.log('📦 응답 데이터:', data);
                if (data.success) {
                    alert('상담 신청이 완료되었습니다.');
                    // 폼 초기화
                    document.getElementById('consultationName').value = '';
                    document.getElementById('consultationHospital').value = '';
                    document.getElementById('consultationPhone').value = '';
                    document.getElementById('consultationDate').value = '';
                    document.getElementById('consultationTime').value = '';
                    document.getElementById('consultationContent').value = '';
                    privacyCheckbox.checked = false;
                    callCheckbox.checked = false;
                    updateButton();
                    // 모달 닫기
                    const modal = bootstrap.Modal.getInstance(document.getElementById('consult'));
                    if (modal) modal.hide();
                } else {
                    alert('오류: ' + data.message);
                }
            })
            .catch(error => {
                console.error('❌ 오류:', error);
                alert('상담 신청 중 오류가 발생했습니다.');
            });
        };
        
        console.log('✅ 상담 폼 설정 완료!');
    }
    
    // 여러 번 시도
    setupConsultationForm();
    setTimeout(setupConsultationForm, 500);
    setTimeout(setupConsultationForm, 1000);
    setTimeout(setupConsultationForm, 2000);
    */
</script>

<!-- Footer -->
<footer>
    <div class="footer-content align-items-baseline flex-lg-row flex-md-column ">
        <div class="text-start">
            <div>
                <div>서울시 서초구 강남대로34길 33 신기빌딩 / Tel. 1544-8368 / Fax. 02)573-7370 / Mail : master@shinkisa.co.kr</div>
                <div>부산지사 : 051)892-7317 / 광주지사 : 062)350-8790 / 대전사무소 : 042)824-2213 / 대구사무소 : 053)753-1250</div>
                <div>의료기기판매업신고번호: 제1250호</div>
            </div>
            <div>© 2025 SHINKISA Co., Ltd. All rights reserved.</div>
        </div>
        <div class="footer-links">
            <a href="#">개인정보처리방침</a>
            <a href="#">이용약관</a>
        </div>
    </div>
</footer>

</body>

</html>
