%%%%%%%%%%%%%%%%decade result of lake ice  China

% clc
% clear all
% 
% origindata = xlsread('H:\CMIP6\GCMS_TAS\new_results_1030\文章制图和分析表格\未来湖冰物候.xlsx',12);
% data1= origindata(6:85,2:end);
% RECORD = [];
% for i = 1:8
%     data_i = data1((i-1)*10+1:i*10,:);
%     Record = [];
%     for j = 1:size(data_i,2)
%         data_i2 = data_i(:,j);
%         data_i3 = nnz(data_i2);
%         if data_i3>6
%             record = 1; %%%%%结冰的湖泊记为1，不结冰湖泊记为0
%         else
%             record = 0;
%         end
%         Record = [Record,record];
%     end
%     RECORD = [ RECORD; Record];
%     
% end
% RECORD = RECORD';
% a = sum(RECORD, 1);
% % xlswrite('H:\CMIP6\GCMS_TAS\new_results_1030\文章制图和分析表格\十年冰线.xlsx', RECORD,'his')

%% %%%%%%%%%%%%%%%%decade result of lake ice  Global

clc
clear all

origindata = csvread('E:\Data_nature_water\20240312Duration\average_RCP85_duration.csv');
data1= origindata(:,5:end)';
RECORD = [];
for i = 1:9
    if i == 9
         data_i = data1((i-1)*10+1:i*10-2,:);
    Record = [];
    for j = 1:size(data_i,2)
        data_i2 = data_i(:,j);
        data_i3 = nnz(data_i2);
        if data_i3>6
            record = 1; %%%%%结冰的湖泊记为1，不结冰湖泊记为0
        else
            record = 0;
        end
        Record = [Record,record];
    end
    else
    data_i = data1((i-1)*10+1:i*10,:);
    Record = [];
    for j = 1:size(data_i,2)
        data_i2 = data_i(:,j);
        data_i3 = nnz(data_i2);
        if data_i3>6
            record = 1; %%%%%结冰的湖泊记为1，不结冰湖泊记为0
        else
            record = 0;
        end
        Record = [Record,record];
    end
    end
    RECORD = [ RECORD; Record];
    
end
RECORD = RECORD';
a = sum(RECORD, 1);
xlswrite('E:\Data_nature_water\20240312Duration\全球十年冰线.xlsx', RECORD,'RCP85')
