-- Admin 테이블 생성
CREATE TABLE IF NOT EXISTS admin (
    admin_no BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '관리자 번호',
    name VARCHAR(50) NOT NULL COMMENT '이름',
    admin_id VARCHAR(50) NOT NULL UNIQUE COMMENT '관리자 아이디',
    password VARCHAR(255) NOT NULL COMMENT '비밀번호',
    phone VARCHAR(20) COMMENT '연락처',
    email VARCHAR(100) COMMENT '이메일',
    department VARCHAR(100) COMMENT '부서명',
    position VARCHAR(50) COMMENT '지위',
    `rank` VARCHAR(50) COMMENT '직책',
    authority VARCHAR(50) NOT NULL COMMENT '권한',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='관리자 정보';

-- 기본 관리자 계정 추가 (비밀번호: admin123)
INSERT INTO admin (name, admin_id, password, department, position, `rank`, authority) 
VALUES ('시스템 관리자', 'admin', 'admin123', '기술서비스부', '부장', '관리자', '모든권한')
ON DUPLICATE KEY UPDATE admin_id = admin_id;

-- 샘플 관리자 계정 추가
INSERT INTO admin (name, admin_id, password, department, position, `rank`, authority) 
VALUES 
('홍길동', 'hong', 'admin123', '기술서비스부', '과장', '개발팀장', '모든권한'),
('김철수', 'kim', 'admin123', '헬스케어사업부', '대리', '마케팅팀장', '수정'),
('이영희', 'lee', 'admin123', '기술서비스부', '주임', '디자인팀장', '답변쓰기')
ON DUPLICATE KEY UPDATE admin_id = admin_id;

-- Member 테이블 생성 (기존 테이블이 있으면 컬럼 추가)
CREATE TABLE IF NOT EXISTS member (
    id BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '회원 번호',
    hospital_name VARCHAR(100) NOT NULL COMMENT '병원명',
    department VARCHAR(100) NOT NULL COMMENT '진료과',
    name VARCHAR(50) NOT NULL COMMENT '이름',
    username VARCHAR(50) NOT NULL UNIQUE COMMENT '아이디',
    password VARCHAR(255) NOT NULL COMMENT '비밀번호',
    phone VARCHAR(20) NOT NULL COMMENT '연락처',
    email VARCHAR(100) COMMENT '이메일',
    recommended_employee VARCHAR(50) COMMENT '추천직원',
    recommend_code VARCHAR(50) COMMENT '추천코드',
    status VARCHAR(1) NOT NULL DEFAULT 'Y' COMMENT '상태 (Y:활성, N:탈퇴)',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '가입일시',
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='회원 정보';

-- 기존 member 테이블에 status 컬럼 추가 (컬럼이 없는 경우에만)
-- MySQL에서 컬럼 존재 여부를 확인하고 추가하는 방법
SET @sql = (SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS 
     WHERE table_name = 'member' 
     AND table_schema = DATABASE() 
     AND column_name = 'status') = 0,
    'ALTER TABLE member ADD COLUMN status VARCHAR(1) NOT NULL DEFAULT ''Y'' COMMENT ''상태 (Y:활성, N:탈퇴)''',
    'SELECT 1'
));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 샘플 회원 데이터 추가
INSERT INTO member (hospital_name, department, name, username, password, phone, email, status) 
VALUES 
('서울대병원', '내과', '김의사', 'doctor1', 'password123', '010-1234-5678', 'doctor1@hospital.com', 'Y'),
('연세세브란스병원', '외과', '박의사', 'doctor2', 'password123', '010-2345-6789', 'doctor2@hospital.com', 'Y'),
('삼성서울병원', '소아과', '이의사', 'doctor3', 'password123', '010-3456-7890', 'doctor3@hospital.com', 'Y'),
('서울아산병원', '정형외과', '최의사', 'doctor4', 'password123', '010-4567-8901', 'doctor4@hospital.com', 'Y'),
('분당서울대병원', '산부인과', '정의사', 'doctor5', 'password123', '010-5678-9012', 'doctor5@hospital.com', 'Y')
ON DUPLICATE KEY UPDATE username = username;

-- Inquiry 테이블 생성
CREATE TABLE IF NOT EXISTS inquiry (
    id BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '문의 번호',
    member_id BIGINT COMMENT '회원 번호 (Member 테이블 참조)',
    inquiry_type VARCHAR(50) NOT NULL COMMENT '문의 유형 (기능문의, 의뢰절차 문의, 가격문의, 단순문의)',
    content TEXT NOT NULL COMMENT '문의 내용',
    file_path VARCHAR(255) COMMENT '첨부 파일 경로',
    status VARCHAR(20) NOT NULL DEFAULT '미확인' COMMENT '상태 (미확인, 진행중, 완료)',
    admin_reply TEXT COMMENT '관리자 답변',
    reply_date TIMESTAMP COMMENT '답변일시',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
    FOREIGN KEY (member_id) REFERENCES member(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='문의 내역';

-- 기존 샘플 문의 데이터 삭제 (마이페이지에서 등록된 문의만 표시하기 위해)
-- 주석 처리: 실제 사용자 데이터를 보호하기 위해 자동 삭제 기능 비활성화
-- DELETE FROM inquiry WHERE created_at < NOW() - INTERVAL 1 HOUR;

-- inquiry 테이블의 status 컬럼 기본값을 '미확인'으로 업데이트
ALTER TABLE inquiry MODIFY COLUMN status VARCHAR(20) NOT NULL DEFAULT '미확인' COMMENT '상태 (미확인, 진행중, 완료)';

-- inquiry 테이블에 admin_reply_file_path 컬럼 추가
-- 컬럼이 이미 존재하므로 완전히 제거

-- reply_inquiry 테이블 생성 (댓글 시스템)
CREATE TABLE IF NOT EXISTS reply_inquiry (
    id BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '댓글 ID',
    inquiry_id BIGINT NOT NULL COMMENT '문의 ID',
    member_id BIGINT COMMENT '회원 ID (댓글 작성자)',
    admin_no BIGINT COMMENT '관리자 번호 (답변 작성자)',
    user_content TEXT COMMENT '사용자 댓글 내용',
    admin_content TEXT COMMENT '관리자 답변 내용',
    user_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '사용자 댓글 작성일시',
    admin_created_at TIMESTAMP NULL COMMENT '관리자 답변 작성일시',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
    FOREIGN KEY (inquiry_id) REFERENCES inquiry(id) ON DELETE CASCADE,
    FOREIGN KEY (member_id) REFERENCES member(id) ON DELETE SET NULL,
    FOREIGN KEY (admin_no) REFERENCES admin(admin_no) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='문의 댓글 및 답변';

-- reply_request 테이블 생성 (의뢰 댓글 시스템)
CREATE TABLE IF NOT EXISTS reply_request (
    id BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '댓글 ID',
    request_id BIGINT NOT NULL COMMENT '의뢰 ID',
    member_id BIGINT COMMENT '회원 ID (댓글 작성자)',
    admin_no BIGINT COMMENT '관리자 번호 (답변 작성자)',
    user_content TEXT COMMENT '사용자 댓글 내용',
    admin_content TEXT COMMENT '관리자 답변 내용',
    user_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '사용자 댓글 작성일시',
    admin_created_at TIMESTAMP NULL COMMENT '관리자 답변 작성일시',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
    FOREIGN KEY (request_id) REFERENCES request(id) ON DELETE CASCADE,
    FOREIGN KEY (member_id) REFERENCES member(id) ON DELETE SET NULL,
    FOREIGN KEY (admin_no) REFERENCES admin(admin_no) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='의뢰 댓글 및 답변';

-- con_reg 테이블 생성 (상담 등록)
CREATE TABLE IF NOT EXISTS con_reg (
    id BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '상담 등록 번호',
    name VARCHAR(50) NOT NULL COMMENT '이름',
    hospital_name VARCHAR(100) NOT NULL COMMENT '병원명',
    phone VARCHAR(20) NOT NULL COMMENT '전화번호',
    consultation_date DATE NOT NULL COMMENT '상담날짜',
    consultation_time TIME NOT NULL COMMENT '상담시간',
    consultation_content TEXT NOT NULL COMMENT '상담내용',
    status VARCHAR(20) NOT NULL DEFAULT '대기' COMMENT '상태 (대기, 진행중, 완료)',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '등록일시',
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='상담 등록';
