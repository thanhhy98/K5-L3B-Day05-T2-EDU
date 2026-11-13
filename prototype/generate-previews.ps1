Add-Type -AssemblyName System.Drawing

function Draw-Student-Preview {
    $bmp = New-Object System.Drawing.Bitmap 1200, 780
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $g.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::ClearTypeGridFit

    # Colors
    $cBg = [System.Drawing.Color]::FromArgb(248, 250, 252)
    $cHeader = [System.Drawing.Color]::FromArgb(15, 23, 42)
    $cPrimary = [System.Drawing.Color]::FromArgb(37, 99, 235)
    $cCard = [System.Drawing.Color]::White
    $cBorder = [System.Drawing.Color]::FromArgb(226, 232, 240)
    $cPin = [System.Drawing.Color]::FromArgb(234, 88, 12)
    $cText = [System.Drawing.Color]::FromArgb(30, 41, 59)
    $cMuted = [System.Drawing.Color]::FromArgb(100, 116, 139)
    $cAmberBg = [System.Drawing.Color]::FromArgb(254, 243, 199)
    $cAmberBorder = [System.Drawing.Color]::FromArgb(253, 230, 138)
    $cAmberText = [System.Drawing.Color]::FromArgb(180, 83, 9)
    $cGreenBg = [System.Drawing.Color]::FromArgb(240, 253, 244)
    $cGreenBorder = [System.Drawing.Color]::FromArgb(187, 247, 208)
    $cBlueBg = [System.Drawing.Color]::FromArgb(239, 246, 255)
    $cBlueBorder = [System.Drawing.Color]::FromArgb(191, 219, 254)

    # Brushes & Pens
    $bBg = New-Object System.Drawing.SolidBrush($cBg)
    $bHeader = New-Object System.Drawing.SolidBrush($cHeader)
    $bPrimary = New-Object System.Drawing.SolidBrush($cPrimary)
    $bCard = New-Object System.Drawing.SolidBrush($cCard)
    $bPin = New-Object System.Drawing.SolidBrush($cPin)
    $bText = New-Object System.Drawing.SolidBrush($cText)
    $bMuted = New-Object System.Drawing.SolidBrush($cMuted)
    $bWhite = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::White)
    $pBorder = New-Object System.Drawing.Pen($cBorder, 1)

    $fTitle = New-Object System.Drawing.Font("Segoe UI", 12.5, [System.Drawing.FontStyle]::Bold)
    $fHeading = New-Object System.Drawing.Font("Segoe UI", 10.5, [System.Drawing.FontStyle]::Bold)
    $fBody = New-Object System.Drawing.Font("Segoe UI", 9.5, [System.Drawing.FontStyle]::Regular)
    $fBodyBold = New-Object System.Drawing.Font("Segoe UI", 9.5, [System.Drawing.FontStyle]::Bold)
    $fSmall = New-Object System.Drawing.Font("Segoe UI", 8.5, [System.Drawing.FontStyle]::Regular)
    $fPin = New-Object System.Drawing.Font("Segoe UI", 8, [System.Drawing.FontStyle]::Bold)

    # Background
    $g.FillRectangle($bBg, 0, 0, 1200, 780)

    # Header
    $g.FillRectangle($bHeader, 0, 0, 1200, 56)
    $g.DrawString("EDU Study Mode - ChatGPT tren LMS", $fTitle, $bWhite, 20, 16)
    
    # Header Tags
    $bTag1 = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(59, 130, 246))
    $g.FillRectangle($bTag1, 350, 17, 130, 22)
    $g.DrawString("Track 2 - Nhom EDU", $fSmall, $bWhite, 358, 20)

    $bTag2 = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(51, 65, 85))
    $g.FillRectangle($bTag2, 490, 17, 210, 22)
    $g.DrawString("L3B - Ban 5: Nhung - Dat - Thanh", $fSmall, (New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(147, 197, 253))), 496, 20)
    
    # Tabs
    $bTabBg = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(30, 41, 59))
    $g.FillRectangle($bTabBg, 740, 14, 230, 30)
    $g.FillRectangle($bPrimary, 742, 16, 115, 26)
    $g.DrawString("Hoc vien (Dem)", $fHeading, $bWhite, 750, 20)
    $g.DrawString("Ban truc TA (2)", $fHeading, $bMuted, 868, 20)

    # Live AI config & Pins
    $g.FillRectangle($bTag2, 985, 15, 100, 28)
    $g.DrawString("Live AI Config", $fSmall, $bWhite, 995, 21)
    $g.DrawString("[v] HAX Pins (1-8)", $fSmall, (New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(203, 213, 225))), 1095, 21)

    # Scenario bar
    $g.FillRectangle($bCard, 0, 56, 1200, 42)
    $g.DrawLine($pBorder, 0, 98, 1200, 98)
    $g.FillEllipse($bPin, 20, 68, 18, 18)
    $g.DrawString("8", $fPin, $bWhite, 25, 71)
    $g.DrawString("Ca kiem thu:", $fBodyBold, $bMuted, 45, 69)

    $bChipRed = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(254, 242, 242))
    $g.FillRectangle($bChipRed, 130, 64, 230, 26)
    $g.DrawRectangle((New-Object System.Drawing.Pen([System.Drawing.Color]::FromArgb(252, 165, 165), 1)), 130, 64, 230, 26)
    $g.DrawString("1. Loi tai lieu 3.3 (Dat nhat #1)", $fSmall, (New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(153, 27, 27))), 138, 69)

    $g.FillRectangle($bChipRed, 370, 64, 230, 26)
    $g.DrawRectangle((New-Object System.Drawing.Pen([System.Drawing.Color]::FromArgb(252, 165, 165), 1)), 370, 64, 230, 26)
    $g.DrawString("2. Xin giai bai tap 3 (Dat nhat #2)", $fSmall, (New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(153, 27, 27))), 378, 69)

    $bChipGray = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(241, 245, 249))
    $g.FillRectangle($bChipGray, 610, 64, 130, 26)
    $g.DrawString("3. Hoi Slide 12 ao", $fSmall, $bText, 620, 69)

    $g.FillRectangle($bChipGray, 750, 64, 150, 26)
    $g.DrawString("4. Hoi Buoi 7 p-value", $fSmall, $bText, 760, 69)

    $g.FillRectangle($bChipGray, 910, 64, 150, 26)
    $g.DrawString("5. Hoc vien tu che minh", $fSmall, $bText, 920, 69)

    $g.DrawString("Xoa chat", $fSmall, (New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(185, 28, 28))), 1115, 69)

    # Left Sidebar
    $g.FillRectangle($bCard, 15, 108, 260, 655)
    $g.DrawRectangle($pBorder, 15, 108, 260, 655)
    $g.DrawString("KHOA HOC HIEN TAI (L3B - BAN 5)", $fSmall, $bMuted, 28, 120)
    $g.DrawString("Nhap mon Phan tich Du lieu", $fHeading, $bText, 28, 138)
    $g.DrawString("Hoc vien: Vo Thi Phuong Nhung (2A202603918)", $fSmall, $bMuted, 28, 158)
    $g.DrawLine($pBorder, 28, 175, 260, 175)

    $g.DrawString("TIEN DO BUOI HOC (Buoi 3/10)", $fSmall, $bMuted, 28, 185)
    $g.FillRectangle((New-Object System.Drawing.SolidBrush($cBlueBg)), 28, 202, 230, 26)
    $g.DrawString("Buoi 3: Thong ke mo ta (Dang hoc)", $fSmall, (New-Object System.Drawing.SolidBrush($cPrimary)), 36, 208)
    $g.DrawString("Buoi 4: Truc quan hoa du lieu", $fSmall, $bMuted, 36, 235)
    $g.DrawString("Buoi 7: Kiem dinh & p-value", $fSmall, $bMuted, 36, 258)
    $g.DrawLine($pBorder, 28, 280, 260, 280)

    $g.DrawString("TAI LIEU BUOI 3 (GIAO TRINH)", $fSmall, $bMuted, 28, 290)
    $g.DrawString("3.1 Trung binh cong", $fSmall, $bText, 36, 310)
    $g.DrawString("3.2 Trung vi", $fSmall, $bText, 36, 332)
    $g.FillRectangle((New-Object System.Drawing.SolidBrush($cAmberBg)), 28, 350, 230, 36)
    $g.DrawString("3.3 Phuong sai & Do lech chuan", $fSmall, (New-Object System.Drawing.SolidBrush($cAmberText)), 36, 354)
    $g.DrawString("[!] Phat hien diem sai sot hoc thuat", $fSmall, (New-Object System.Drawing.SolidBrush($cAmberText)), 36, 368)
    $g.DrawString("3.4 Gia tri ngoai lai", $fSmall, $bText, 36, 395)
    $g.DrawString("3.5 Bai tap 3 (8 muc luong - Open)", $fSmall, $bText, 36, 418)

    $g.FillRectangle((New-Object System.Drawing.SolidBrush($cAmberBg)), 28, 460, 230, 85)
    $g.DrawRectangle((New-Object System.Drawing.Pen($cAmberBorder, 1)), 28, 460, 230, 85)
    $g.DrawString("THONG BAO MON HOC:", $fSmall, (New-Object System.Drawing.SolidBrush($cAmberText)), 36, 468)
    $g.DrawString("- Bai tap 3: Han nop 23:59 dem nay", $fSmall, (New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(146, 64, 14))), 36, 486)
    $g.DrawString("- Gio truc TA: 08:00 - 22:00 hang ngay", $fSmall, (New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(146, 64, 14))), 36, 504)
    $g.DrawString("Hien tai: 22:45 dem (Ngoai gio truc)", $fSmall, (New-Object System.Drawing.SolidBrush($cAmberText)), 36, 522)

    # Center Chat Area
    $g.FillRectangle($bCard, 290, 108, 585, 655)
    $g.DrawRectangle($pBorder, 290, 108, 585, 655)

    # Banner [1]
    $g.FillRectangle((New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(241, 245, 249))), 290, 108, 585, 36)
    $g.FillEllipse($bPin, 305, 118, 18, 18)
    $g.DrawString("1", $fPin, $bWhite, 310, 121)
    $g.DrawString("Tro ly Study Mode (AI): Ho tro tu duy tung buoc. Khong giai ho bai tap mo.", $fSmall, $bText, 335, 120)

    # Student message
    $g.FillRectangle($bPrimary, 380, 160, 475, 48)
    $g.DrawString("'Em thay muc 3.3 ghi do lech chuan luon nho hon phuong sai,", $fSmall, $bWhite, 392, 168)
    $g.DrawString("nhung neu phuong sai la 0.25 thi can ra 0.5 lon hon chu a? Co phai tai lieu nham khong?'", $fSmall, $bWhite, 392, 185)

    # AI response card
    $g.FillRectangle((New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(248, 250, 252))), 305, 222, 555, 395)
    $g.DrawRectangle((New-Object System.Drawing.Pen([System.Drawing.Color]::FromArgb(203, 213, 225), 1)), 305, 222, 555, 395)

    # Badge [2]
    $g.FillRectangle((New-Object System.Drawing.SolidBrush($cAmberBg)), 320, 235, 230, 24)
    $g.FillEllipse($bPin, 325, 238, 16, 16)
    $g.DrawString("2", $fPin, $bWhite, 329, 240)
    $g.DrawString("Dang doi chieu tai lieu (3.3)", $fSmall, (New-Object System.Drawing.SolidBrush($cAmberText)), 348, 240)

    $g.DrawString("Chao ban, ban co truc giac toan hoc rat sac ben! Phan xa cua ban hoan toan chinh xac:", $fBody, $bText, 320, 270)
    $g.DrawString("Khi phuong sai = 0.25, can bac hai la sqrt(0.25) = 0.5 > 0.25.", $fBodyBold, $bText, 320, 290)
    $g.DrawString("Cau viet 'luon nho hon phuong sai' trong 3.3 la mot diem khai quat hoa chua chat che.", $fBody, $bText, 320, 310)
    $g.DrawString("Tro ly da ghi nhan va gui phan anh den Giang vien va Tro giang de dinh chinh!", $fBody, $bText, 320, 330)

    # Citation [3]
    $g.FillRectangle((New-Object System.Drawing.SolidBrush($cGreenBg)), 320, 360, 525, 48)
    $g.DrawRectangle((New-Object System.Drawing.Pen($cGreenBorder, 1)), 320, 360, 525, 48)
    $g.FillEllipse($bPin, 330, 372, 16, 16)
    $g.DrawString("3", $fPin, $bWhite, 334, 374)
    $g.DrawString("Can cu trich dan nguon: Giao trinh Buoi 3 - 3.3 Phuong sai va do lech chuan", $fSmall, (New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(21, 128, 61))), 354, 375)

    # Socratic card [4]
    $g.FillRectangle((New-Object System.Drawing.SolidBrush($cBlueBg)), 320, 420, 525, 52)
    $g.DrawRectangle((New-Object System.Drawing.Pen($cBlueBorder, 1)), 320, 420, 525, 52)
    $g.FillEllipse($bPin, 330, 432, 16, 16)
    $g.DrawString("4", $fPin, $bWhite, 334, 434)
    $g.DrawString("HUONG DAN TU DUY TUNG BUOC (STUDY MODE)", $fSmall, (New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(29, 78, 216))), 354, 428)
    $g.DrawString("Ban hay yen tam giu vung cach hieu toan hoc nay khi lam cac bai tap thong ke!", $fBody, $bText, 354, 446)

    # Ticket [6]
    $g.FillRectangle((New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(241, 245, 249))), 320, 485, 380, 28)
    $g.FillEllipse($bPin, 330, 490, 16, 16)
    $g.DrawString("6", $fPin, $bWhite, 334, 492)
    $g.DrawString("Ticket #TA-301 - Da ghi nhan - Hen tra loi 08:30 sang mai", $fSmall, $bText, 354, 492)

    # Actions [5]
    $g.FillEllipse($bPin, 325, 540, 16, 16)
    $g.DrawString("5", $fPin, $bWhite, 329, 542)
    $g.FillRectangle($bPrimary, 350, 532, 130, 28)
    $g.DrawString("Xem trich doan 3.3", $fSmall, $bWhite, 360, 538)
    $g.FillRectangle($bCard, 490, 532, 150, 28)
    $g.DrawRectangle($pBorder, 490, 532, 150, 28)
    $g.DrawString("Hoc tiep 3.4 Ngoai lai", $fSmall, $bText, 502, 538)

    # Input bar
    $g.FillRectangle($bCard, 305, 630, 470, 38)
    $g.DrawRectangle($pBorder, 305, 630, 470, 38)
    $g.DrawString("Nhap cau hoi hoac thu thach ca la cho AI...", $fBody, $bMuted, 318, 640)
    $g.FillRectangle($bPrimary, 785, 630, 75, 38)
    $g.DrawString("Gui", $fHeading, $bWhite, 810, 640)

    # Right Inspector Panel
    $g.FillRectangle($bCard, 890, 108, 295, 655)
    $g.DrawRectangle($pBorder, 890, 108, 295, 655)
    $g.DrawString("MA TRAN MUC TU CHU (COST-OF-ERROR)", $fSmall, $bMuted, 905, 120)

    $g.DrawString("tra_cuu_tai_lieu -> Tu lam (Chi doc)", $fSmall, $bText, 905, 145)
    $g.DrawString("goi_y_bai_tap -> Kiem soat (Cam lo so)", $fSmall, $bText, 905, 170)
    $g.DrawString("chuyen_TA -> Tu lam (Hen 08:30)", $fSmall, $bText, 905, 195)
    $g.DrawString("dang_FAQ -> CAM (Lan truyen ca lop)", $fSmall, (New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(185, 28, 28))), 905, 220)
    $g.DrawString("duyet_dang_FAQ -> Can TA duyet", $fSmall, (New-Object System.Drawing.SolidBrush($cAmberText)), 905, 245)
    $g.DrawLine($pBorder, 905, 270, 1170, 270)

    $g.DrawString("VI TRI NGUYEN TAC HAX / PAIR", $fSmall, $bMuted, 905, 285)
    $g.DrawString("[1] HAX G1: Banner danh tinh & gioi han", $fSmall, $bText, 905, 310)
    $g.DrawString("[2] HAX G2: Huy hieu do chac chan 3.3", $fSmall, $bText, 905, 335)
    $g.DrawString("[3] HAX G11 + PAIR: Trich dan ma muc", $fSmall, $bText, 905, 360)
    $g.DrawString("[4] HAX G10: Thu hep pham vi Socratic", $fSmall, $bText, 905, 385)
    $g.DrawString("[5] HAX G8/G9: Nut sua & thao tac nhanh", $fSmall, $bText, 905, 410)
    $g.DrawString("[6] PAIR Failure: Ticket chuyen TA ban dem", $fSmall, $bText, 905, 435)
    $g.DrawString("[7] PAIR Oversight: Man hinh TA duyet FAQ", $fSmall, $bText, 905, 460)
    $g.DrawString("[8] HAX G15: Thanh kich ban & Live AI", $fSmall, $bText, 905, 485)

    $g.FillRectangle((New-Object System.Drawing.SolidBrush($cBlueBg)), 905, 520, 265, 165)
    $g.DrawRectangle((New-Object System.Drawing.Pen($cBlueBorder, 1)), 905, 520, 265, 165)
    $g.DrawString("LOI HUA CUA NHOM EDU (BAN 5 - L3B):", $fSmall, (New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(30, 64, 175))), 915, 532)
    $g.DrawString("'Dong hanh dan dat ban tu hoc", $fSmall, $bText, 915, 555)
    $g.DrawString("moi luc dem muon, trung thuc voi tri thuc", $fSmall, $bText, 915, 575)
    $g.DrawString("giao trinh, kien quyet khong lam thay", $fSmall, $bText, 915, 595)
    $g.DrawString("bai tap ban dang mo.'", $fSmall, $bText, 915, 615)
    $g.DrawString("Thanh vien: Nhung - Dat - Thanh", $fSmall, (New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(37, 99, 235))), 915, 645)

    $bmp.Save("D:\K5-L3-Day05-AI-Product-UX-Autonomy\prototype\preview-student.png", [System.Drawing.Imaging.ImageFormat]::Png)
    $g.Dispose()
    $bmp.Dispose()
}

function Draw-TA-Preview {
    $bmp = New-Object System.Drawing.Bitmap 1200, 780
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $g.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::ClearTypeGridFit

    $cBg = [System.Drawing.Color]::FromArgb(248, 250, 252)
    $cHeader = [System.Drawing.Color]::FromArgb(15, 23, 42)
    $cPrimary = [System.Drawing.Color]::FromArgb(37, 99, 235)
    $cCard = [System.Drawing.Color]::White
    $cBorder = [System.Drawing.Color]::FromArgb(226, 232, 240)
    $cPin = [System.Drawing.Color]::FromArgb(234, 88, 12)
    $cText = [System.Drawing.Color]::FromArgb(30, 41, 59)
    $cMuted = [System.Drawing.Color]::FromArgb(100, 116, 139)

    $bBg = New-Object System.Drawing.SolidBrush($cBg)
    $bHeader = New-Object System.Drawing.SolidBrush($cHeader)
    $bPrimary = New-Object System.Drawing.SolidBrush($cPrimary)
    $bCard = New-Object System.Drawing.SolidBrush($cCard)
    $bPin = New-Object System.Drawing.SolidBrush($cPin)
    $bText = New-Object System.Drawing.SolidBrush($cText)
    $bMuted = New-Object System.Drawing.SolidBrush($cMuted)
    $bWhite = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::White)
    $pBorder = New-Object System.Drawing.Pen($cBorder, 1)

    $fTitle = New-Object System.Drawing.Font("Segoe UI", 12.5, [System.Drawing.FontStyle]::Bold)
    $fHeading = New-Object System.Drawing.Font("Segoe UI", 10.5, [System.Drawing.FontStyle]::Bold)
    $fBody = New-Object System.Drawing.Font("Segoe UI", 9.5, [System.Drawing.FontStyle]::Regular)
    $fBodyBold = New-Object System.Drawing.Font("Segoe UI", 9.5, [System.Drawing.FontStyle]::Bold)
    $fSmall = New-Object System.Drawing.Font("Segoe UI", 8.5, [System.Drawing.FontStyle]::Regular)
    $fPin = New-Object System.Drawing.Font("Segoe UI", 8, [System.Drawing.FontStyle]::Bold)

    $g.FillRectangle($bBg, 0, 0, 1200, 780)

    # Header
    $g.FillRectangle($bHeader, 0, 0, 1200, 56)
    $g.DrawString("EDU Study Mode - Ban truc TA (Track 2 - Nhom EDU)", $fTitle, $bWhite, 20, 16)

    $bTag2 = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(51, 65, 85))
    $g.FillRectangle($bTag2, 490, 17, 210, 22)
    $g.DrawString("L3B - Ban 5: Nhung - Dat - Thanh", $fSmall, (New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(147, 197, 253))), 496, 20)

    # Tabs (TA Active)
    $bTabBg = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(30, 41, 59))
    $g.FillRectangle($bTabBg, 740, 14, 230, 30)
    $g.DrawString("Hoc vien (Dem)", $fHeading, $bMuted, 750, 20)
    $g.FillRectangle($bPrimary, 855, 16, 113, 26)
    $g.DrawString("Ban truc TA (2)", $fHeading, $bWhite, 868, 20)

    # TA Sub-banner
    $g.FillRectangle($bCard, 30, 75, 1140, 55)
    $g.DrawRectangle($pBorder, 30, 75, 1140, 55)
    $g.DrawString("BANG DIEU KHIEN TRO GIANG (TA QUEUE) - BONUS MAN HINH TA", $fHeading, $bText, 50, 88)
    $g.DrawString("Quan ly cau hoi chuyen dem muon va phe duyet dang FAQ lop hoc truoc khi phat hanh. (TA truc: Nguyen Minh Thanh)", $fSmall, $bMuted, 50, 108)

    # 2 Big Cards
    # Left: Tickets Queue [6]
    $g.FillRectangle($bCard, 30, 145, 555, 605)
    $g.DrawRectangle($pBorder, 30, 145, 555, 605)
    $g.FillEllipse($bPin, 50, 165, 20, 20)
    $g.DrawString("6", $fPin, $bWhite, 56, 168)
    $g.DrawString("HANG CHO CAU HOI CHUYEN DEM MUON (2)", $fHeading, $bText, 78, 168)

    # Ticket 1
    $bRedBg = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 245, 245))
    $g.FillRectangle($bRedBg, 50, 205, 515, 230)
    $g.DrawRectangle((New-Object System.Drawing.Pen([System.Drawing.Color]::FromArgb(252, 165, 165), 1)), 50, 205, 515, 230)
    $g.DrawString("UU TIEN CAO - NGHI VAN TAI LIEU 3.3", $fSmall, (New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(185, 28, 28))), 65, 218)
    $g.DrawString("Ma #TA-301 - Hoc vien: Vo Thi Phuong Nhung (2A202603918)", $fBodyBold, $bText, 65, 240)
    $g.DrawString("Cau hoi: '3.3 ghi do lech chuan luon nho hon phuong sai, nhung 0.25 can ra 0.5 lon hon?'", $fSmall, $bText, 65, 260)
    $g.DrawString("AI phan tich: Hoc vien phan anh dung. De xuat chuyen Giang vien sua giao trinh.", $fSmall, (New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(71, 85, 105))), 65, 290)
    $g.FillRectangle($bPrimary, 65, 380, 210, 32)
    $g.DrawString("Chuyen Giang vien dinh chinh", $fSmall, $bWhite, 80, 388)

    # Ticket 2
    $g.FillRectangle($bCard, 50, 455, 515, 120)
    $g.DrawRectangle($pBorder, 50, 455, 515, 120)
    $g.DrawString("CAU HOI THUONG - Ma #TA-302", $fSmall, (New-Object System.Drawing.SolidBrush($cPrimary)), 65, 468)
    $g.DrawString("Hoc vien: Nguyen Tien Dat (2A202603922) - 'Luong am thi tinh trung vi the nao?'", $fSmall, $bText, 65, 490)
    $g.FillRectangle($bCard, 65, 525, 140, 30)
    $g.DrawRectangle($pBorder, 65, 525, 140, 30)
    $g.DrawString("Mo hop thoai xu ly", $fSmall, $bText, 78, 532)

    # Right: FAQ Approval [7]
    $g.FillRectangle($bCard, 615, 145, 555, 605)
    $g.DrawRectangle($pBorder, 615, 145, 555, 605)
    $g.FillEllipse($bPin, 635, 165, 20, 20)
    $g.DrawString("7", $fPin, $bWhite, 641, 168)
    $g.DrawString("PHE DUYET DANG FAQ TOAN LOP (Tool duyet_dang_FAQ)", $fHeading, $bText, 663, 168)

    # Warning Box
    $g.FillRectangle((New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(254, 242, 242))), 635, 205, 515, 55)
    $g.DrawRectangle((New-Object System.Drawing.Pen([System.Drawing.Color]::FromArgb(254, 202, 202), 1)), 635, 205, 515, 55)
    $g.DrawString("QUY TAC AN TOAN: AI bi CAM tu y goi dang_FAQ ra ca lop.", $fSmall, (New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(153, 27, 27))), 650, 215)
    $g.DrawString("AI chi duoc soan du thao (soan_du_thao_FAQ). TA phai bam duyet truoc khi phat hanh!", $fSmall, (New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(153, 27, 27))), 650, 233)

    # Draft Card
    $g.FillRectangle($bCard, 635, 280, 515, 290)
    $g.DrawRectangle($pBorder, 635, 280, 515, 290)
    $g.DrawString("BAN THAO AI SOAN SAN (CHO DUYET)", $fSmall, (New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(180, 83, 9))), 650, 295)
    $g.DrawString("Tieu de: Luu y ve quan he giua Phuong sai va Do lech chuan (3.3)", $fBodyBold, $bText, 650, 320)
    $g.DrawString("'Chao ca lop, tai muc 3.3 co cau: do lech chuan luon nho hon phuong sai.", $fSmall, $bText, 650, 350)
    $g.DrawString("Xin luu y dinh chinh: Quy tac nay chi dung khi phuong sai > 1.", $fSmall, $bText, 650, 370)
    $g.DrawString("Voi phuong sai trong khoang (0, 1), vi du 0.25, thi can ra 0.5 lon hon.'", $fSmall, $bText, 650, 390)

    # Buttons
    $bGreen = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(21, 128, 61))
    $g.FillRectangle($bGreen, 650, 500, 190, 34)
    $g.DrawString("Duyet phat hanh toan lop", $fSmall, $bWhite, 665, 510)

    $bRed = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(239, 68, 68))
    $g.FillRectangle($bRed, 850, 500, 120, 34)
    $g.DrawString("Tu choi / Huy", $fSmall, $bWhite, 868, 510)

    # Success benefit
    $g.FillRectangle((New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(240, 253, 244))), 635, 595, 515, 60)
    $g.DrawString("LOI ICH HUMAN-IN-THE-LOOP: Tiet kiem 90% thoi gian soan bai cho TA,", $fSmall, (New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(21, 128, 61))), 650, 610)
    $g.DrawString("dong thoi ngan chan 100% rui ro phat tan kien thuc sai lech ra 65 hoc vien.", $fSmall, (New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(21, 128, 61))), 650, 630)

    $bmp.Save("D:\K5-L3-Day05-AI-Product-UX-Autonomy\prototype\preview-ta.png", [System.Drawing.Imaging.ImageFormat]::Png)
    $g.Dispose()
    $bmp.Dispose()
}

Draw-Student-Preview
Draw-TA-Preview
Write-Host "Both previews generated successfully!"