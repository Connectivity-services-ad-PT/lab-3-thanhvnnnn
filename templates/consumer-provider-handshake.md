# Consumer / Provider Handshake - Core Business → Notification

## 1. Thông tin

- Consumer: Core Business
- Provider: Notification Service
- Cơ chế: Queue async, Lab 03 mô phỏng bằng OpenAPI mock
- Base URL mock: `http://localhost:4010`
- Base URL local: `http://localhost:8000`

## 2. Payload đã thống nhất

```json
{
  "alert_id": "ALERT-20260617-0001",
  "target": { "kind": "user", "user_id": "staff-security-01" },
  "channels": ["push", "sms", "email"],
  "priority": "critical",
  "title": "Motion detected after hours",
  "message": "Camera CAM-A01 detected motion in Library Zone B.",
  "dedupe_key": "motion:CAM-A01:20260617T210000"
}
```

## 3. Header

```text
Authorization: Bearer local-dev-token
X-Trace-Id: trace-lab-notify-001
```

## 4. Kết quả mong đợi

- Hợp lệ: `202 Accepted`, có `notification_id`.
- Duplicate: `200 OK`, status `duplicate`.
- Thiếu token: `401` Problem Details.
- Payload sai: `422` Problem Details.

## 5. Sign-off

| Vai trò | Nhóm | Đồng ý |
|---|---|---|
| Consumer | Core Business | Yes |
| Provider | Notification | Yes |
| Witness | Giảng viên/nhóm demo | Pending |
