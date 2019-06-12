/* Generated with g9. */
--
-- Run this schema script against Derby as follows:
-- java org.apache.derby.tools.ij hotelsystem-index.sql


-- ALTER TABLE and CREATE FOREIGN KEY/INDEX statements

-- Answer
ALTER TABLE Answer ADD CONSTRAINT Answer_question_idF FOREIGN KEY (question_id) REFERENCES QuestionTemplate (id);

-- Booking
ALTER TABLE Booking ADD CONSTRAINT Booking_customer_customerNoF FOREIGN KEY (customer_customerNo) REFERENCES Customer (customerNo);
ALTER TABLE Booking ADD CONSTRAINT Booking_hotel_idF FOREIGN KEY (hotel_id) REFERENCES Hotel (id);
ALTER TABLE Booking ADD CONSTRAINT Booking_roomCategory_idF FOREIGN KEY (roomCategory_id) REFERENCES RoomCategory (id);

-- Company
ALTER TABLE Company ADD CONSTRAINT Company_customer_customerNoF FOREIGN KEY (customer_customerNo) REFERENCES Customer (customerNo);

-- Customer
ALTER TABLE Customer ADD CONSTRAINT Customer_custodian_idF FOREIGN KEY (custodian) REFERENCES Customer (customerNo);

-- CustomerSatisfactionQuestionnr
ALTER TABLE CustomerSatisfactionQuestionnr ADD CONSTRAINT CustomerSatisfactionQ_questioF FOREIGN KEY (questionnaire_id) REFERENCES Questionnaire (id);
ALTER TABLE CustomerSatisfactionQuestionnr ADD CONSTRAINT CustomerSatisfactio_respondeeF FOREIGN KEY (respondee_customerNo) REFERENCES Customer (customerNo);
ALTER TABLE CustomerSatisfactionQuestionnr ADD CONSTRAINT CustomerSatisfactionQ_visitedF FOREIGN KEY (visitedHotels_id) REFERENCES Hotel (id);


-- Hotel
ALTER TABLE Hotel ADD CONSTRAINT Hotel_chain_idF FOREIGN KEY (chain_id) REFERENCES HotelChain (id);

-- HotelChain

-- HotelRoomCategory
ALTER TABLE HotelRoomCategory ADD CONSTRAINT HotelRoomCategory_hotel_idF FOREIGN KEY (hotel_id) REFERENCES Hotel (id);
ALTER TABLE HotelRoomCategory ADD CONSTRAINT HotelRoomCatego_roomCategory_F FOREIGN KEY (roomCategory_id) REFERENCES RoomCategory (id);

-- Invoice
ALTER TABLE Invoice ADD CONSTRAINT Invoice_customer_customerNoF FOREIGN KEY (customer_customerNo) REFERENCES Customer (customerNo);

-- Night
ALTER TABLE Night ADD CONSTRAINT Night_room_idF FOREIGN KEY (room_id) REFERENCES Room (id);
ALTER TABLE Night ADD CONSTRAINT Night_stay_StayGroupF FOREIGN KEY (stay_customer_customerNo,stay_serialNo) REFERENCES Stay (customer_customerNo,serialNo);

-- Address
ALTER TABLE Address ADD CONSTRAINT Address_customer_customerNoF FOREIGN KEY (customer_customerNo) REFERENCES Customer (customerNo);

-- QuestionTemplate

-- Questionnaire
ALTER TABLE Questionnaire ADD CONSTRAINT Questionnaire_questions_idF FOREIGN KEY (questions_id) REFERENCES QuestionTemplate (id);

-- RankMapping

-- Room
ALTER TABLE Room ADD CONSTRAINT Room_category_idF FOREIGN KEY (category_id) REFERENCES RoomCategory (id);
ALTER TABLE Room ADD CONSTRAINT Room_hotel_idF FOREIGN KEY (hotel_id) REFERENCES Hotel (id);

-- RoomCategory

-- Stay
ALTER TABLE Stay ADD CONSTRAINT Stay_booking_idF FOREIGN KEY (booking_id) REFERENCES Booking (id);
ALTER TABLE Stay ADD CONSTRAINT Stay_customer_customerNoF FOREIGN KEY (customer_customerNo) REFERENCES Customer (customerNo);
ALTER TABLE Stay ADD CONSTRAINT Stay_invoice_invoiceNoF FOREIGN KEY (invoice_invoiceNo) REFERENCES Invoice (invoiceNo);
ALTER TABLE Stay ADD CONSTRAINT Stay_location_idF FOREIGN KEY (location_id) REFERENCES Hotel (id);

-- TemplateBooking
ALTER TABLE TemplateBooking ADD CONSTRAINT TemplateBook_customer_customeF FOREIGN KEY (customer_customerNo) REFERENCES Customer (customerNo);
ALTER TABLE TemplateBooking ADD CONSTRAINT TemplateBooking_hotel_idF FOREIGN KEY (hotel_id) REFERENCES Hotel (id);
ALTER TABLE TemplateBooking ADD CONSTRAINT TemplateBookin_roomCategory_iF FOREIGN KEY (roomCategory_id) REFERENCES RoomCategory (id);

