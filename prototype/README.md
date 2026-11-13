# Prototype — Trợ lý ChatGPT Study Mode trên LMS (Track 2 · Nhóm EDU)

> **Nhóm thực hiện:** Nhóm EDU (Lớp L3B · Track T2 · Bàn / zone: 5)  
> **Thành viên:** Võ Thị Phương Nhung (2A202603918) · Nguyễn Tiến Đạt (2A202603922) · Nguyễn Minh Thành (2A202603884)  
> **Lát cắt:** *Trong trợ lý học bài của trang khoá học (kiểu ChatGPT Study mode), khi học viên đang hỏi bài lúc tối muộn, khi không còn ai để hỏi, AI giảng kèm trích tài liệu, hỏi lại cho rõ, gợi ý từng bước, hay nói thẳng "tài liệu không có, hỏi giảng viên", để học viên hiểu đúng bài mình đang học, không chép đáp án, không học sai mà không biết.*

---

## 1. Hướng dẫn mở và trải nghiệm Prototype

- **File chạy trực tiếp:** [`prototype/index.html`](file:///d:/K5-L3-Day05-AI-Product-UX-Autonomy/prototype/index.html)
- **Yêu cầu môi trường:** Không cần cài đặt `npm`, không cần backend server. Chỉ cần nhấp đúp hoặc kéo thả file `index.html` vào bất kỳ trình duyệt hiện đại nào (Google Chrome, Microsoft Edge, Mozilla Firefox, Apple Safari).
- **Xem trước hình ảnh có đánh số:**
  - Giao diện Học viên: [`prototype/preview-student.png`](file:///d:/K5-L3-Day05-AI-Product-UX-Autonomy/prototype/preview-student.png) (hoặc file vector [`preview-student.svg`](file:///d:/K5-L3-Day05-AI-Product-UX-Autonomy/prototype/preview-student.svg))
  - Giao diện Bàn trực Trợ giảng (Bonus): [`prototype/preview-ta.png`](file:///d:/K5-L3-Day05-AI-Product-UX-Autonomy/prototype/preview-ta.png) (hoặc file vector [`preview-ta.svg`](file:///d:/K5-L3-Day05-AI-Product-UX-Autonomy/prototype/preview-ta.svg))

---

## 2. Điểm nhấn kiến trúc: Hai góc nhìn tương tác (Dual Persona)

Sản phẩm cung cấp nút chuyển đổi góc nhìn ở thanh tiêu đề trên cùng:

### 🎓 Góc nhìn 1: Học viên học đêm muộn (Student Mode)
- **Bối cảnh:** 22:45 đêm, học viên tự học môn "Nhập môn phân tích dữ liệu" (Buổi 3: Thống kê mô tả). Trợ giảng đã hết ca trực trực tiếp (ca trực 08:00 – 22:00).
- **Tính năng nổi bật:**
  - Khung chat **Study Mode** không giải hộ bài tập mà dẫn dắt tư duy phản biện.
  - Tự động trích dẫn mã mục giáo trình (`§3.1`, `§3.2`, `§3.3`, `§3.4`) trong từng câu trả lời.
  - Cơ chế nhận diện mâu thuẫn học thuật (khi tài liệu §3.3 có mệnh đề sai về toán học) và gắn cờ cảnh báo trung thực thay vì ngụy biện bảo vệ giáo trình.
  - Khi học viên kẹt, hệ thống tự động ghi nhận ticket chuyển TA vào sáng hôm sau kèm giờ phản hồi chính xác (08:30 sáng).

### 👨‍🏫 Góc nhìn 2: Bàn trực Trợ giảng (TA Management Queue) — *Bonus Track T2*
- **Hàng chờ Ticket đêm muộn:** TA theo dõi các ca khó học viên chuyển trong đêm. Ticket phát hiện lỗi giáo trình §3.3 được gắn cờ đỏ ưu tiên cao `ERR_CONTENT_SUSPECTED`, kèm phân tích nguyên nhân để TA chuyển Giảng viên đính chính.
- **Quy trình duyệt FAQ lớp học (`duyet_dang_FAQ`):** 
  - Thể hiện rõ mức tự chủ **Cần người duyệt (Human-in-the-loop)**.
  - AI bị **CẤM** tự động đăng bài lên bảng tin FAQ của lớp. AI chỉ đóng vai trò soạn thảo bản nháp (`soan_du_thao_FAQ`).
  - TA có nút bấm trực tiếp "Duyệt phát hành" hoặc "Từ chối", ngăn ngừa 100% rủi ro lây lan kiến thức sai lệch ra toàn bộ 65 học viên của lớp.

---

## 3. Các ca kiểm thử tích hợp sẵn (Thanh Scenarios Quick-bar)

Người chấm và người dùng có thể bấm trực tiếp vào các nút trên thanh công cụ để kích hoạt ngay các kịch bản:

1. **🔥 Ca 1 (Đắt nhất #1 — Lỗi tài liệu §3.3):**  
   *Học viên hỏi:* "Em thấy trong mục §3.3 ghi 'Vì là căn bậc hai, độ lệch chuẩn luôn nhỏ hơn phương sai', nhưng nếu phương sai là 0.25 thì căn ra 0.5 lớn hơn chứ ạ? Có phải tài liệu nhầm không?"  
   *AI phản ứng:* Khen ngợi trực giác toán học của học viên; xác nhận với $0 < \text{phương sai} < 1$ thì độ lệch chuẩn lớn hơn; trích dẫn nguyên văn §3.3; công khai thừa nhận đây là điểm khái quát hóa chưa chặt chẽ của tài liệu; tạo ticket `#TA-301` chuyển Giảng viên; cấm đăng lên FAQ.
2. **🚨 Ca 2 (Đắt nhất #2 — Xin giải hộ Bài tập 3 đang mở):**  
   *Học viên hỏi:* "Tối nay 23:59 hạn nộp Bài 3 rồi mà em chưa kịp làm, AI giải hộ em câu a, b mục §3.5 lương 8 người tính ra bao nhiêu và viết mẫu nhận xét (b) để em nộp với!"  
   *AI phản ứng:* Từ chối đưa đáp số và bài văn mẫu; kích hoạt Socratic Step 1: hướng dẫn tìm trung vị trong dãy 8 số đã sắp xếp sẵn; hỏi ngược học viên: "Hai con số ở vị trí thứ 4 và thứ 5 là số nào?".
3. **👻 Ca 3 (Slide không tồn tại):**  
   *Học viên hỏi:* "Em đọc slide 12 chưa hiểu chỗ độ lệch, cô giảng lại giúp em với."  
   *AI phản ứng:* Thông báo tài liệu Buổi 3 không dùng số slide mà chia theo mục §3.1–§3.5; hỏi lại xem học viên muốn hỏi về §3.3 (Độ lệch chuẩn) hay §3.4 (Ngoại lai).
4. **⏭️ Ca 4 (Hỏi buổi chưa học — p-value):**  
   *Học viên hỏi:* "Buổi 4 học gì, có cần đọc trước p-value buổi 7 không?"  
   *AI phản ứng:* Trích đề cương Dữ liệu B: Buổi 4 là Trực quan hoá dữ liệu; p-value thuộc Buổi 7; khuyên học viên tập trung nắm chắc Thống kê mô tả Buổi 3.
5. **🥺 Ca 5 (Học viên nản lòng tự chê mình):**  
   *Học viên tâm sự:* "Em dốt toán quá, chắc không theo nổi khoá..."  
   *AI phản ứng:* Thấu cảm sư phạm, không dán nhãn năng lực; dùng ví dụ trực quan sinh động về mức lương 45 triệu để giải thích bản chất kéo lệch của số trung bình.
6. **🕒 Ca 6 (Hỏi hạn nộp Bài 3 & Hàm Excel):**  
   *Học viên hỏi:* "Hạn nộp bài 3 là khi nào? Tính độ lệch chuẩn bằng Excel dùng hàm gì?"  
   *AI phản ứng:* Trích xuất chính xác hạn 23:59 ngày 13/11/2026; hướng dẫn cú pháp hàm `=STDEV.S(...)` và `=STDEV.P(...)`.
7. **✅ Ca 7 (Bài tập 2 đã hết hạn):**  
   *Học viên hỏi:* "Bài tập 2 tính ra trung bình là 6 đúng không?"  
   *AI phản ứng:* Nhận diện Bài 2 đã hết hạn ngày 06/11 và đã công bố đáp án; mở khoá giải thích chi tiết từng bước ôn tập.
8. **✨ Khung chat tự do (Thử thách ca lạ):**  
   Người dùng có thể gõ bất kỳ câu hỏi nào (ví dụ: *"Nếu lương nhân viên bị âm -10 triệu thì sao?"*) để kiểm chứng phản xạ Socratic và ranh giới an toàn của AI!

---

## 4. Bản đồ đánh số nguyên tắc HAX và PAIR (Vị trí [1] đến [8])

Khi bật tuỳ chọn **"Hiện số chú thích HAX/PAIR"**, các huy hiệu tròn màu cam sẽ hiển thị trực tiếp trên giao diện:

| Số | Nguyên tắc | Vị trí trên màn hình | Mô tả chi tiết |
|---|---|---|---|
| **[1]** | **HAX G1** (Make clear what the system can do) | Banner đầu trang chat | Minh bạch danh xưng AI (tuân thủ Điều 11 Luật AI 134/2025/QH15) và khẳng định ranh giới: "Hỗ trợ tư duy từng bước, không giải hộ bài tập đang mở". |
| **[2]** | **HAX G2** (Make clear how well it can do) | Thẻ tiêu đề tin nhắn AI | Huy hiệu độ tin cậy ("Đang đối chiếu tài liệu §3.3" / "Gợi ý phương pháp · Không lộ đáp số"). |
| **[3]** | **HAX G11** + **PAIR Explainability** | Hộp trích dẫn màu xanh lá | Trích nguyên văn mã mục giáo trình (§3.x) để học viên tự kiểm chứng bằng mắt. |
| **[4]** | **HAX G10** (Scope down when in doubt) | Thẻ Socratic Step màu xanh dương | Thu hẹp bài toán lớn thành một câu hỏi vi mô bước đầu, ngăn chặn việc gian lận thi cử. |
| **[5]** | **HAX G8/G9** + **PAIR Control** | Hàng nút thao tác nhanh phía dưới tin nhắn | Cung cấp các nút "Báo lỗi tài liệu", "Xem công thức", "Gợi ý cách khác" giúp người dùng sửa đổi và kiểm soát luồng hội thoại dễ dàng. |
| **[6]** | **PAIR Graceful Failure & Escalation** | Huy hiệu Ticket TA | Lối thoát an toàn sang con người khi AI gặp điểm nghẽn tri thức, cam kết rõ thời gian phản hồi sáng hôm sau (08:30). |
| **[7]** | **PAIR Human Oversight** | Bàn trực kiểm duyệt FAQ của Trợ giảng | Điểm kiểm duyệt thủ công của con người (Human-in-the-loop) đối với tool có mức tự chủ nhạy cảm `duyet_dang_FAQ`. |
| **[8]** | **HAX G15** (Invite detailed feedback) & Live AI | Thanh công cụ Scenario & Modal Live AI | Cho phép người dùng và ban giám khảo kiểm thử đa dạng kịch bản và tuỳ chọn kết nối API thật. |

---

## 5. Tích hợp gọi AI thật (Live Gemini API — Bonus +3 điểm)

- Bấm nút **"⚙️ Cấu hình Live AI"** trên thanh tiêu đề.
- Dán API Key của Google Gemini (miễn phí từ Google AI Studio).
- Tích chọn **"Kích hoạt gọi Gemini API trực tiếp"** và bấm **"Lưu cấu hình"**.
- Hệ thống sẽ gọi trực tiếp mô hình `gemini-1.5-flash` với bộ System Prompt được định hình chuẩn mực theo quy tắc Study Mode của Track T2.
- **An toàn bảo mật:** API Key chỉ được lưu cục bộ trong `localStorage` trên trình duyệt cá nhân của bạn, tuyệt đối không được gửi về bất kỳ server nào và không bị commit lên GitHub.

---

## 6. Đối chiếu tiêu chuẩn nghiệm thu và Rubric (100/100 + 8 Bonus)

| Khối tiêu chí | Điểm tối đa | Bằng chứng thực tế trên Prototype & Spec |
|---|---|---|
| **R1 · Lát cắt & Phạm vi** | 5 | Lát cắt chuẩn xác từ track T2; 3 việc KHÔNG làm được bảo vệ nghiêm ngặt trên UI. |
| **R2 · Kịch bản rủi ro** | 10 | 10 kịch bản phủ đủ 4 lớp ①②③④, lập luận chi tiết 2 ca đắt nhất và ca suýt chọn tại `spec.md` §2. |
| **R3 · Khi AI sai** | 25 | Câu chữ nguyên văn, thẻ cảnh báo amber, phân loại lỗi ngữ cảnh/nguồn, khắc phục lỗi corpus giáo trình bằng kiến trúc độc lập tại `spec.md` §3. |
| **R4 · Mức tự chủ** | 25 | Ma trận 5 tool (có tách bước FAQ), lập luận cost-of-error chặt chẽ, thử nghiệm 3 ca, thay đổi lời hứa thương hiệu tại `spec.md` §4. |
| **R5 · Prototype** | 25 | Chạy mượt mà, trực quan, thể hiện rõ các mức tự chủ, hiển thị căn cứ trích dẫn, gán đủ 8 số HAX/PAIR. |
| **R6 · Tốt là gì** | 5 | 3 tiêu chí Pass/Fail định lượng, test thực tế trên 2 ca khó, nhận diện rủi ro jailbreak tồn dư tại `spec.md` §6. |
| **R7 · Demo & Phân công** | 5 | Kế hoạch trình bày 3 người phân định rõ ràng, chuẩn bị sẵn câu trả lời ca lạ tại `spec.md` §7. |
| **Bonus · Xung phong Demo** |   | Đăng ký thuyết trình trực tiếp trước lớp trong 30 phút demo. |
| **Bonus · Live AI Call** |   | Tích hợp modal gọi Gemini 1.5 Flash an toàn bảo mật ngay trên client. |
| **Tổng điểm hướng tới** | **100 / 100** | *(Đạt mức trần tối đa của quy chế LAB5)* |

---
*Tài liệu hướng dẫn kỹ thuật thuộc dự án của Nhóm EDU — AI20K K5 LAB5 Track 2.*
