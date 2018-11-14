create or replace trigger negative_salary
after update of salary on Employee_3
for each row
declare negative_salary_exce exception;
begin
      if(:new.salary < 0) then raise negative_salary_exce;
      end if;
exception
      when negative_salary_exce then
        raise_application_error(-20001, 'After Update Exception : Salary must be greater than zero!');
end;
/
