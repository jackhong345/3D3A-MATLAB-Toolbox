function [az,el,rad] = sofaC2int(x,y,z)
%SOFAC2INT Convert SOFA cartesian coordinates to interaural polar
%coordinates.
%   [az,el,rad] = SOFAC2INT(x,y,z) converts from SOFA cartesian  
%   coordinates to interaural polar coordinates specified using the same 
%   azimuth and elevation sign conventions and ranges as SOFA's spherical 
%   coordinate system. az and el are specified in degrees. x, y, and z may 
%   be specified as scalars or vectors. If vectors, they must have the same
%   length. az, el, and rad are either scalars or column vectors.
%
%   See also INT2SOFAC, SOFAS2SOFAC.

%   ==============================================================================
%   This file is part of the 3D3A MATLAB Toolbox.
%   
%   Contributing author(s), listed alphabetically by last name:
%   Rahulram Sridhar <rahulram@princeton.edu>
%   3D Audio and Applied Acoustics (3D3A) Laboratory
%   Princeton University, Princeton, New Jersey 08544, USA
%   
%   MIT License
%   
%   Copyright (c) 2017 Princeton University
%   
%   Permission is hereby granted, free of charge, to any person obtaining a copy
%   of this software and associated documentation files (the "Software"), to deal
%   in the Software without restriction, including without limitation the rights
%   to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
%   copies of the Software, and to permit persons to whom the Software is
%   furnished to do so, subject to the following conditions:
%   
%   The above copyright notice and this permission notice shall be included in all
%   copies or substantial portions of the Software.
%   
%   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
%   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
%   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
%   AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
%   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
%   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
%   SOFTWARE.
%   ==============================================================================

%sofaC2int converts SOFA's cartesian coordinates to interaural polar 
%coordinates while maintaining the same azimuth and elevation sign
%conventions and ranges as SOFA's spherical coordinate system. Output 
%azimuth and elevation are in degrees.

narginchk(3,3);

x = shiftdim(x);
y = shiftdim(y);
z = shiftdim(z);

rad = sqrt(x.^2 + y.^2 + z.^2);
az = zeros(size(rad));
el = zeros(size(rad));
I = rad~=0;

if isscalar(x)
    x = ones(size(rad))*x;
end
if isscalar(y)
    y = ones(size(rad))*y;
end
if isscalar(z)
    z = ones(size(rad))*z;
end

az(I) = mod(atan2d(y(I),x(I)),360);
el(I) = atan2d(z(I),abs(x(I)));

end

