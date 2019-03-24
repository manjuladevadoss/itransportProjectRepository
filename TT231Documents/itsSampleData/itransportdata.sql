desc ir_loc_code;
desc ir_loc_type;
select a.loc_code_id, a.loc_code_desc, b.loc_type_desc from ir_loc_code a, ir_loc_type b ;

select rdwk_type_desc from IR_Rdwk_type;

desc ir_source;

select source_desc from ir_source;

desc ir_tem_ap_status;
select tem_ap_status_desc from ir_tem_ap_status;
-- Road work state
--Dry / Damp or Wet / testing

desc ir_type;
select type_desc from ir_type;


--ir verified state 
--Notified / Confirmed / Anticipated / In Progress / Over


-- accident type
-- Chain Collision / Skidded / Overturned / Over Height  / Rear-end / Side-swipe / Hit & Run

-- breakdown type
--No fuel / Flat tyre / Mechanical fault / Unverified / Others




