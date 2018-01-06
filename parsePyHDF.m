%%
meta.baseDir='/Users/cad/Documents/cdSom3/';
meta.hdf='cdSom3_12282017.hdf';
tI=h5info([meta.baseDir meta.hdf]);
dSetNames={tI.Datasets.Name};
clear tI;

ds_Time={};
timeSetCnt=0;
for n=1:numel(dSetNames)
    tT=isempty(strfind(dSetNames{n},'Time'));
    if tT==0
        timeSetCnt=timeSetCnt+1;
        ds_Time{timeSetCnt,1}=dSetNames{n};
    else
    end
           
end

ds_Data=setdiff(dSetNames,ds_Time)';
clear dSetNames timeSetCnt tT n

%%
dPick=13;
tData=h5read([meta.baseDir meta.hdf],['/' ds_Data{dPick}]);
tData=permute(tData,[3,2,1]);
