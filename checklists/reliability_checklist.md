# Reliability Checklist - Notification

- [x] Có test `/health`.
- [x] Có test thiếu token trả 401.
- [x] Có test payload sai trả 422.
- [x] Có duplicate/dedupe scenario.
- [x] Có retry endpoint.
- [x] Có Problem Details cho lỗi.
- [x] Không hardcode secret thật.
- [x] Dùng biến môi trường trong Postman environment.
