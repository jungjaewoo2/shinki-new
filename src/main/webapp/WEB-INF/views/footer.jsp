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

        /* .carousel-prev, .carousel-next {
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
        } */

        /*.carousel-prev:hover, .carousel-next:hover {
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
        } */
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
            <div class="cursor-pointer" data-bs-toggle="modal" data-bs-target="#termsBox_list1">개인정보처리방침</div>
            <div class="cursor-pointer" data-bs-toggle="modal" data-bs-target="#termsBox_list3">이용약관</div>
        </div>
    </div>
</footer>

</body>

</html>


<div class="modal fade" id="termsBox_list1" tabindex="-1" aria-labelledby="termsBoxLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg justify-content-center">
        <div class="modal-content p-3" style="height: 700px; overflow-y: scroll">
            <div class="border-bottom d-flex justify-content-between mb-10">
                <h4>개인정보처리방침</h4>
                <button type="button" class="btn-close float-end" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="d-flex flex-column gap-3 justify-content-center">
                <div class="contents">
                <br>
                신기사(이하 ‘회사’라 함)은 개인정보 보호법 제30조에 따라 정보주체의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리하기 위하여 다음과 같이 개인정보처리방침을 수립·공개합니다.
                <br><br>
<div class="fw-bold fs-6">제1조 (개인정보의 수집 및 이용 목적, 수집 항목, 수집 방법, 보유 및 이용 기간)</div><br>
본 약관은 신기사(이하 ‘회사’라 함)이 운영하는 웹사이트 및 플랫폼(이하 ‘서비스’라 함)을 이용함에 있어, 회사와 회원 간의 권리, 의무 및 책임사항, 분쟁 해결 절차, 기타 필요한 사항을 규정함을 목적으로 합니다.<br><br>
① 수집 및 이용 목적, 수집 항목 : 회사는 다음 각 호에 따라 이용자의 개인정보를 서비스 제공을 위한 최소한의 한도로 수집 및 이용하며, 수집한 정보를 목적외로 사용하거나, 이용자의 동의 없이 외부에 공개하지 않습니다.<br><br>
<div class="term-p1">
1. 회사는 회원가입 및 관리에 관하여회원제 서비스 이용에 따른 본인 식별 및 인증, 회원 자격 유지 및 관리, 부정 이용 방지, 고지사항 전달을 위하여 이용자의 로그인 ID, 이름, 이메일, 비밀번호, 휴대폰번호, 성별, 생년월일, 자택주소를 수집 및 이용합니다.<br>
2. 회사는 서비스 제공 및 운영에 관하여 캠페인 신청 및 운영, 물품 배송, 콘텐츠 제공, 포인트 충전 및 출금, 결제 서비스 이용을 위하여 이용자의 자택주소, 전화번호, 휴대폰번호, 이동통신사, 이름, 이메일, 신용카드 정보, 은행계좌정보, 주민등록번호를 수집 및 이용합니다.<br>
3. 회사는 마케팅 및 광고 활용에 관하여 이벤트 및 맞춤형 광고 제공, 서비스 개선을 위한 통계 분석을 위하여 이용자가 선택적으로 동의한 경우에 한하여 이용자의 거주 지역, 결혼 여부, 기타 캠페인 참여를 위한 설문 응답 항목(자녀 유무, 피부 타입, 직업, 반려동물 유무 등)을 수집 및 이용합니다.<br>
4. 회사는 상담 및 고충 처리에 관하여 민원인 식별, 문의 응대, 분쟁 조정 등 고충 처리를 위하여 민원인의 이름, 이메일, 연락처를 수집 및 이용합니다.<br>
</div><br>
② 수집 방법 : 회사는 다음 각 호의 방법으로 개인정보를 수집합니다.<br><br>
<div class="term-p1">
1. 홈페이지 및 모바일 앱 내 회원가입, 서비스 이용 중 정보 입력<br>
2. 캠페인 신청 및 리뷰 작성 과정에서 직접 입력<br>
3. 결제 시 결제 대행사 및 금융기관을 통한 수집<br>
4. 고객센터 및 챗봇 상담 서비스 이용 시 수집<br>
</div><br>
③ 보유 및 이용기간: 회사는 개인정보 수집 및 이용 목적이 달성된 후에는 해당 정보를 지체 없이 파기하며, 관련 법령에 따라 일정 기간 동안 보관이 필요한 경우에는 아래와 같이 보존합니다.<br><br>
<table class="table table-bordered">
	<colgroup>
		<col width="25%">
		<col width="25%">
		<col width="25%">
		<col width="25%">
	</colgroup>
	<thead>
		<tr>
			<th class="bg-body-tertiary text-center">구분</th>
			<th class="bg-body-tertiary text-center">보존 근거</th>
			<th class="bg-body-tertiary text-center">보존 항목</th>
			<th class="bg-body-tertiary text-center">보존 기간</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>회원가입 정보</td>
			<td>정보주체 동의</td>
			<td>로그인 ID, 이름, 이메일 등</td>
			<td>회원 탈퇴 시까지</td>
		</tr>
		<tr>
			<td>계약 또는 청약철회, 대금결제, 재화 등 공급에 관한 기록</td>
			<td>전자상거래법</td>
			<td>결제 및 배송정보 등</td>
			<td>5년</td>
		</tr>
		<tr>
			<td>소비자의 불만 또는 분쟁처리에 관한 기록</td>
			<td>전자상거래법</td>
			<td>상담 및 민원 관련 기록</td>
			<td>3년</td>
		</tr>
		<tr>
			<td>접속에 관한 기록</td>
			<td>통신비밀보호법</td>
			<td>접속로그, IP</td>
			<td>3개월</td>
		</tr>
		<tr>
			<td>부정 이용 기록</td>
			<td>회사 내부 방침</td>
			<td>휴대폰번호, 이메일, 접속기록 등</td>
			<td>1년</td>
		</tr>
	</tbody>
</table>

<br>
<div class="fw-bold fs-6">제2조 (개인정보의 제3자 제공)</div><br>
① 회사는 정보주체의 개인정보를 동 방침 위 제1조에서 고지한 목적 범위 내에서만 수집 및 이용, 처리하며, 다음 각 호의 경우를 제외하고는 정보주체의 사전 동의 없이 개인정보를 제3자에게 제공하지 않습니다.<br><br>
<div class="term-p1">
1. 정보주체로부터 별도의 동의를 받은 경우<br>
2. 법령에 특별한 규정이 있는 경우<br>
3. 정보주체 또는 제3자의 생명, 신체, 재산 등의 이익을 위하여 필요한 경우로서, 정보주체의 동의를 받기 어려운 경우<br>
4. 통계작성, 학술연구 등의 목적을 위하여 필요한 경우로서 특정 개인을 알아볼 수 없는 형태로 제공하는 경우<br>
</div><br>
② 회사는 서비스의 원활한 제공 및 캠페인 운영을 위하여, 회원의 개인정보를 아래와 같이 제3자에게 제공합니다.<br><br>
<table class="table table-bordered">
	<thead>
		<tr>
			<th class="bg-body-tertiary text-center align-middle">제공받는 자</th>
			<th class="bg-body-tertiary text-center align-middle">제공 목적</th>
			<th class="bg-body-tertiary text-center align-middle">제공 항목</th>
			<th class="bg-body-tertiary text-center align-middle">보유 및 이용 기간</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>캠페인 등록 클라이언트</td>
			<td>캠페인 제안, 본인 확인, 물품 배송, 체험단 활동 관리</td>
			<td>이름, 생년월일, 성별, 연락처, 주소, 캠페인 참여 시 입력 정보(피부 타입, 자녀 유무 등), 결제·배송 정보 등</td>
			<td>캠페인 종료 후 3개월 또는 제공 목적 달성 시까지</td>
		</tr>
	</tbody>
</table>
<br>
③ 제3자에게 개인정보를 제공 하기 전 정보주체로부터 개별 동의를 받은 경우에는 동의 내용에 따라 개인정보를 제3자에게 제공하며, 정보주체는 개인정보 제3자 제공에 대한 동의를 거부할 권리가 있습니다. 다만, 동의 거부 시 서비스 이용에 일부 제한이 있을 수 있습니다.<br><br>

<div class="fw-bold fs-6">제3조 (개인정보처리의 위탁)</div><br>
① 회사는 서비스 제공 및 원활한 업무 처리를 위하여 다음과 같이 개인정보 처리 업무를 외부 전문 업체에 위탁하고 있습니다. 회사는 위탁계약 체결 시 「개인정보 보호법」 제26조에 따라 개인정보 보호 관련 법령의 준수를 명시하고, 수탁자가 개인정보를 안전하게 처리하도록 관리·감독하고 있습니다.
<br><br>
<table class="table table-bordered">
	<colgroup>
		<col width="50%">
		<col width="50%">
	</colgroup>
	<thead>
		<tr>
			<th class="bg-body-tertiary text-center">수탁자</th>
			<th class="bg-body-tertiary text-center">위탁업무의 내용</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>PG사 (다날)</td>
			<td>결제 처리, 에스크로 서비스</td>
		</tr>
		<tr>
			<td>문자 발송 대행사 (알리고)</td>
			<td>카카오 알림톡, 문자메시지 발송</td>
		</tr>
		<tr>
			<td>클라우드 서버 제공사 (카페24)</td>
			<td>서비스 인프라 운영 및 보안 관리</td>
		</tr>
		<tr>
			<td>인확인기관 (예: KCB, 나이스평가정보)</td>
			<td>실명확인 및 본인 인증 서비스</td>
		</tr>
		<tr>
			<td>택배사 (CJ대한통운 등)</td>
			<td>체험단 제품 배송 업무</td>
		</tr>
		<tr>
			<td>고객상담센터 (필요 시)</td>
			<td>회원상담 및 문의 처리 등 고객지원 서비스</td>
		</tr>
	</tbody>
</table><br>
② 회사는 수탁자가 위탁받은 업무 외의 목적으로 개인정보를 처리하지 않도록 하고 있으며, 위탁계약서에 따라 기술적·관리적 보호조치, 위탁업무 범위, 재위탁 제한, 사고 발생 시 책임 등을 명확히 규정하고 있습니다.<br><br>
③ 회사는 위탁업무의 내용이나 수탁자가 변경되는 경우 본 개인정보처리방침을 통하여 지체 없이 공개하며, 필요한 경우 회원이 제공한 이메일 주소, 휴대전화번호(SMS, 카카오 알림톡 등), 앱 알림(Push), 사이트 내 메시지 및 알림 기능 등을 통하여 회원에게 개별적으로 고지합니다.<br><br>

<div class="fw-bold fs-6">제4조 (개인정보의 보유 및 이용기간)</div><br>
① 회사는 이용자의 개인정보를 원칙적으로 수집 및 이용 목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 다만, 다음의 정보에 대해서는 관련 법령 및 내부 방침에 따라 일정 기간 동안 보관합니다.<br><br>
② 관련 법령에 따른 보존 항목 및 기간은 다음과 같습니다.<br><br>
<table class="table table-bordered">
	<thead>
		<tr>
			<th class="bg-body-tertiary text-center">보존 항목</th>
			<th class="bg-body-tertiary text-center">보존 근거</th>
			<th class="bg-body-tertiary text-center">보존 기간</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>계약 또는 청약철회 등에 관한 기록 </td>
			<td>전자상거래 등에서의 소비자보호에 관한 법률</td>
			<td>5년</td>
		</tr>
		<tr>
			<td>대금결제 및 재화 등의 공급에 관한 기록 5년</td>
			<td>전자상거래 등에서의 소비자보호에 관한 법률</td>
			<td>5년</td>
		</tr>
		<tr>
			<td>소비자의 불만 또는 분쟁처리에 관한 기록 3년</td>
			<td>전자상거래 등에서의 소비자보호에 관한 법률</td>
			<td>3년</td>
		</tr>
		<tr>
			<td>본인확인에 관한 기록</td>
			<td>정보통신망 이용촉진 및 정보보호 등에 관한 법률</td>
			<td>6개월</td>
		</tr>
		<tr>
			<td>접속에 관한 기록(IP 등)</td>
			<td>통신비밀보호법</td>
			<td>3개월</td>
		</tr>
		<tr>
			<td>부정이용에 관한 기록(아이디, 접속로그 등)</td>
			<td>회사 내부 방침</td>
			<td>1년</td>
		</tr>
	</tbody>
</table><br>
③ 위 보존기간이 경과하거나 개인정보의 처리 목적이 달성된 경우에는, 해당 정보를 복구 또는 재생이 불가능한 방법으로 안전하게 파기합니다. 파기 절차 및 방법은 제8조(개인정보의 파기)에서 별도로 정합니다.<br><br>

<div class="fw-bold fs-6">제7조 (개인정보의 파기절차 및 방법)</div><br>
① 회사는 개인정보의 수집 및 이용 목적이 달성되거나, 보유 및 이용기간이 경과한 경우에는 지체 없이 해당 개인정보를 복구·재생이 불가능한 방법으로 파기합니다.<br><br>

② 회사는 다음 각 호의 파기 절차를 따릅니다.<br>
<div class="term-p1">
1. 회원이 회원가입 등을 위해 입력한 정보는 목적이 달성된 후 내부 방침 및 관련 법령에 따라 일정 기간 보관 후 파기됩니다.<br>
2. 보관 기간이 경과한 개인정보는 별도의 데이터베이스(DB)로 분리 저장된 후 법령에 따라 정해진 기간 이후 파기됩니다.<br>
3. 해당 개인정보는 법령에 의한 경우를 제외하고는 다른 목적으로 이용되지 않으며, 접근이 제한됩니다.<br>
</div><br>

③ 회사는 개인정보를 다음의 각 호의 방법에 따라 안전하게 파기합니다. <br>
<div class="term-p1">
1. 전자적 파일 형태의 정보의 경우, 전용 삭제 프로그램을 사용하거나, 데이터 영역을 덮어쓰기 방식으로 초기화하는 등 복구 또는 재생이 불가능한 기술적 방법을 이용하여 영구 삭제합니다.<br>
2. 종이문서 등 인쇄물 형태의 정보의 경우, 파쇄기로 분쇄하거나 소각을 통해 완전히 파기합니다.<br>
</div><br><br>


<div class="fw-bold fs-6">제8조 (이용자 및 법정대리인의 권리와 그 행사 방법)</div><br>
① 정보주체는 회사에 대해 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다. <br>
<div class="term-p1">
1. 개인정보 열람 요구<br>
2. 개인정보 정정 및 삭제 요구<br>
3. 개인정보 처리정지 요구<br>
4. 동의 철회 및 회원 탈퇴<br>
</div><br>

② 정보주체는 제1항에 따른 권리를 회사의 개인정보 보호 책임자 및 담당 부서에 대해 서면, 전화, 전자우편, 고객센터 등을 통하여 행사할 수 있으며, 회사는 이에 대해 지체 없이 조치합니다. 이 경우 회사는 본인 확인을 위한 신분증 사본 등 추가 자료의 제출을 요청할 수 있으며, 본인 여부가 확인되지 않을 경우 요청을 거절할 수 있습니다.<br><br>

③  정보주체의 법정대리인이나 위임을 받은 자(이하 “대리인”)는 정보주체의 권리를 대리하여 행사할 수 있습니다. 이 경우, 회사는 위임장과 대리인의 신분증 등 관계서류를 요청할 수 있습니다.<br><br>

④ 정보주체가 개인정보의 오류에 대한 정정을 요청한 경우, 회사는 정정을 완료하기 전까지 해당 개인정보를 이용하거나 제3자에게 제공하지 않습니다. 다만, 다른 법령에서 해당 개인정보의 보존을 명시하고 있는 경우에는 삭제를 요청할 수 없습니다.<br><br>

⑤ 회사는 다음 각 호의 경우, 정보주체의 처리정지 요구를 거절할 수 있습니다.<br>
<div class="term-p1">
1. 법률에 특별한 규정이 있거나 법령상 의무를 준수하기 위하여 불가피한 경우<br>
2. 다른 사람의 생명·신체를 해할 우려가 있거나 다른 사람의 재산과 그 밖의 이익을 부당하게 침해할 우려가 있는 경우<br>
3. 정보주체가 요청한 사항을 처리하지 않으면 정보 제공 계약의 이행이 불가능한 경우<br>
</div><br>

⑥ 회사는 정보주체의 권리 행사 요청에 따라 조치한 결과를 지체 없이 통보하며, 정당한 사유로 인해 요청을 거절하는 경우에는 그 사유를 함께 안내합니다.<br><br>

<div class="fw-bold fs-6">제9조 (개인정보 자동 수집 장치의 설치·운영 및 거부에 관한 사항)</div><br>
① 회사는 이용자의 웹사이트 이용 시, 개별 맞춤형 서비스를 제공하고 이용자의 접속 상태를 유지 및 분석하기 위해 쿠키(cookie)를 포함한 자동 수집 장치를 설치·운영할 수 있습니다. 쿠키는 웹사이트를 운영하는데 이용되는 서버가 이용자의 브라우저에 전송하는 소량의 정보로, 이용자의 단말기 저장소에 저장됩니다.
<br><br>
② 회사는 다음 각 호의 정보를 자동으로 수집·저장할 수 있습니다.<br>
<div class="term-p1">
1. 접속 IP 정보, 방문 일시, 서비스 이용 기록<br>
2. 접속 환경 정보 (브라우저 종류, OS 정보, 기기 정보 등)<br>
3. 접속한 캠페인 페이지 및 클릭 기록<br>
4. 광고 노출 및 클릭 이력, 검색 기록, 이용자 설정 정보<br>
</div><br>
③ 이용자는 웹 브라우저의 설정 변경을 통해 쿠키 저장을 거부할 수 있습니다. 다만, 쿠키 저장을 거부할 경우, 로그인이 필요한 일부 서비스 이용에 어려움이 발생할 수 있습니다.<br><br>

※ 웹 브라우저의 설정 변경 방법<br>
<div class="term-p1">
	•	Internet Explorer : [도구] &gt; [인터넷 옵션] &gt; [개인정보] &gt; 고급<br>
	• 	Chrome : [설정] &gt; [개인정보 및 보안] &gt; [쿠키 및 기타 사이트 데이터]<br>
 	•	Safari(iOS) : [설정] &gt; [Safari] &gt; [고급] &gt; [웹사이트 데이터] 제거<br>
 </div><br>

④ 회사는 모바일 앱 또는 모바일 웹 이용 시, 광고 식별자(ADID, IDFA), 단말기 고유정보, 앱 버전, 사용 OS 및 기타 접속 환경 정보 등을 수집할 수 있으며, 이용자는 단말기 설정을 통해 이러한 수집을 거부할 수 있습니다.<br><br>

⑤ 회사는 수집된 자동 정보 항목을 이용자의 선호도 분석, 통계적 분석, 서비스 개선, 광고 타겟팅 등에 활용할 수 있습니다. 단, 이러한 정보는 개인정보와 별도로 분리·비식별화 처리되어 관리됩니다.<br>

<br>
<div class="fw-bold fs-6">제10조 (개인정보 보호를 위한 기술적·관리적 보호조치)</div><br>
① 회사는 개인정보의 안전성을 확보하기 위하여 다음 각 호의 기술적 보호조치를 시행하고 있습니다.<br>
<div class="term-p1">
1. 개인정보의 암호화 : 이용자의 비밀번호, 결제정보 등 주요 개인정보는 암호화된 형태로 저장되며, 관련 정보는 회사의 시스템 또는 외부에서 해독할 수 없도록 안전하게 관리됩니다.<br>
2. 접근제한 및 접근통제시스템 운영 : 개인정보처리시스템에 대한 접근 권한을 업무 수행에 필요한 최소한의 인원에게만 부여하며, 접근통제시스템을 통해 외부로부터의 무단 접근을 차단하고 있습니다.<br>
3. 보안 프로그램 설치 및 주기적 점검 : 해킹, 악성코드 등 외부 위협에 대비하여 백신 소프트웨어를 설치하고 있으며, 보안패치와 시스템 업데이트를 주기적으로 수행합니다.<br>
4. 로그 관리 및 위·변조 방지 : 개인정보 처리 기록은 안전하게 보관되며, 로그의 위·변조 방지를 위한 기술적 장치가 적용됩니다.<br>
</div><br>
② 회사는 개인정보의 안전성을 확보하기 위하여 다음 각 호의 관리적 보호조치를 시행하고 있습니다.<br>
<div class="term-p1">
1. 내부관리계획의 수립 및 시행 : 개인정보 보호를 위한 내부관리계획을 수립하고, 임직원이 이를 철저히 이행할 수 있도록 관리하고 있습니다.<br>
2. 개인정보 취급자의 최소화 및 교육 : 개인정보를 처리하는 담당자는 최소 인원으로 지정되며, 개인정보 보호 의식 제고를 위한 정기적인 보안 교육을 실시합니다.<br>
3. 개인정보 접근기록의 보관 및 점검 : 개인정보처리시스템 접근 기록을 일정 기간 보관하고 있으며, 이상징후 탐지를 위한 정기 점검을 실시하고 있습니다.<br>
</div><br>
③ 회사는 개인정보의 안전성을 확보하기 위하여 다음 각 호의 물리적 보호조치를 시행하고 있습니다.<br>
<div class="term-p1">
1. 출입통제 및 문서 보안관리 : 개인정보가 보관된 자료실, 전산실 등은 별도의 접근 권한을 부여하고 출입통제를 시행하고 있으며, 문서 형태의 개인정보는 잠금장치가 설치된 보관함에 보관됩니다.<br>
2. 비인가 접근 방지 시스템 운영 : 전산실 및 주요 시스템 공간에 CCTV 및 출입기록 확인 장치를 설치하여 외부인의 물리적 접근을 제한합니다.<br><br>
</div><br><br>

<div class="fw-bold fs-6">제11조 (개인정보 보호책임자 및 민원처리)</div><br>
① 회사는 개인정보 처리에 관한 업무를 총괄하여 책임지고, 정보주체의 개인정보 관련 민원처리 및 피해구제 등을 위하여 다음과 같이 개인정보 보호책임자 및 담당부서를 지정합니다.<br><br>

※ 개인정보 보호책임자<br>
<div class="term-p1">
	•	성명: []<br>
	•	직책: [  ]<br>
	•	연락처: [전화번호]<br>
</div><br>
※ 개인정보 보호 관련 문의는 아래의 개인정보 보호 담당부서로도 접수 가능합니다.<br>
<div class="term-p1">
	•	개인정보 보호 담당부서<br>
	•	부서명: []<br>
	•	담당자: []<br>
	•	연락처: [전화번호]<br>
</div><br>
② 정보주체는 회사의 서비스를 이용하면서 발생한 모든 개인정보 보호 관련 문의, 민원, 침해사고 신고, 열람청구 등에 대하여 개인정보 보호책임자 및 담당부서에 문의할 수 있으며, 회사는 이에 대하여 지체 없이 답변 및 조치를 취합니다.<br><br>

③ 회사는 정보주체의 권익 보호를 위하여 아래의 외부기관을 통해 상담 또는 분쟁조정을 신청할 수 있도록 안내합니다.<br>
<div class="term-p1">
	•	개인정보침해신고센터: (국번없이) 118 / http://privacy.kisa.or.kr<br>
	•	개인정보분쟁조정위원회: 1833-6972 / http://www.kopico.go.kr<br>
	•	대검찰청 사이버범죄수사단: 1301 / http://www.spo.go.kr<br>
	•	경찰청 사이버안전국: 182 / http://ecrm.police.go.kr<br>
</div><br><br>

<div class="fw-bold fs-6">제15조 (개인정보처리방침의 변경 및 고지의무)</div><br>

① 본 개인정보처리방침은 관련 법령, 정부의 정책, 회사 내부 운영방침 등의 변경에 따라 개정될 수 있으며, 회사는 개인정보처리방침을 변경하는 경우 변경 사항의 적용일자 및 개정사유를 명시하여 시행일 최소 7일 전부터 신기사 플랫폼 내 공지사항 또는 연결화면을 통해 사전 고지합니다.<br><br>

② 회사는 개인정보처리방침의 최신 개정 내용을 이용자가 쉽게 확인할 수 있도록 홈페이지 또는 서비스 초기화면 하단에 상시 게시합니다.<br><br>

③ 개정된 개인정보처리방침은 특별한 사정이 없는 한 공지된 시행일부터 효력을 발생하며, 이용자가 개정 방침에 대해 이의제기를 하지 않고 서비스를 계속 이용하는 경우에는 변경된 방침에 동의한 것으로 간주됩니다.<br><br>

개인정보처리방침 시행일: 2025년 06월 11일<br>
개인정보 처리 방침 변경 공고일: 2025년 06월 11일<br><br>

            </div>
                <div class="text-end">
                    <button type="button" class="btn btn-dark" data-bs-dismiss="modal">
                        확인
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="termsBox_list3" tabindex="-1" aria-labelledby="termsBoxLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg justify-content-center">
        <div class="modal-content p-3" style="height: 700px; overflow-y: scroll">
            <div class="border-bottom d-flex justify-content-between mb-10">
                <h4>마케팅 및 이벤트 정보 수신 동의 약관</h4>
                <button type="button" class="btn-close float-end" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="d-flex flex-column gap-3 justify-content-center">
                <div class="contents">
                <br>
<div class="fw-bold fs-6">서비스 개요 </div><br>
신기사는 소상공인 및 자영업자가 직접 리뷰어를 모집하고, 손쉽게 체험단 캠페인을 운영할 수 있도록 돕는 체험단 마케팅 플랫폼입니다.
플랫폼 이용을 위해 매월 정기 결제 또는 연간 결제를 통해 사이트 사용 권한이 부여되며, 모집공고 작성, 캠페인 관리, 리뷰어 매칭 등의 주요 기능을 자유롭게 이용하실 수 있습니다. <br><br>
<div class="fw-bold fs-6">이용요금 및 기간 </div><br>
<div class="">
<table class="table mb-10 w-100">
	<thead>
		<tr>
			<th class="border text-center bg-body-tertiary">구분</th>
			<th class="border text-center bg-body-tertiary">금액</th>
			<th class="border text-center bg-body-tertiary">결제방식</th>
			<th class="border text-center bg-body-tertiary">혜택</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td class="border text-center">월간 이용권</td>
			<td class="border text-center">11,000원 (vat포함)</td>
			<td class="border text-center">정기결제</td>
			<td class="border text-center">매월 자동 갱신, 별도 해지 시까지</td>
		</tr>
		<tr>
			<td class="border text-center">연간 이용권 </td>
			<td class="border text-center">118,800원(vat포함)</td>
			<td class="border text-center">일시결제</td>
			<td class="border text-center">10%할인 적용,1년간 이용 가능</td>
		</tr>
	</tbody>
</table>
- 결제방식 : 카드 자동결제 &amp; 핸드폰 결제 (정기결제의 경우 매월 동일 일자에 청구)<br>
- 해지방법 : 환불요청 및 구독 취소 요청<br><br>
<div class="fw-bold fs-6">이용요금 및 기간 </div><br>
- 정기결제 이용 시 제공되는 서비스 항목 : <br>
- 캠페인 등록 및 모집공고 게시 <br>
- 리뷰어 신청 관리 및 채택 기능<br>
- 리뷰 관리 및 성과 통계 확인<br><br>
<div class="fw-bold fs-6">캠페인 노출 방식</div><br>
- 캠페인 등록 시 , 해당 카테고리에 노출이 됩니다.<br>
- 노출 우선순위는 등록 시점 및 상위노출 유료서비스 이용 여부에 따라 달라질 수 있습니다.<br>
- 상위노출 서비스(선택옵션)는 별도 금액 결제를 통해 설정 가능하며, 별도 환불 규정이 적용됩니다.<br><br>
<div class="fw-bold fs-6">환불 정책 안내</div><br>
<div>[플랫폼 이용료 환불 안내]</div><br>
- 정기결제 (11,000원/월) 또는 연간결제에 대한 환불 정책은 다음과 같습니다.  
<table class="table mt-10 mb-10 w-100">
<colgroup>
	<col width="30%">
	<col width="20%">
	<col width="50%">
</colgroup>
	<thead>
		<tr>
			<th class="border text-center bg-body-tertiary">구분</th>
			<th class="border text-center bg-body-tertiary">환불 가능 여부 </th>
			<th class="border text-center bg-body-tertiary">조건</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td class="border text-center">결제 후 7일 이내</td>
			<td class="border text-center">가능</td>
			<td class="border">캠페인 등록 이력이 없고, 실질적 이용 이력이 없는 경우에 한함</td>
		</tr>
		<tr>
			<td class="border text-center">결제 후 7일 경과</td>
			<td class="border text-center">불가</td>
			<td class="border">사용 여부와 관계없이 해당 달 서비스가 개시된 것으로 간주됨</td>
		</tr>
		<tr>
			<td class="border text-center">정기결제 해지 신청</td>
			<td class="border text-center">다음달부터 적용 </td>
			<td class="border">해지 신청 시, 이후 자동 연장 결제는 중지되며, 이미 결제된 해당 월은 환불 불가</td>
		</tr>
		<tr>
			<td class="border text-center">연간결제 환불</td>
			<td class="border text-center">조건부 가능 </td>
			<td class="border">연간 결제의 경우, 이용 개월 수 기준 차감 후 잔여 기간 환불 (단, 할인된 금액 기준 차감 적용)</td>
		</tr>
	</tbody>
</table>
- 환불 요청 시, 요청일 기준으로 내부 검토 후, 정기 정산일 (매월 15일, 30일)에 순차적으로 환불처리 됩니다. (주말/공휴일 경우 익영업일에 처리)<br><br>
<div>[상위노출 서비스 환불 안내]</div>
<table class="table mt-10 mb-10 w-100">
	<thead>
		<tr>
			<th class="border text-center bg-body-tertiary">구분</th>
			<th class="border text-center bg-body-tertiary">환불 가능 여부 </th>
			<th class="border text-center bg-body-tertiary">조건</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td class="border text-center">결제 후 1시간 이내</td>
			<td class="border text-center">가능</td>
			<td class="border">노출이 시작되지 않은 경우에 한해 전액 환불 가능</td>
		</tr>
		<tr>
			<td class="border text-center">다음의 경우 환불 불가</td>
			<td class="border text-center">불가</td>
			<td class="border">- 결제 후 1시간 경과<br>
- 노출이 이미 시작된 경우<br>
- 옵션 또는 지역 선택 실수<br>
- 노출은 되었으나 기대 이하의 성과<br>
- 외부 요인 (경쟁캠페인, 알고리즘 변화 등)에 의한 효과 감소</td>
		</tr>
	</tbody>
</table>
- 환불 요청은 사이트 내 통해 진행되며, 정기 정산일 기준으로 순차 처리 됩니다.<br><br>
<div class="fw-bold fs-6">환불 및 문의 안내</div><br>

환불이나 노출 여부 관계없이 추가 상담이 필요하신 경우,<br>
신기사 고객센터 1:1문의를 통해 도움을 드리고 있습니다. <br> <br>
<a href="/mypage/inquiry" class="btn btn-light-green">1:1 문의하러 가기</a>
</div><br>

            </div>
                <div class="text-end">
                    <button type="button" class="btn btn-dark" data-bs-dismiss="modal">
                        확인
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>