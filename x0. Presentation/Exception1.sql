create or replace trigger negative_salary
before update of salary on Employee_3
for each row
declare negative_salary_exce exception;
begin
      if(:new.salary < 0) then raise negative_salary_exce;
      end if;
exception
      when negative_salary_exce then
        raise_application_error(-20001, 'Before Update Exception : Salary must be greater than zero!');
end;
/
