function SBMLReaction = Reaction_setReversible(SBMLReaction, reversible)
%
%   Reaction_setReversible 
%             takes  1) an SBMLReaction structure 
%             and    2) an integer representing the reversible to be set
%
%             and returns 
%               the reaction with the reversible set
%
%       SBMLReaction = Reaction_setReversible(SBMLReaction, reversible)

%  Filename    :   Reaction_setReversible.m
%  Description :
%  Author(s)   :   SBML Development Group <sbml-team@caltech.edu>
%  $Id: Reaction_setReversible.m 7155 2008-06-26 20:24:00Z mhucka $
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
if (~isstruct(SBMLReaction))
  error(sprintf('%s', ...
    'first argument must be an SBML Reaction structure'));
end;
 
[sbmlLevel, sbmlVersion] = GetLevelVersion(SBMLReaction);

if (~isSBML_Reaction(SBMLReaction, sbmlLevel, sbmlVersion))
    error(sprintf('%s\n%s', 'Reaction_setReversible(SBMLReaction, reversible)', 'first argument must be an SBML model structure'));
elseif ((~isIntegralNumber(reversible)) || (reversible < 0) || (reversible > 1))
    error(sprintf('Reaction_setReversible(SBMLReaction, reversible)\n%s', 'second argument must be either true (=1) or false (=0) representing whether the reaction is reversible'));
end;

SBMLReaction.reversible = int32(reversible);