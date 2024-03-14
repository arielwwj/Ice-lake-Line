%%%%%%%%%%%%%%%%%结冰前后一个月水温和气温的变化

% clc
% clear all
% 
% aa = [126,245,370,585];
% for ii = 1:4
% name1 = ['H:\CMIP6\GCMS_TAS\new_results_1030\ICE\ice_windows_1\newnan\',num2str(aa(ii)),'mean_icewindow.xlsx'];
% ice_dur_data = xlsread(name1,11);
% ice_on_data = xlsread(name1,3);
% ice_off_data = xlsread(name1,6);
% 
% on0 = NaN([85 1705]);
% off0 = NaN([85 1705]);
% [sizea,sizeb] = size(ice_on_data);
% [sizec,sized] = size(ice_off_data);
% on0(1:sizea,1:sizeb) = ice_on_data;
% off0(1:sizec,1:sized) = ice_off_data;
% ice_on_data = on0;
% ice_off_data = off0;
% 
% % ID_filter = xlsread('H:\CMIP6\GCMS_TAS\new_results_1030\ICE\icelake_index.xlsx',1);
% 
% % ice_dur_data1 = ice_dur_data(:,ID_filter);
% % ice_on_data1 = ice_on_data(:,ID_filter);
% % ice_off_data1 = ice_off_data(:,ID_filter);
% 
% ice_dur_data1 = ice_dur_data;
% ice_on_data1 = ice_on_data;
% ice_off_data1 = ice_off_data;
% ice_off_data1(ice_off_data1<181) = ice_off_data1(ice_off_data1<181)+365;
% 
% % ice_on_data1(ice_on_data1<180) = ice_on_data1(ice_on_data1<180) +365;
% % ice_off_data1(ice_off_data1<180) = ice_off_data1(ice_off_data1<180)+365;
% 
% name2 =[ 'H:\CMIP6\GCMS_TAS\new_results_1030\',num2str(aa(ii)),'meanSAT.csv'];
% total_data0 = csvread(name2,1,0);
% ID_filter1 = xlsread('H:\CMIP6\GCMS_TAS\new_results_1030\ICE\icelake_index.xlsx',3);
% Year = total_data0(:,1);
% total_data1 = total_data0(:,4:end);
% total_data2 = total_data1(:,ID_filter1);
% 
% total_slope1 = [];
% total_slope2 = [];
% Slope1_final = [];
% Slope2_final = [];
% for lakei = 1:1705
%     lakei_durdata = ice_dur_data1(:,lakei);
%     lakei_ondata = ice_on_data1(:,lakei);
%     lakei_offdata = ice_off_data1(:,lakei);
%     total_data_lakei = total_data2(:,lakei);
%     
%     SLOPE1 = [];
%     SLOPE2 = [];
%     for i = 1:85
%         year_i = i+2014;
%         lakei_dur_i = lakei_durdata(i);
%         lakei_on_i = lakei_ondata(i);
%         lakei_off_i = lakei_offdata(i);
%         if lakei_dur_i==0
%             slope_before = nan;
%             slope_after = nan;
%         else
%             LSWT_year_i1 = total_data_lakei(Year == year_i | Year == year_i+1);
%             slice_index = [1:730]';
%             before_iceon = LSWT_year_i1(lakei_on_i-30:lakei_on_i-1);
%             after_iceoff = LSWT_year_i1(lakei_off_i+1:lakei_off_i+30);
%             x = [1:30]';
%             fituu = polyfit(x,before_iceon,1);
%             slope_before = fituu(1);
%             fitvv = polyfit(x,after_iceoff,1);
%             slope_after = fitvv(1);
%         end
%         SLOPE1 = [SLOPE1;slope_before];
%         SLOPE2 = [SLOPE2;slope_after];
%         
%         
%     end
%      total_slope1 = [total_slope1,SLOPE1];
%     total_slope2 = [total_slope2,SLOPE2];
%     x1 = [1:85]';
%     x1 = x1(~isnan(SLOPE1));
%     SLOPE1 = SLOPE1(~isnan(SLOPE1));
%     fit11 = polyfit(x1,SLOPE1*30,1);
%     slope1_final = fit11(1)*10;
%     
%     x2 = [1:85]';
%     x2 = x2(~isnan(SLOPE2));
%     SLOPE2 = SLOPE2(~isnan(SLOPE2));
%     fit12 = polyfit(x2,SLOPE2*30,1);
%     slope2_final = fit12(1)*10;
%     
%     Slope1_final = [ Slope1_final; slope1_final];
%     Slope2_final = [ Slope2_final; slope2_final];
% end
% Slope_final = [Slope1_final,Slope2_final];
% name3 = [ 'H:\CMIP6\GCMS_TAS\new_results_1030\ICE\ice_windows_1\newnan\before_after_ice\SAT',num2str(aa(ii)),'_slope_ba_ice.xlsx'];
% name3_1 = [num2str(aa(ii)),'beforeon'];
% name3_2 = [num2str(aa(ii)),'afteroff'];
% name3_3 = [num2str(aa(ii)),'slope'];
% xlswrite(name3,total_slope1,name3_1)
% xlswrite(name3,total_slope2,name3_2)
% xlswrite(name3,Slope_final,name3_3)
% 
% end

%% part 2:historical
% clc
% clear all
% 
% name1 = ['H:\CMIP6\GCMS_TAS\new_results_1030\ICE\ice_windows_1\newnan\ERA5-20221980_icewindow.xlsx'];
% ice_dur_data = xlsread(name1,11);
% ice_on_data = xlsread(name1,3);
% ice_off_data = xlsread(name1,6);
% 
% on0 = NaN([42 1705]);
% off0 = NaN([42 1705]);
% [sizea,sizeb] = size(ice_on_data);
% [sizec,sized] = size(ice_off_data);
% on0(1:sizea,1:sizeb) = ice_on_data;
% off0(1:sizec,1:sized) = ice_off_data;
% ice_on_data = on0;
% ice_off_data = off0;
% 
% 
% ice_dur_data1 = ice_dur_data;
% ice_on_data1 = ice_on_data;
% ice_off_data1 = ice_off_data;
% ice_off_data1(ice_off_data1<181) = ice_off_data1(ice_off_data1<181)+365;
% 
% 
% name2 =[ 'H:\CMIP6\GCMS_TAS\totaltemp1980-2022_1.1(remove0229).xlsx'];
% total_data0 = xlsread(name2,1);
% total_data0 = total_data0(2:end,:);
% ID_filter1 = xlsread('H:\CMIP6\GCMS_TAS\new_results_1030\ICE\icelake_index.xlsx',3);
% Year = total_data0(:,1);
% total_data1 = total_data0(:,4:end);
% total_data2 = total_data1(:,ID_filter1);
% 
% total_slope1 = [];
% total_slope2 = [];
% Slope1_final = [];
% Slope2_final = [];
% for lakei = 1:1705
%     lakei_durdata = ice_dur_data1(:,lakei);
%     lakei_ondata = ice_on_data1(:,lakei);
%     lakei_offdata = ice_off_data1(:,lakei);
%     total_data_lakei = total_data2(:,lakei);
%     
%     SLOPE1 = [];
%     SLOPE2 = [];
%     for i = 1:42
%         year_i = i+1979;
%         lakei_dur_i = lakei_durdata(i);
%         lakei_on_i = lakei_ondata(i);
%         lakei_off_i = lakei_offdata(i);
%         if lakei_dur_i==0
%             slope_before = nan;
%             slope_after = nan;
%         else
%             LSWT_year_i1 = total_data_lakei(Year == year_i | Year == year_i+1);
%             slice_index = [1:730]';
%             before_iceon = LSWT_year_i1(lakei_on_i-30:lakei_on_i-1);
%             after_iceoff = LSWT_year_i1(lakei_off_i+1:lakei_off_i+30);
%             x = [1:30]';
%             fituu = polyfit(x,before_iceon,1);
%             slope_before = fituu(1);
%             fitvv = polyfit(x,after_iceoff,1);
%             slope_after = fitvv(1);
%         end
%         SLOPE1 = [SLOPE1;slope_before];
%         SLOPE2 = [SLOPE2;slope_after];
%         
%         
%     end
%      total_slope1 = [total_slope1,SLOPE1];
%     total_slope2 = [total_slope2,SLOPE2];
%     x1 = [1:42]';
%     x1 = x1(~isnan(SLOPE1));
%     SLOPE1 = SLOPE1(~isnan(SLOPE1));
%     fit11 = polyfit(x1,SLOPE1*30,1);
%     slope1_final = fit11(1)*10;
%     
%     x2 = [1:42]';
%     x2 = x2(~isnan(SLOPE2));
%     SLOPE2 = SLOPE2(~isnan(SLOPE2));
%     fit12 = polyfit(x2,SLOPE2*30,1);
%     slope2_final = fit12(1)*10;
%     
%     Slope1_final = [ Slope1_final; slope1_final];
%     Slope2_final = [ Slope2_final; slope2_final];
% end
% Slope_final = [Slope1_final,Slope2_final];
% name3 = [ 'H:\CMIP6\GCMS_TAS\new_results_1030\ICE\ice_windows_1\newnan\before_after_ice\SAT19802022_slope_ba_ice.xlsx'];
% name3_1 = ['ERA5-20221980-beforeon'];
% name3_2 = ['ERA5-20221980-afteroff'];
% name3_3 = ['ERA5-20221980-slope'];
% xlswrite(name3,total_slope1,name3_1)
% xlswrite(name3,total_slope2,name3_2)
% xlswrite(name3,Slope_final,name3_3)


%% part 3 计算整个历史和未来的slope

clc
clear all

sheet= 2;

% aa = [126,245,370,585];
aa = [19802021];
Slope1_final2 = [];
for j = 1:1
name1 = ['H:\CMIP6\GCMS_TAS\new_results_1030\ICE\ice_windows_1\newnan\before_after_ice\',num2str(aa(j)),'_slope_ba_ice.xlsx'];
data2 = xlsread(name1,sheet);
[year111,num111] = size(data2);
Slope1_final = [];
for i = 1:num111
    slope_i = data2(8:end,i)*(-1);
%     slope_i = data2(8:end,i);
    x2 = [1:42]';
    x2 = x2(~isnan(slope_i));
    if length(x2)>21
        slope_i = slope_i(~isnan(slope_i));
        fit12 = polyfit(x2,slope_i*30,1);
    else
        fit12 = 0;
    end
    slope2_final = fit12(1)*10;
    Slope1_final = [ Slope1_final; slope2_final];
end
Slope1_final2 = [Slope1_final2,Slope1_final];

end
% xlswrite('H:\CMIP6\GCMS_TAS\new_results_1030\ICE\otherdata\19802100totalslope_baice.xlsx',Slope1_final2,'SAT_A');


