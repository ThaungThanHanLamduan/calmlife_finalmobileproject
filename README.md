
# 📱 แบบฟอร์มส่งงานสอบ Take-home | Take-home Assignment Template
**ชื่อ - นามสกุล (Full Name):**  
THAUNG THAN HAN

**รหัสนักศึกษา (Student ID):**  
6631503091

**ชื่อแอป (App Name):**  
CalmLife

**Framework ที่ใช้ (Framework Used):** Flutter / React Native / อื่น ๆ  
Flutter

**ลิงก์ GitHub Repository:** https://github.com/ThaungThanHanLamduan/calmlife_finalmobileproject

**ลิงก์ไฟล์ติดตั้ง (APK/IPA):** https://drive.google.com/file/d/10O3wd_1Jt2SUrKew5GzVZQ2zyosk8-xv/view?usp=sharing

---

## 1. การออกแบบแอป | App Concept and Design (2 คะแนน / 2 pts)

### 1.1 ผู้ใช้งานเป้าหมาย | User Personas  

```markdown
Persona 1:  
- ชื่อ: Pim  
- อายุ: 20 years old
- อาชีพ: Office worker  
- ความต้องการ: Wants to reduce daily stress through meditation

Persona 2:  
- ชื่อ: Ton  
- อายุ: 29 years old
- อาชีพ: Freelancer  
- ความต้องการ: Wants an app to help practice mindfulness before bedtime
```

### 1.2 เป้าหมายของแอป | App Goals  

```markdown
- Help users practice meditation and relaxation
- Save meditation session history
- Allow users to select ambient background sounds during meditation
```

### 1.3 โครงร่างหน้าจอ / Mockup  
**ใส่รูปภาพ หรือคำอธิบายแต่ละหน้าหลัก 3 หน้า | Attach image or describe 3 main pages**
![Main Screen](https://raw.githubusercontent.com/ThaungThanHanLamduan/calmlife_finalmobileproject/refs/heads/main/assets/image/first.png)
```markdown
This page is for choosing the duration and ambient music for meditation.
```
![History](https://raw.githubusercontent.com/ThaungThanHanLamduan/calmlife_finalmobileproject/refs/heads/main/assets/image/third.png)
```markdown
This page is for checking history of the meditations user has done.
```
![Guide](https://raw.githubusercontent.com/ThaungThanHanLamduan/calmlife_finalmobileproject/refs/heads/main/assets/image/fourth.png)
```markdown
This page is for guiding users on how to meditate the right way.
```
### 1.4 การไหลของผู้ใช้งาน | User Flow  
**ตัวอย่าง (Example):**
```markdown
Open app → Select meditation time → Choose ambient sound → Start meditation → View meditation history
```

---

## 2. การพัฒนาแอป | App Implementation (4 คะแนน / 4 pts)

### 2.1 รายละเอียดการพัฒนา | Development Details  
**เครื่องมือที่ใช้ / Tools used:**
```markdown
- Flutter 3.27.3
- Dart 3.6.1
- Package: flutter_launcher_icons, audioplayers, cupertino_icons
```

### 2.2 ฟังก์ชันที่พัฒนา | Features Implemented  
**Checklist:**
- [x] Select meditation duration (5 / 10 / 30 minutes)
- [x] Select ambient background sounds (calm / forest / ocean / rain)
- [x] Display elapsed meditation time
- [x] Record meditation session history

### 2.3 ภาพหน้าจอแอป | App Screenshots  
**แนบภาพหรือ URL (Attach images or image links):**

![Main Screen](https://raw.githubusercontent.com/ThaungThanHanLamduan/calmlife_finalmobileproject/refs/heads/main/assets/image/first.png)
![Timer](https://raw.githubusercontent.com/ThaungThanHanLamduan/calmlife_finalmobileproject/refs/heads/main/assets/image/second.png)
![History](https://raw.githubusercontent.com/ThaungThanHanLamduan/calmlife_finalmobileproject/refs/heads/main/assets/image/third.png)
![Guide](https://raw.githubusercontent.com/ThaungThanHanLamduan/calmlife_finalmobileproject/refs/heads/main/assets/image/fourth.png)

---

## 3. การ Build และติดตั้งแอป | Deployment (2 คะแนน / 2 pts)

### 3.1 ประเภท Build | Build Type
- [x] Debug  
- [ ] Release  

### 3.2 แพลตฟอร์มที่ทดสอบ | Platform Tested  
- [x] Android  
- [ ] iOS  

### 3.3 ไฟล์ README และวิธีติดตั้ง | README & Install Guide  
**แนบไฟล์หรือคำอธิบายการติดตั้งแอป | Insert steps**
```markdown
1. Download the APK file
2. Open it through your Android device’s File Manager
3. Allow installation from unknown sources if prompted
4. Open the CalmLife app and start using it
```

---

## 4. การสะท้อนผลลัพธ์ | Reflection (2 คะแนน / 2 pts)

**ตัวอย่างหัวข้อ | Suggested points:**
```markdown
- Encountered challenges managing Timer and MediaPlayer integration in Flutter
- Learned in-depth usage of the audioplayers package
- If more time were available, would add a daily reminder system and notifications
```

---

## 5. การใช้ AI ช่วยพัฒนา | AI Assisted Development (Bonus / ใช้ประกอบการพิจารณา)

### 5.1 ใช้ AI ช่วยคิดไอเดีย | Idea Generation
```markdown
Prompt ที่ใช้:  
"Suggest simple and small mobile app ideas for meditation"

ผลลัพธ์:  
Got the idea for the CalmLife meditation app
```

### 5.2 ใช้ AI ช่วยออกแบบ UI | UI Layout Prompt
```markdown
Prompt ที่ใช้:  
"Create a calm and minimalistic UI design for a meditation app"

ผลลัพธ์:  
Received color and layout guidelines using teal tones and clean structure
```

### 5.3 ใช้ AI ช่วยเขียนโค้ด | Code Writing Prompt
```markdown
Prompt ที่ใช้:  
"Flutter code for a meditation app with timer, audio looping, and history recording"

ผลลัพธ์:  
Provided a basic but extendable app structure
```

### 5.4 ใช้ AI ช่วย debug | Debug Prompt
```markdown
Prompt ที่ใช้:  
"Timer is not updating in Flutter after starting meditation session"

ผลลัพธ์:  
AI recommended ensuring mounted checks and proper setState use within Timer
```

### 5.5 ใช้ AI ช่วย Deploy | Deployment Prompt
```markdown
Prompt ที่ใช้:  
"How to fix AGP version error for Flutter app with Java 21"

ผลลัพธ์:  
Got instructions to upgrade Gradle and Android Gradle Plugin to version 8.2.1
```

---

## ✅ Checklist ก่อนส่ง | Final Checklist
- [x] กรอกข้อมูลครบทุก Section  
- [x] แนบ GitHub และไฟล์ติดตั้ง  
- [x] สะท้อนผล และใช้ AI อย่างมีเหตุผล  
