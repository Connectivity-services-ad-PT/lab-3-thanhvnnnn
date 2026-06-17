# Consumer-side Testing - Notification Service

Consumer giả định là Core Business. Khi Core chưa nối queue thật, Core có thể gọi mock server của Notification để kiểm tra payload alert.

## Lệnh chạy mock

```bash
npm run mock:notification
```

## Lệnh test

```bash
npm run test:mock
```

## Điểm cần chứng minh

- Core gửi đúng `alert_id`, `target`, `channels`, `priority`, `title`, `message`.
- Notification trả `notification_id` và `status`.
- Payload sai bị trả `422`.
- Thiếu token bị trả `401`.
- Có `X-Trace-Id` để đối chiếu log demo.
