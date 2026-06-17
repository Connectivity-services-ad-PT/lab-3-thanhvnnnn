# FIT4110 Lab 03 - Notification Contract Testing

## 1. Vai trò nhóm

- Service: **Notification Service** (`team-notify`)
- Consumer chính: **Core Business**
- Mục đích: nhận alert và trigger gửi thông báo đa kênh
- Cơ chế kiến trúc: Queue async, trong lab dùng OpenAPI + Prism + Postman để mô phỏng và kiểm thử sớm

## 2. Luồng demo

```text
Core Business alert
→ Notification contract /notifications
→ Validate payload + token
→ Dedupe bằng dedupe_key
→ Queue thông báo
→ Trả notification_id/status
```

## 3. Cấu trúc chính

```text
contracts/notification.openapi.yaml
postman/collections/FIT4110_lab03_notification.postman_collection.json
postman/environments/FIT4110_lab03_mock.postman_environment.json
postman/environments/FIT4110_lab03_local.postman_environment.json
mock-data/notification-valid.json
mock-data/notification-invalid-missing-message.json
mock-data/notification-boundary-high-priority.json
reports/
```

## 4. Chạy mock server

```bash
npm install
npm run mock:notification
```

Mock chạy ở:

```text
http://localhost:4010
```

## 5. Chạy Newman với mock

Mở terminal khác:

```bash
npm run test:mock
```

Kết quả report sinh vào:

```text
reports/newman-lab03-mock.html
reports/newman-lab03-mock.xml
```

## 6. Chạy với service thật

Khi Lab 04/05 đã có service thật ở port 8000:

```bash
npm run test:local
```

## 7. Test case chính

| STT | Test | Kỳ vọng |
|---:|---|---|
| 1 | `GET /health` | 200 OK |
| 2 | `POST /notifications` hợp lệ | 202 hoặc 200 nếu duplicate |
| 3 | Gửi lại cùng `dedupe_key` | Không crash, không tạo trùng vô hạn |
| 4 | `GET /notifications` | Trả `items` array |
| 5 | `GET /notifications/{id}` | Trả detail + attempts |
| 6 | `POST /notifications/{id}/retry` | 202 hoặc 409 |
| 7 | Thiếu token | 401 Problem Details |
| 8 | Payload sai schema | 422 Problem Details |

## 8. Minh chứng cần nộp

- Screenshot Prism mock chạy.
- Screenshot Newman pass.
- File report trong `reports/`.
- Screenshot request/response các case chính.
