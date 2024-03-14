%%%%%%%%%%%%%%%%%%气温的0摄氏度的变化
% clc
% clear all
% path_0 = 'H:\CMIP6\GCMS_TAS\after_revise0814\';
% File = dir(fullfile(path_0,'*.csv'));
% FileNames = {File.name}';
% 
% ID_filter = xlsread('H:\CMIP6\GCMS_TAS\new_results_1030\ICE\icelake_index.xlsx',3);
% 
% for GCM = 1:length(FileNames)
%     GCM_i = FileNames{GCM,1}
%     file_path_1 = [path_0,GCM_i];
%     total_data0 = csvread(file_path_1,0,0);
%     total_data1 = total_data0(2:end,4:end);
%     total_data2 = total_data1(:,ID_filter);
%     
%     Year = total_data0(2:end,1);
%     total_id = total_data0(1,4:end);
%     total_id1 = total_id(1,ID_filter);
%     %     index = [1:365]';
%     
%     TOTAL_ICE_ON = [];
%     TOTAL_ICE_OFF = [];
%     TOTAL_duration = [];
% 
%     
%     for i = 1:length(ID_filter)
%         lake_i = total_data2(:,i);
%         ID_i =total_id1(i)
%         %%%%%%%首先将每一年的7月1日之后的水温提取出来
%         
%         ICE_ON = [];
%         ICE_OFF = [];
%         Duration = [];
%          
%         
%         for year_i = 2015:2099
%             LSWT_year_i1 = lake_i(Year == year_i);
%             LSWT_year_i2 = lake_i(Year == year_i+1);
%             LSWT_year_part1 = LSWT_year_i1(182:end,1);
%             LSWT_year_part2 = LSWT_year_i2(1:181,1);
%             LSWT_year_part = [LSWT_year_part1;LSWT_year_part2];
%             DOY__year_part = [1:365]';
%             
%             %%%%%%%%%%%%%%%%%%%%%%%%%%%%Ice_on_date and prepare window
%             for j = 1:length(LSWT_year_part)-9
%                 LSWT_year_part_j = LSWT_year_part(j:j+9,1);
%                 if LSWT_year_part_j(:)<=0
%                     DOY_iceon = DOY__year_part(j,1);
%                     break;
%                 else if j == length(LSWT_year_part)-9
%                         DOY_iceon = nan;
%                     end
%                 end
%             end
%             ICE_ON = [ICE_ON;DOY_iceon];
%             
%             %%%%%%%%%%%%%%%%%%%%%%%%%%%%如果存在结冰期，则再考虑剩下的十个参数
%             if  isnan(DOY_iceon) < 1             
% %%%%%%%%%%%%%%%%%%%%%%%%复制开始结冰时的计算，将整个数据序列倒过来计算化冰指标
%                 LSWT_year_part_flip = flipud(LSWT_year_part);
%                 DOY__year_part_flip = flipud(DOY__year_part);
%                 for j1 =  1:length(LSWT_year_part)-DOY_iceon+1
%                     LSWT_year_part1_j1 = LSWT_year_part_flip(j1:j1+9,1);
%                     if LSWT_year_part1_j1(:)<=0
%                         DOY_iceoff = DOY__year_part_flip(j1,1);
%                         dur = DOY_iceoff - DOY_iceon;
%                         break;
%                     else if j1 == length(LSWT_year_part)-DOY_iceon+1
%                             DOY_iceoff = nan;
%                             dur = 0;
%                         end
%                     end
%                 end
%      
%                 ICE_OFF = [ICE_OFF;DOY_iceoff];
%                 Duration = [Duration;dur];
%      
%                 
%             else               
%                 ICE_OFF = [ICE_OFF ;nan];
%                 Duration = [Duration;0];
%                 
%             end
%             
%         end
%         TOTAL_ICE_ON = [TOTAL_ICE_ON,ICE_ON];
%         TOTAL_ICE_OFF = [TOTAL_ICE_OFF,ICE_OFF ];
%         TOTAL_duration = [TOTAL_duration,Duration];
%        
%     end
%    
%     TOTAL_ICE_ON = TOTAL_ICE_ON+181; 
%     TOTAL_ICE_OFF = TOTAL_ICE_OFF-184;
%     
%     Writename = ['H:\CMIP6\GCMS_TAS\new_results_1030\ICE\ice_windows_1\air\',GCM_i(1:end-4),'_icephenology.xlsx'];
%    
%     xlswrite(Writename,TOTAL_ICE_ON,'iceon');
%     xlswrite(Writename,TOTAL_ICE_OFF,'iceoff');
%     xlswrite(Writename,TOTAL_duration,'duration');
% 
% end

%% 补充历史阶段的数据
clc
clear all
path_0 = 'H:\CMIP6\GCMS_TAS\';
File = dir(fullfile(path_0,'*.xlsx'));
FileNames = {File.name}';
FileNames(1:9) = [];
% FileNames(2) = [];
% FileNames(3) = [];
% FileNames(4) = [];
% FileNames(5) = [];
% FileNames = FileNames(18)

ID_filter = xlsread('H:\CMIP6\GCMS_TAS\new_results_1030\ICE\icelake_index.xlsx',3);

for GCM = 1:length(FileNames)
    GCM_i = FileNames{GCM,1}
    file_path_1 = [path_0,GCM_i];
    total_data0 = xlsread(file_path_1);
    total_data1 = total_data0(2:end,4:end);
    total_data2 = total_data1(:,ID_filter);
    
    Year = total_data0(2:end,1);
    total_id = total_data0(1,4:end);
    total_id1 = total_id(1,ID_filter);
    %     index = [1:365]';
    
    TOTAL_ICE_ON = [];
    TOTAL_ICE_OFF = [];
    TOTAL_duration = [];

    
    for i = 1:length(ID_filter)
        lake_i = total_data2(:,i);
        ID_i =total_id1(i)
        %%%%%%%首先将每一年的7月1日之后的水温提取出来
        
        ICE_ON = [];
        ICE_OFF = [];
        Duration = [];
         
        
        for year_i = 1980:2021
            LSWT_year_i1 = lake_i(Year == year_i);
            LSWT_year_i2 = lake_i(Year == year_i+1);
            LSWT_year_part1 = LSWT_year_i1(182:end,1);
            LSWT_year_part2 = LSWT_year_i2(1:181,1);
            LSWT_year_part = [LSWT_year_part1;LSWT_year_part2];
            DOY__year_part = [1:365]';
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%Ice_on_date and prepare window
            for j = 1:length(LSWT_year_part)-9
                LSWT_year_part_j = LSWT_year_part(j:j+9,1);
                if LSWT_year_part_j(:)<=0
                    DOY_iceon = DOY__year_part(j,1);
                    break;
                else if j == length(LSWT_year_part)-9
                        DOY_iceon = nan;
                    end
                end
            end
            ICE_ON = [ICE_ON;DOY_iceon];
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%如果存在结冰期，则再考虑剩下的十个参数
            if  isnan(DOY_iceon) < 1             
%%%%%%%%%%%%%%%%%%%%%%%%复制开始结冰时的计算，将整个数据序列倒过来计算化冰指标
                LSWT_year_part_flip = flipud(LSWT_year_part);
                DOY__year_part_flip = flipud(DOY__year_part);
                for j1 =  1:length(LSWT_year_part)-DOY_iceon+1
                    LSWT_year_part1_j1 = LSWT_year_part_flip(j1:j1+9,1);
                    if LSWT_year_part1_j1(:)<=0
                        DOY_iceoff = DOY__year_part_flip(j1,1);
                        dur = DOY_iceoff - DOY_iceon;
                        break;
                    else if j1 == length(LSWT_year_part)-DOY_iceon+1
                            DOY_iceoff = nan;
                            dur = 0;
                        end
                    end
                end
     
                ICE_OFF = [ICE_OFF;DOY_iceoff];
                Duration = [Duration;dur];
     
                
            else               
                ICE_OFF = [ICE_OFF ;nan];
                Duration = [Duration;0];
                
            end
            
        end
        TOTAL_ICE_ON = [TOTAL_ICE_ON,ICE_ON];
        TOTAL_ICE_OFF = [TOTAL_ICE_OFF,ICE_OFF ];
        TOTAL_duration = [TOTAL_duration,Duration];
       
    end
   
    TOTAL_ICE_ON = TOTAL_ICE_ON+181; 
    TOTAL_ICE_OFF = TOTAL_ICE_OFF-184;
    
    Writename = ['H:\CMIP6\GCMS_TAS\new_results_1030\ICE\ice_windows_1\air\',GCM_i(1:end-4),'_icephenology.xlsx'];
   
    xlswrite(Writename,TOTAL_ICE_ON,'iceon');
    xlswrite(Writename,TOTAL_ICE_OFF,'iceoff');
    xlswrite(Writename,TOTAL_duration,'duration');

end

