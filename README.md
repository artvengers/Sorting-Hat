# วิธีการใช้งาน Application
Application นี้เขียนด้วยภาษา Swift โดยใช้ UIKIT สามารถทดสอบ Application ได้ผ่านทางโปรแกรม Xcode โดยสิ่งที่ใช้ในการทำ Application นี้ เช่น การเชื่อมต่อ API  การรับค่าจาก Text Field การใช้ Button การใช้ Table View, Scroll View,  Auto Layout
โดยการทำงาน Application หลักๆคือ มีระบบที่คัดสรร ให้แต่ละสถาบันใน 4 king มีคนเฉลี่ยเท่าๆกัน
โดย Application ของเราจะสามารถใช้งานหลักๆได้ 3 รูปแบบ
1. ใส่จำนวนคนแล้ว Application จะเชื่อม API แล้วสุ่มชื่อคนมาให้
2. Application จะสุ่มจำนวนคน และ เชื่อม API สุ่มชื่อคนมาให้
3. ใส่จำนวนคน และ ใส่ชื่อคน โดยผู้ใช้
##  การใช้ Application
### ในหน้าจอแรกของ Application
1. จะมีปุ่มให้เลือกว่าจะเลื่อกให้ Application ทำการสุ่มชื่อมาให้ หรือ จะใส่ชื่อเอง โดยถ้าเลื่อกปุ่มไหน ปุ่มนั้นจะสีเขียว
2.  ถ้าหากเราเลือกปุ่ม "สุ่มชื่อ" จะเลือกได้ว่า จะใส่จำนวนคน (การใส่จำนวนคน หากเราใส่ค่าที่ไม่ใช่ตัวเลขไป Application จะถือว่า ใส่จำนวน 0 คน และ สามารถใส่ได้สูงสุด 5,000 คน) หรือ ว่าจะให้ Application สุ่มจำนวนคนมาให้(เรากำหนดให้สุ่มจำนวนคนตั้งแต่ 0-5,000 คน) ถ้าหากเราอยากใส่จำนวนคนเอง ให้พิมพ์จำนวนคนที่ต้องการเมื่อใส่เสร็จแล้วให้กดปุ่มยืนยัน แต่ถ้าหาก เลือกกดปุ่ม "สุ่มจำนวนคน"  Application ก็จะสุ่มจำนวนคนมาให้ จากนั้น Application ก็จะคัดสรรคนไปในแต่ละสถาบัน ให้คนเท่าๆกัน และไปสู่หน้าถัดไป
3. ถ้าหากเราเลือกปุ่ม "ใส่ชื่อ" ให้ใส่จำนวนคนไปในช่อง แล้วกดยืนยันหลังจากใส่ชื่อคนแล้วให้ใส่ชื่อที่ต้องการไปแล้วกดยืนยัน (ใส่ชื่อทีละคนแล้วกดยืนยัน)
4. เมื่อกดปุ่มให้เริ่มคัดสรรแล้ว ถ้าอยากคัดสรรใหม่ ต้องกดปุ่ม "Reset"
5. ถ้าหากผู้ใช้  Application ปัดจอมาหน้าแรกโดยไม่กดปุ่ม "กลับไปสุ่ม" จะมีคำแนะนำขึ้นมา แล้วให้กดปุ่ม "Reset" ถ้าหากอยากเริ่มการทำงานใหม่
### ในหน้าจอที่สองของ Application
เมื่อเราทำการกดยืนยัน,สุ่มจำนวนคน หรือ ใส่รายชื่อคนมาแล้ว Application ก็จะมาในหน้าที่สอง โดยในหน้านี้ จะแสดงว่า แต่ละสถาบันมีจำนวนคนทั้งหมดกี่คน และสามารถกดที่ปุ่ม "ดูรายชื่อ" เพื่อดูรายชื่อคนที่อยู่ในแต่ละสถาบันได้
และในส่วนล่างสุด จะมีบอกว่าจำนวนคนทั้งหมดมีกี่คนและมีปุ่ม"กลับไปสุ่มใหม่" เผื่อที่จะกลับไปสุ่มหรือใส่จำนวนคน ได้อีก
### ในหน้าจอที่แสดงรายชื่อของแต่ละสถาบัน
สามารถปัดหน้าจอลงมาแล้วกลับมาดูรายชื่อในสถาบันอื่นได้

### ส่วนอื่นๆของ Application
จะมีส่วนของ LaunchScreen เป็นหน้าจอรอระหว่างเข้า App และ App Icon

### ตัวอย่าง การ Run Application
https://www.youtube.com/watch?v=9ygMS6wPg4M&t=48s
### คำแนะนำอื่นๆ
ความเร็วในการประมวลผลขึ้นอยู่กับจำนวนคนที่ใส่ไป หากใส่จำนวน หรือ สุ่มได้จำนวน 5,000 คน อาจใช้เวลาประมวลผลนานกว่าการใส่จำนวนน้อยๆ
