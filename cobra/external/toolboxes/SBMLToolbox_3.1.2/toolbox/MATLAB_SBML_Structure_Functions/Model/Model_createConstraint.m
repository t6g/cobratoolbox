function [constraint, SBMLModel] = Model_createConstraint(SBMLModel)
%
%   Model_createConstraint 
%             takes an SBMLModel structure 
%
%             and returns 
%               as first argument the constraint structure created
%               within the model
%               and as second argument the SBML model structure with the
%               created constraint
%
%       [constraint, SBMLModel] = Model_createConstraint(SBMLModel)

%  Filename    :   Model_createConstraint.m
%  Description :
%  Author(s)   :   SBML Development Group <sbml-team@caltech.edu>
%  $Id: Model_createConstraint.m 7155 2008-06-26 20:24:00Z mhucka $
%  $Source v $
%
%<!---------------------------------------------------------------------------
% This file is part of SBMLToolbox.  Please visit http://sbml.org for more
% information about SBML, and the latest version of SBMLToolbox.
%
% Copyright 2005-2007 California Institute of Technology.
% Copyright 2002-2005 California Institute of Technology and
%                     Japan Science and Technology Corporation.
% 
% This library is free software; you can redistribute it and/or modify it
% under the terms of the GNU Lesser General Public License as published by
% the Free Software Foundation.  A copy of the license agreement is provided
% in the file named "LICENSE.txt" included with this software distribution.
% and also available online as http://sbml.org/software/sbmltoolbox/license.html
%----------------------------------------------------------------------- -->



% check that input is correct
if (~isSBML_Model(SBMLModel))
    error(sprintf('%s\n%s', 'Model_createConstraint(SBMLModel)', 'first argument must be an SBML model structure'));
elseif (SBMLModel.SBML_level ~= 2)
    error(sprintf('%s\n%s', 'Model_createConstraint(SBMLModel)', 'no constraints in a level 1 model'));   
elseif (SBMLModel.SBML_version == 1)
    error(sprintf('%s\n%s', 'Model_createConstraint(SBMLModel)', 'no constraints in a level 2 version 1 model'));   
end;

constraint = Constraint_create(SBMLModel.SBML_level, SBMLModel.SBML_version);

SBMLModel = Model_addConstraint(SBMLModel, constraint);