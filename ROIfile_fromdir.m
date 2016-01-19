function [ roifiles ] = ROIfile_fromdir( roistatdir )
%ROIFILE_FROMDIR Cell array fo ROIstats files
%   look into a directory and pull out each file
    roifiles={};
    for f=dir(roistatdir)'
      if ~f.isdir; roifiles={roifiles{:} [ roistatdir f.name]};end
    end

end

