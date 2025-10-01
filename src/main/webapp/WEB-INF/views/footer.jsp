<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Floating Button -->
<button class="floating-btn" data-bs-toggle="modal" data-bs-target="#consult">
    <img src="/assets/images/floating-btn-img.png" width="100%">
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
                        <div><input type="text" class="form-control" id="consultationPhone" name="phone" placeholder="전화번호를 입력해주세요" maxlength="13" required></div>
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
                        <div>(필수) 개인정보 수집 및 이용동의 <span class="bg-secondary h-auto rounded-1 text-white" style="cursor: pointer;padding: 4px 8px;" data-bs-toggle="modal" data-bs-target="#termsBox_list2">더보기</span></div>
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

<div class="modal fade" id="termsBox_list2" tabindex="-1" aria-labelledby="termsBoxLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg justify-content-center">
        <div class="modal-content p-3" style="height: 700px; overflow-y: scroll">
            <div class="border-bottom d-flex justify-content-between mb-10">
                <h4>개인정보 수집 및 이용 약관</h4>
                <button type="button" class="btn-close float-end" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="d-flex flex-column gap-3 justify-content-center">
                <div class="contents"><br />
                    <div class="title fw-bold fs-5">제1조 수집하는 개인정보 항목 및 수집방법</div>
                    <br />
                    <div>
                        Synapse 3D(이하 "회사")는 『개인정보 보호법』 및 관련 법령에 따라,
                        아래와 같이 이용자의 개인정보를 수집·이용하며, 이에 대해 동의를 받고자 합니다.
                    </div>
                    <br />

                    <div class="nb_list fw-bold">1.수집항목</div>
                    <br />
                    <div class="nb_list2">1)회원가입 및 기본 서비스 제공 시</div>
                    <br />
                    <div class="dot-list">* 필수 : 이름, 휴대전화번호, 이메일 주소, 상품을 제공받는 해당 채널의 주소 및 ID, 주소지</div>
                    <br />
                    <div class="nb_list2">
                        2)마케팅 및 이벤트 안내 시 – 선택 동의
                    </div>
                    <br />
                    <div class="dot-list">
                        * 선택항목: 이름, 휴대전화번호, 이메일 주소
                    </div>
                    <div class="dot-list">
                        ※ 쿠키, 접속 IP, 브라우저 정보 등 자동 수집 항목은 별도의 ‘개인정보 처리방침’에 따릅니다.
                    </div>
                    <br />

                    <div class="nb_list fw-bold">2.수집 및 이용 목적</div>
                    <br />
                    <div class="dot-list">
                        ·회원 가입 및 서비스 이용에 따른 본인 확인, 민원 응대, 고지사항 전달 등
                    </div>
                    <br />
                    <div class="dot-list">
                        ·이벤트 및 프로모션 정보 제공, 신규 서비스 안내 및 마케팅 활용 (선택 동의 시)
                    </div>
                    <br />
                    <div class="title fw-bold fs-5">제2조 개인정보의 수집 및 이용 목적</div>
                    <br />

                    <div class="nb_list fw-bold">3.개인정보 보유 및 이용 기간</div>
                    <br />
                    <div class="dot-list">
                        (사진 참조)
                        ※ 관련 법령에 따라 아래와 같이 별도 보존될 수 있습니다.
                    </div>
                    <br />
                    <div class="dot-list">
                        * 계약 또는 청약 철회 등에 관한 기록: 5년 (전자상거래법)
                    </div>
                    <br />
                    <div class="dot-list">
                        * 소비자 불만 또는 분쟁처리에 관한 기록: 3년 (전자상거래법)
                    </div>
                    <br />

                    <div class="nb_list fw-bold">4.동의 거부권 및 거부에 따른 불이익</div>
                    <br />
                    <div class="dot-list">
                        * 귀하는 위 개인정보 수집·이용에 대한 동의를 거부할 권리가 있습니다.
                    </div>
                    <br />
                    <div class="dot-list">
                        * 단, 필수항목에 대한 동의를 거부할 경우, 회원가입 및 서비스 제공이 제한될 수 있습니다.
                    </div>
                    <br />

                </div>
                <div class="text-end">
                    <button type="button" class="btn btn-dark" data-bs-target="#consult" data-bs-toggle="modal">
                        확인
                    </button>
                </div>
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
    const neuroCtx = neuroCanvas ? neuroCanvas.getContext('2d') : null;
    const particles = [];
    const particleDensity = 0.00014;
    const particleSpeed = 0.4;

    function resizeCanvas() {
        const dpi = Math.min(2, window.devicePixelRatio || 1);
        if (neuroCanvas) { // Add null check for neuroCanvas
            neuroCanvas.width = window.innerWidth * dpi;
            neuroCanvas.height = window.innerHeight * dpi;
            neuroCanvas.style.width = window.innerWidth + 'px';
            neuroCanvas.style.height = window.innerHeight + 'px';

            if (neuroCanvas) {
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
        }
    }

    function drawNeuroParticles() {
        if (!neuroCtx || !neuroCanvas) return; // Add null checks
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
    const gridCtx = gridCanvas ? gridCanvas.getContext('2d') : null;
    let gridTime = 0;

    function resizeGridCanvas() {
        const dpi = Math.min(2, window.devicePixelRatio || 1);
        if (gridCanvas) { // Add null check for gridCanvas
            gridCanvas.width = window.innerWidth * dpi;
            gridCanvas.height = window.innerHeight * dpi;
            gridCanvas.style.width = window.innerWidth + 'px';
            gridCanvas.style.height = window.innerHeight + 'px';
        }
    }

    function drawFlowGrid() {
        if (!gridCtx || !gridCanvas) return; // Add null checks
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

    // Canvas 초기화 (canvas가 존재하는 경우에만)
    if (neuroCanvas) {
        resizeCanvas();
        drawNeuroParticles();
    }
    if (gridCanvas) {
        resizeGridCanvas();
        drawFlowGrid();
    }

    // Form submissions (prevent default)
    // document.querySelectorAll('form').forEach(form => {
    //     form.addEventListener('submit', (e) => {
    //         e.preventDefault();
    //         alert('폼이 제출되었습니다. (데모 버전)');
    //     });
    // });

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

    // 🚀 상담 신청 - 단순하고 안정적인 방식
    console.log('🔥 상담 신청 스크립트 시작');
    
    function setupConsultationForm() {
        console.log('🔄 상담 폼 설정 시작');
        
        const submitBtn = document.getElementById('submitConsultation');
        const privacyCheckbox = document.getElementById('privacyAgreement');
        const callCheckbox = document.getElementById('callAgreement');
        
        if (!submitBtn || !privacyCheckbox || !callCheckbox) {
            console.log('상담 폼 요소를 찾을 수 없음 - 나중에 다시 시도');
            return;
        }
        
        console.log('✅ 모든 요소 발견됨!');
        
        // 버튼을 항상 활성화 상태로 유지
        submitBtn.disabled = false;
        submitBtn.style.opacity = '1';
        console.log('상담 신청 버튼이 항상 활성화되도록 설정됨');
        
        // 기존 이벤트 리스너 제거 후 새로 등록
        submitBtn.onclick = null; // 기존 onclick 제거
        const newSubmitBtn = submitBtn.cloneNode(true);
        submitBtn.parentNode.replaceChild(newSubmitBtn, submitBtn);

        newSubmitBtn.addEventListener('click', handleSubmitClick);

        function handleSubmitClick(e) {
            e.preventDefault();
            e.stopPropagation();

            // 체크박스 확인 및 사용자 친화적 안내
            if (!privacyCheckbox.checked || !callCheckbox.checked) {
                let message = '상담 신청을 위해 다음 항목에 동의해주세요:\n\n';
                if (!privacyCheckbox.checked) {
                    message += '• 개인정보 수집 및 이용동의\n';
                }
                if (!callCheckbox.checked) {
                    message += '• 상담과 관련된 안내 전화 동의\n';
                }
                message += '\n위 항목들을 체크한 후 다시 신청해주세요.';
                alert(message);
                return false;
            }
            
            // 폼 데이터 수집
            const name = document.getElementById('consultationName').value.trim();
            const hospitalName = document.getElementById('consultationHospital').value.trim();
            const phone = document.getElementById('consultationPhone').value.trim();
            const consultationDate = document.getElementById('consultationDate').value;
            const consultationTime = document.getElementById('consultationTime').value;
            const consultationContent = document.getElementById('consultationContent').value.trim();
            
            // 필수 필드 검증
            if (!name) { 
                alert('이름을 입력해주세요.'); 
                return; 
            }
            if (!hospitalName) { 
                alert('병원명을 입력해주세요.'); 
                return; 
            }
            if (!phone) { 
                alert('전화번호를 입력해주세요.'); 
                return; 
            }
            if (!consultationDate) { 
                alert('상담날짜를 선택해주세요.'); 
                return; 
            }
            if (!consultationTime) { 
                alert('상담시간을 선택해주세요.'); 
                return; 
            }
            if (!consultationContent) { 
                alert('상담내용을 입력해주세요.'); 
                return; 
            }
            
            // FormData 생성
            const formData = new FormData();
            formData.append('name', name);
            formData.append('hospitalName', hospitalName);
            formData.append('phone', phone);
            formData.append('consultationDate', consultationDate);
            formData.append('consultationTime', consultationTime);
            formData.append('consultationContent', consultationContent);
            
            // 서버 전송
            fetch('/consultation/register', {
                method: 'POST',
                body: formData
            })
            .then(response => response.json())
            .then(data => {
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
                    // 모달 닫기
                    const modal = bootstrap.Modal.getInstance(document.getElementById('consult'));
                    if (modal) modal.hide();
                } else {
                    alert('오류: ' + data.message);
                }
            })
            .catch(error => {
                console.error('오류:', error);
                alert('상담 신청 중 오류가 발생했습니다.');
            });
        }
        
        // 전화번호 자동 하이픈 추가 기능
        const phoneInput = document.getElementById('consultationPhone');
        if (phoneInput) {
            phoneInput.addEventListener('input', function(e) {
                // 숫자만 추출
                let value = e.target.value.replace(/[^0-9]/g, '');
                
                // 최대 길이 제한
                if (value.length > 11) {
                    value = value.substring(0, 11);
                }
                
                let formattedValue = '';
                
                // 02 (서울) 지역번호 처리
                if (value.startsWith('02')) {
                    if (value.length <= 2) {
                        formattedValue = value;
                    } else if (value.length <= 5) {
                        formattedValue = value.replace(/(\d{2})(\d{1,3})/, '$1-$2');
                    } else if (value.length <= 9) {
                        formattedValue = value.replace(/(\d{2})(\d{3})(\d{1,4})/, '$1-$2-$3');
                    } else {
                        formattedValue = value.replace(/(\d{2})(\d{4})(\d{4})/, '$1-$2-$3');
                    }
                }
                // 010, 011, 016, 017, 018, 019 (휴대폰)
                // 070 (인터넷전화)
                // 031, 032, 033, 041, 042, 043, 044, 051, 052, 053, 054, 055, 061, 062, 063, 064 (지역번호)
                else if (/^(01[0-9]|02[0-9]|03[1-3]|04[1-4]|05[1-5]|06[1-4]|070)/.test(value)) {
                    if (value.length <= 3) {
                        formattedValue = value;
                    } else if (value.length <= 6) {
                        formattedValue = value.replace(/(\d{3})(\d{1,3})/, '$1-$2');
                    } else if (value.length <= 10) {
                        formattedValue = value.replace(/(\d{3})(\d{3})(\d{1,4})/, '$1-$2-$3');
                    } else {
                        formattedValue = value.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
                    }
                }
                // 나머지 경우 (일반 번호)
                else {
                    if (value.length <= 3) {
                        formattedValue = value;
                    } else if (value.length <= 7) {
                        formattedValue = value.replace(/(\d{3,4})(\d{1,4})/, '$1-$2');
                    } else {
                        formattedValue = value.replace(/(\d{3,4})(\d{3,4})(\d{1,4})/, '$1-$2-$3');
                    }
                }
                
                e.target.value = formattedValue;
            });

            console.log('✅ 전화번호 자동 하이픈 기능 설정 완료!');
        }

        console.log('✅ 상담 폼 설정 완료!');
    }
    
    // DOM 로드 완료 후 실행
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', function() {
            console.log('DOM 로드 완료 - 상담 폼 초기화');
            setupConsultationForm();
        });
    } else {
        console.log('DOM 이미 로드됨 - 상담 폼 초기화');
        setupConsultationForm();
    }
    
    // 모달이 열릴 때마다 폼 상태 업데이트
    document.addEventListener('shown.bs.modal', function(e) {
        if (e.target.id === 'consult') {
            console.log('상담 모달이 열림 - 폼 상태 업데이트');
            
            // 모달이 열릴 때 폼 초기화 재시도
            setTimeout(() => {
                console.log('모달 열림 후 폼 재초기화 시도');
                setupConsultationForm();
            }, 100);
            
            const submitBtn = document.getElementById('submitConsultation');
            const privacyCheckbox = document.getElementById('privacyAgreement');
            const callCheckbox = document.getElementById('callAgreement');
            
            if (submitBtn) {
                console.log('모달 내 버튼 발견됨 - 활성화 상태 유지');
                submitBtn.disabled = false;
                submitBtn.style.opacity = '1';
            }
        }
    });
</script>
























<!-- Footer -->
<footer>
    <div class="footer-content align-items-start flex-xl-row flex-md-column ">

        <div class="d-flex flex-column flex-xl-row gap-2 gap-lg-5 text-start">
            <div>
                <img src="/assets/images/logo.png" width="150">
            </div>
            <div>
                <div>
                    <div>서울시 서초구 강남대로34길 33 신기빌딩 / Tel. 1544-8368 / Fax. 02)573-7370 / Mail : master@shinkisa.co.kr</div>
                    <div>부산지사 : 051)892-7317 / 광주지사 : 062)350-8790 / 대전사무소 : 042)824-2213 / 대구사무소 : 053)753-1250</div>
                    <div>의료기기판매업신고번호: 제1250호</div>
                </div>
                <div>© 2025 SHINKISA Co., Ltd. All rights reserved.</div>
            </div>
        </div>
        <div class="footer-links">
            <a href="#">개인정보처리방침</a>
            <a href="#">이용약관</a>
        </div>
    </div>
</footer>

</body>

</html>
