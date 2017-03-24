function net = addFroNormAct(net, initFCparam, lambda, rDimBiCls, num_classes )
%
% Shu Kong @ UCI
% Aug. 2016

%%
net.layers{end+1} = struct('type', 'custom',...
    'forward',  @addFroNormAct_forward, ...
    'backward', @addFroNormAct_backward, ...
    'name', 'froNormAct',...
    'weights', initFCparam,... % 'learnW', learnW, 'learningRate', learnW, ...
    'weightDecay', [0.001,0],...
    'lambda', lambda,...    
    'rDim', rDimBiCls, 'nClass', num_classes,...
    'precious', 1);% set the ep LARGE enough to avoid gradient explosion