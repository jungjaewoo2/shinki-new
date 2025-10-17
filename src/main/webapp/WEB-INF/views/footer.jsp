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
                        <div>(필수) 개인정보 수집 및 이용동의 <span class="text-black-50 ps-1" style="cursor: pointer;" data-bs-toggle="modal" data-bs-target="#termsBox_list2">더보기 ></span></div>
                    </div>
                    <div class="d-flex align-items-center gap-1">
                        <div><input class="form-check-input" type="checkbox" value="" id="callAgreement" required></div>
                        <div>(필수) 상담과 관련된 안내 전화가 진행되는 것에 동의하십니까?</div>
                    </div>
                </div>
            </div>
            <div class="modal-footer justify-content-center">
                <button type="button" class="btn text-white rounded-4" id="submitConsultation" style="background-color: #156082;">상담 신청하기</button>
            </div>
        </div>
    </div>
</div>
<!-- 상담신청 팝업 약관 -->
<div class="modal fade" id="termsBox_list2" tabindex="-1" aria-labelledby="termsBoxLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg justify-content-center">
        <div class="modal-content p-3" style="height: 700px;">
            <div class="border-bottom d-flex justify-content-between mb-10">
                <h4>개인정보 수집·이용 동의서</h4>
                <button type="button" class="btn-close float-end" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="d-flex flex-column gap-3 justify-content-center overflow-hidden">
                <div class="contents overflow-auto"><br />
                	<div>본 동의서는 Synapse3D 서비스 이용을 위한 개인정보 및 민감정보 처리에 관한 ‘필수 동의’와 마케팅/이벤트 관련 ‘선택 동의’를 포함합니다.</div>
                	<br />
                    <div class="fw-bold fs-6">[필수] 수집·이용 항목 및 목적</div>
                    <br />
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
							<th class="bg-body-tertiary text-center">항목</th>
							<th class="bg-body-tertiary text-center">목적</th>
							<th class="bg-body-tertiary text-center">보유기간</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="align-middle">의뢰자(회원) 식별</td>
							<td>이름, 소속/직책, 이메일, 휴대전화번호, 계정(ID)</td>
							<td>계정 생성·본인확인·고객지원·공지</td>
							<td>회원 탈퇴 시까지(법정 보존 예외)</td>
						</tr>
						<tr>
							<td class="align-middle">서비스 제공</td>
							<td>업로드 메타정보, 시스템 로그</td>
							<td>업로드/처리/전송, 오류 대응</td>
							<td>목적 달성 후 30일내 파기(로그 별도 정책)</td>
						</tr>
						<tr>
							<td class="align-middle">결제/정산(유료화 이후)</td>
							<td>결제수단 토큰, 청구/세금계산 정보</td>
							<td>요금 결제/정산/환불</td>
							<td>유료화 이후 관련 법정 보존기간</td>
						</tr>
					</tbody>
				</table>
                    <br /><br />

                    <div class="fw-bold fs-6">[필수-민감정보(건강정보)] 처리 동의</div>
                    <br />
                    <div class="nb_list2">① 항목: 의료영상(DICOM .DCM, ZIP), 검사 메타데이터, 분석·시뮬레이션 결과(3D/PDF 등)</div>
                    <br />
                    <div class="nb_list2">② 목적: 의뢰 목적의 분석·시뮬레이션 수행 및 산출물 제공</div>
                    <br />
                    <div class="nb_list2">③ 보유기간: 처리 완료 후 30일 이내 자동 파기(백업 포함)</div>
                    <br />
                    <div class="nb_list2">④ 동의 거부권: 동의 거부 시 해당 서비스 제공이 제한될 수 있음</div>
                    <br /><br />
                    <div class="fw-bold fs-6">[선택] 마케팅/이벤트 수신 동의</div>
                    <br />
                    <div class="nb_list2">① 항목: 이름, 이메일, 휴대전화번호, 소속/직책(선택), 관심 장비/응용분야(선택)</div>
                    <br />
                    <div class="nb_list2">② 목적: 제품 업데이트·세미나·프로모션 안내, 만족도 조사/통계 분석</div>
                    <br />
                    <div class="nb_list2">③ 보유기간: 목적 달성 또는 철회 시까지</div>
                    <br />
                    <div class="nb_list2">④ 철회 방법: master@shinkisa.co.kr 또는 고객센터 1544-8368</div>
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

<!-- footer 개인정보처리방침 약관 -->
<div class="modal fade" id="termsBox_list1" tabindex="-1" aria-labelledby="termsBox1Label" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg justify-content-center">
        <div class="modal-content p-3" style="height: 700px;">
            <div class="border-bottom d-flex justify-content-between mb-10">
                <h4>개인정보처리방침</h4>
                <button type="button" class="btn-close float-end" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="d-flex flex-column gap-3 justify-content-center overflow-hidden">
                <div class="contents overflow-auto">
                <br>
				<div class="fw-bold fs-6">제1조 (적용범위 및 역할 구분)</div><br>
				<div class="term-p1">
				<div>1. 본 방침은 웹사이트/앱 및 Synapse3D 서비스에 적용됩니다.</div><br>
				<div>2. 회사는 원칙적으로 의료기관·의사(의뢰자)의 위탁을 받아 환자정보(민감정보)를 처리하는 수탁자(처리자)로서 업무를 수행합니다.</div><br>
				<div>3. 회사가 환자 또는 이용자와 직접 계약하는 경우에는 컨트롤러가 될 수 있습니다.</div><br>
				</div>
				<br><br>
				<div class="fw-bold fs-6">제2조 (처리 목적·항목·수집방법·보유기간)</div><br>
				<div class="term-p1">
				<div>1) 처리 목적: 서비스 제공(업로드·분석·산출물 전송), 계약·정산·고객지원, 보안/감사, (선택)마케팅</div><br>
				<div>2) 처리 항목: 의뢰자 정보(성명, 직함/소속, 연락처, 계정), 환자/검사 정보(의료영상·메타데이터·결과물), 시스템·보안(접속 IP/로그 등)</div><br>
				<div>※ 회사는 주민등록번호를 수집·이용하지 않습니다.</div><br>
				<div>3) 수집 방법: 계정 생성·의뢰서 제출·업로드, 고객센터, 시스템 자동수집</div><br>
				<div>4) 보유기간: 환자 의료영상·결과물은 처리 목적 달성 후 30일 이내 자동 파기(백업 포함 동기 삭제). 기타 항목은 관련 법령에 따름.</div><br>
				</div>
				<br>
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
							<td>환자 의료 영상·결과물</td>
							<td>의뢰 목적 달성</td>
							<td>DICOM, 3D, PDF 등</td>
							<td>30일(백업 포함)</td>
						</tr>
						<tr>
							<td>대금결제/재화 공급</td>
							<td>전자상거래법</td>
							<td>결제·정산 기록</td>
							<td>유료화 이후 5년</td>
						</tr>
						<tr>
							<td>계약/청약철회 등</td>
							<td>전자상거래법</td>
							<td>계약 관련 서류</td>
							<td>5년</td>
						</tr>
						<tr>
							<td>소비자 불만/분쟁</td>
							<td>전자상거래법</td>
							<td>민원처리 기록</td>
							<td>3년</td>
						</tr>
						<tr>
							<td>접속기록</td>
							<td>통신비밀보호법</td>
							<td>IP/접속로그</td>
							<td>3개월</td>
						</tr>
						<tr>
							<td>부정이용 방지</td>
							<td>회사 방침</td>
							<td>계정·접속이력</td>
							<td>1년</td>
						</tr>
					</tbody>
				</table>
				
				<br>
				<div class="fw-bold fs-6">제3조 (민감정보 처리 동의)</div><br>
				<div class="term-p1">
					<div>1. 회사는 건강정보 등 민감정보를 필수 목적 범위 내 최소한으로 처리하며, 일반 동의와 분리된 별도 동의를 받습니다.</div><br>
					<div>2. 의뢰자(의료기관/의사)가 컨트롤러인 경우, 적법한 동의 또는 다른 적법한 근거 확보를 전제로 처리합니다.</div><br>
					<div>3. 전송·저장 시 암호화, 권한분리, 접속기록 보관 등 강화된 보호조치를 적용합니다.</div><br>
				</div>
				<br><br>
				<div class="fw-bold fs-6">제3조의2 (비식별 데이터의 내부 활용 및 식별정보 제거)</div><br>
				<div class="term-p1">
					<div>1. 의뢰자가 데이터를 업로드하여 의뢰함으로써, 회사는 개인을 식별할 수 없도록 비가역적 비식별 처리를 거친 데이터 또는 통계 정보를 샘플 제작, 품질검증(QA), 알고리즘 성능 개선, 서비스 연구·개선의 내부 목적에 한하여 보관·활용할 수 있습니다.</div><br>
					<div>2. 회사는 환자 식별정보(이름, 환자ID, 주민등록번호, 연락처, 주소, 병원명, 얼굴영상 등)에 대하여 DICOM 헤더 제거, 메타데이터 가명처리, 픽셀 상 텍스트 마스킹 등 재식별 위험 최소화 조치를 적용합니다.</div><br>
					<div>3. 원본(식별 가능) 데이터 및 산출물은 30일을 초과하여 보관하지 않습니다.</div><br>
					<div>4. 의뢰 데이터에 환자 식별정보가 포함된 경우, 회사는 업무 수행을 위해 필요한 범위에서 해당 정보를 임의로 삭제·비식별화할 수 있으며, 이로 인한 데이터 형식·메타데이터 변경에 대해서는 책임을 지지 않습니다.</div><br>
				</div>
				<br><br>
				<div class="fw-bold fs-6">제4조 (제3자 제공)</div><br>
				<div>법령 또는 동의가 있는 경우에 한하여 제공하며, 의뢰자에게 산출물을 제공하는 행위는 의뢰 목적 범위 내 제공입니다.</div>
				<br><br>
				<div class="fw-bold fs-6">제5조 (처리의 위탁)</div><br>
				<div>수탁자(예: 클라우드/호스팅, 문자/메일 발송, 고객지원 등)에게 위탁할 수 있으며, 업체명·업무·보유기간을 웹 공지로 최신화합니다.</div><br>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th class="bg-body-tertiary text-center align-middle">수탁자</th>
							<th class="bg-body-tertiary text-center align-middle">위탁업무 내용</th>
							<th class="bg-body-tertiary text-center align-middle">보유·이용기간</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>카페24</td>
							<td>클라우드 서버 및 웹 인프라 운영·보안 관리</td>
							<td>목적 달성 시 지체 없이 파기</td>
						</tr>
					</tbody>
				</table>
				<br><br>
				<div class="fw-bold fs-6">제6조 (국외 이전)</div><br>
				<div>현재 국외 이전은 하지 않습니다. 해외 리전/SaaS 도구 사용이 필요한 경우, 수신자·국가·항목·목적·방법·보유기간·연락처를 사전 고지하고 동의를 받습니다.</div>
				<br><br>
				<div class="fw-bold fs-6">제7조 (서버 위치 및 파기 절차)</div><br>
				<div class="term-p1">
					<div>1. 서버 물리적 위치: 서울특별시 서초구 강남대로34길 33</div><br>
					<div>2. 전자파일: 복구불가 방식(전용 삭제/다중 덮어쓰기), 문서: 분쇄/소각, 백업본: 정책 주기에 따라 영구 삭제(삭제 로그 보관)</div><br>
				</div>
				<br><br>
				<div class="fw-bold fs-6">제8조 (정보주체 권리)</div><br>
				<div>열람·정정·삭제·처리정지·동의철회(회원탈퇴) 요청 가능, 법정 보존 예외 및 보안상 제한 가능, 결과 지체 없이 통지</div>
				<br><br>
				<div class="fw-bold fs-6">제9조 (자동 수집 장치)</div><br>
				<div>쿠키/접속환경 정보 등을 맞춤 서비스·통계·보안 목적으로 사용하며, 거부 시 일부 기능 제한 가능</div>
				<br><br>
				<div class="fw-bold fs-6">제10조 (안전성 확보조치)</div><br>
				<div class="term-p1">
					<div>1. 기술적: 전송/저장 암호화, 키관리, 접근통제, MFA, 침입차단/탐지, 취약점 점검, 악성코드 방지, 접속기록 1년↑ 보관</div><br>
					<div>2. 관리적: 내부관리계획, 정기 교육, 수탁자 관리·점검, 침해사고 대응/모의훈련</div><br>
					<div>3. 물리적: 전산실/자료실 출입통제, CCTV, 잠금장치 보관</div><br>
					<div>4. 침해사고 통지: 유출·오남용 발생 시 지체 없이 통지·신고</div><br>
				</div>
				<br><br>
				<div class="fw-bold fs-6">제11조 (개인정보 보호책임자 및 담당부서)</div><br>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th class="bg-body-tertiary text-center align-middle">구분</th>
							<th class="bg-body-tertiary text-center align-middle">정보</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>개인정보보호책임자</td>
							<td>이준규 (대표자)</td>
						</tr>
						<tr>
							<td>연락처</td>
							<td>1544-8368</td>
						</tr>
						<tr>
							<td>이메일</td>
							<td>master@shinkisa.co.kr</td>
						</tr>
						<tr>
							<td>담당부서</td>
							<td>[기술서비스부 또는 보안·컴플라이언스팀]</td>
						</tr>
					</tbody>
				</table>
				<br><br>
				<div class="fw-bold fs-6">제12조 (아동의 개인정보)</div><br>
				<div>만 14세 미만 아동은 법정대리인 동의 하에서만 처리합니다.</div>
				<br><br>
				<div class="fw-bold fs-6">제13조 (자동화된 의사결정)</div><br>
				<div>회사는 개인정보에 기초한 자동화된 의사결정을 수행하지 않습니다. 수행 시 사전 고지합니다.</div>
				<br><br>
				<div class="fw-bold fs-6">제14조 (고지 및 개정)</div><br>
				<div>시행 7일 전 공지, 중대한 변경은 30일 전 공지. 시행일/공고일: 2025년 10월 14일.</div>
				<br><br>
				
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

<!-- footer 이용 약관 -->
<div class="modal fade" id="termsBox_list3" tabindex="-1" aria-labelledby="termsBoxLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg justify-content-center">
        <div class="modal-content p-3" style="height: 700px;">
            <div class="border-bottom d-flex justify-content-between mb-10">
                <h4>이용 약관</h4>
                <button type="button" class="btn-close float-end" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="d-flex flex-column gap-3 justify-content-center overflow-hidden">
                <div class="contents overflow-auto">
                <br>
				<div class="fw-bold fs-6">제1조 (목적)</div><br>
				본 약관은 ㈜신기사(이하 “회사”)가 제공하는 Synapse3D 기반 의료영상 분석·시뮬레이션 서비스(이하 “서비스”)의 이용과 관련하여, 회사와 회원 간의 권리·의무 및 책임사항, 절차 기타 필요한 사항을 정함을 목적으로 합니다.
 				<br><br>
				<div class="fw-bold fs-6">제2조 (정의)</div><br>
				<div>1. “서비스”란 의료영상(DICOM 등)을 업로드하여 3D/시뮬레이션/분석 결과를 생성·전송하는 일련의 기능을 의미합니다.</div><br>
				<div>2. “산출물”이란 서비스 수행 결과로 생성되는 3D 모델, 파라미터, 측정값, PDF/이미지 리포트 등을 말합니다.</div><br>
				<div>3. “회원”이란 본 약관에 동의하고 서비스를 이용하는 자(의료기관, 의료인, 합법적 권한을 가진 사용자)를 말합니다.</div>
				<br><br>
				<div class="fw-bold fs-6">제3조 (약관의 효력 및 변경)</div><br>
				<div>1. 본 약관은 서비스 초기화면/설정화면에 게시하거나 기타 방법으로 공지함으로써 효력이 발생합니다.</div><br>
				<div>2. 회사는 관련 법령을 위반하지 않는 범위에서 본 약관을 변경할 수 있으며, 변경 시 시행일 최소 7일 전에 공지합니다. 중대한 변경의 경우 30일 전 공지할 수 있습니다.</div><br>
				<div class="fw-bold fs-6">제4조 (서비스의 내용 및 범위)</div><br>
				<div>1. 의료영상 업로드(웹/전용 채널), 전처리 및 분석/시뮬레이션, 산출물 제공(3D/PDF 등).</div><br>
				<div>2. 계정 관리, 기술지원, 품질관리 및 오류 대응.</div><br>
				<div>3. 상세 기능은 서비스 안내/매뉴얼에 따릅니다.</div><br>
				<div class="fw-bold fs-6">제5조 (이용계약의 성립 및 이용요금)</div><br>
				<div>1. 이용계약은 회원의 약관 동의 및 회사의 승낙으로 성립합니다.</div><br>
				<div>2. 오픈 시점에는 무료로 제공되며, 향후 유료 전환 시 요금제·결제조건·환불정책을 사전 고지합니다.</div><br>
				<div class="fw-bold fs-6">제6조 (결제 및 환불)</div><br>
				<div>1. 유료 전환 이후, 결제는 결제대행사(PG)를 통해 이루어지며, 정기결제는 매 결제 주기에 자동 청구될 수 있습니다.</div><br>
				<div>2. 산출물 생성(서버 처리 개시 포함) 이후에는 환불이 제한될 수 있습니다. 서비스 미개시 상태에서는 고지된 환불정책에 따릅니다.</div><br>
				<div>3. 유료 전환 전까지는 결제/환불 내역이 존재하지 않습니다.</div><br>
				<div class="fw-bold fs-6">제7조 (서비스 제공·중단)</div><br>
				<div>1. 회사는 안정적 제공을 위해 노력하되, 정기점검·시스템 개선·천재지변·전력/네트워크 장애 등 불가피한 사유 시 서비스 제공을 일시 중단할 수 있습니다.</div><br>
				<div>2. 중단 시 사전 또는 사후에 공지합니다.</div><br>
				<div class="fw-bold fs-6">제8조 (회원의 의무 및 금지행위)</div><br>
				<div>1. 회원은 계정정보를 안전하게 관리해야 하며, 제3자에게 양도·대여할 수 없습니다.</div><br>
				<div>2. 법령/계약/동의 없이 타인의 개인정보·민감정보를 업로드하거나 부정 사용해서는 안 됩니다.</div><br>
				<div>3. 리버스 엔지니어링, 비인가 스캐닝, 서비스 장애 유발 행위를 금지합니다.</div><br>
				<div class="fw-bold fs-6">제9조 (지식재산권 및 산출물의 권리)</div><br>
				<div>1. 회원이 제공한 의료영상 등 입력 데이터에 대한 권리는 의뢰자 또는 정당한 권리자에게 귀속됩니다.</div><br>
				<div>2. Synapse3D 소프트웨어 및 알고리즘에 대한 권리는 회사에 귀속됩니다.</div><br>
				<div>3. 산출물의 소유·사용권은 별도 계약 또는 서비스 안내 기준에 따르며, 임상적 판단 책임은 회원에게 있습니다.</div><br>
				<div class="fw-bold fs-6">제10조 (의료책임의 한계 및 면책)</div><br>
				<div>1. 서비스 및 산출물은 참고자료이며, 의료 자문·진단·처방이 아닙니다.</div><br>
				<div>2. 최종 임상적 판단과 책임은 전적으로 회원(의사/의료기관)에게 있습니다.</div><br>
				<div>3. 회사는 산출물의 의학적 적합성/효과성/적시성에 대한 보증을 하지 않습니다.</div><br>
				<div class="fw-bold fs-6">제11조 (개인정보 보호)</div><br>
				<div>개인정보의 처리에 관한 사항은 회사의 개인정보처리방침에 따릅니다.</div><br>
				<div class="fw-bold fs-6">제12조 (손해배상 및 책임의 제한)</div><br>
				<div>1. 회사의 고의·중과실이 없는 한, 간접손해·특별손해에 대한 책임을 지지 않습니다.</div><br>
				<div>2. 회사의 총 배상책임은 해당 사유 발생 직전 6개월간 회원이 회사에 지급한 금액의 합계를 한도로 합니다(고의·중과실 제외).</div><br>
				<div class="fw-bold fs-6">제13조 (준거법 및 관할)</div><br>
				<div>본 약관은 대한민국 법률에 따르며, 분쟁은 서울중앙지방법원을 제1심 전속관할로 합니다.</div><br>
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