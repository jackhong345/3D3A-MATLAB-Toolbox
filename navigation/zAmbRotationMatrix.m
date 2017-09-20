function Qz = zAmbRotationMatrix(AZIM, ELEV, L)
%ZAMBROTATIONMATRIX Ambisonics rotation to align the z axis.
%   Q = ZAMBROTATIONMATRIX(AZIM, ELEV, L) computes the ambisonic rotation
%   matrix Q, up to ambisonics order L, which aligns the z-axis in the
%   rotated coordinate system with a certain azimuth and elevation (AZIM
%   and ELEV, given in radians) in the original coordinate system.
%
%   Note that this matrix is defined to rotate a column-vector of basis
%   functions when multiplied on the left, so to rotate a column-vector of 
%   expansion coefficients, the inverse of Q should be multiplied on the
%   left.
%
%   See also AMBTRANSLATIONMATRIX.

%   ==============================================================================
%   This file is part of the 3D3A MATLAB Toolbox.
%   
%   Contributing author(s), listed alphabetically by last name:
%   Joseph G. Tylka <josephgt@princeton.edu>
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

%   References:
%     [1] Gumerov and Duraiswami (2005) Fast Multipole Methods for the
%         Helmholtz Equation in Three Dimensions.
%     [2] Zotter (2009) Analysis and Synthesis of Sound-Radiation with
%         Spherical Arrays.

Qz = (variableYawAmbRotationMatrix(AZIM, L) / fixedRollAmbRotationMatrix(L)) ...
    * variableYawAmbRotationMatrix((pi/2) - ELEV, L) ...
    * fixedRollAmbRotationMatrix(L);

end