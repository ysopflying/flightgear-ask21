setlistener("/controls/electric/battery-switch", func {
    if(getprop("/controls/electric/battery-switch")){
        interpolate("/controls/electric/battery-switch-pos", 1.00, 0.25);
    }else{
        interpolate("/controls/electric/battery-switch-pos", 0.00, 0.25);
    }
});
setlistener("/controls/electric/turn-slip-switch", func {
    if(getprop("/controls/electric/turn-slip-switch")){
        interpolate("/controls/electric/turn-slip-switch-pos", 1.00, 0.25);
    }else{
        interpolate("/controls/electric/turn-slip-switch-pos", 0.00, 0.25);
    }
});    
setlistener("/controls/electric/engine-battery-switch", func {
    if(getprop("/controls/electric/engine-battery-switch")){
        interpolate("/controls/electric/engine-battery-switch-pos", 1.00, 0.25);
    }else{
        interpolate("/controls/electric/engine-battery-switch-pos", 0.00, 0.25);
    }
});   
setlistener("/controls/engines/engine/extend-propeller", func{
	if(getprop("/controls/electric/engine-battery-switch") and !getprop("/engines/engine/running")){
		if(getprop("/controls/engines/engine/extend-propeller")){
			interpolate("/engines/engine/prop-pos-norm", 1.00, 5);
		}else{
			interpolate("/engines/engine/prop-pos-norm", 0.00, 5);
		}
	}
	
	interpolate("controls/engines/engine/extend-propeller-pos", getprop("/controls/engines/engine/extend-propeller"), 0.25);
	
});
	
	
setlistener("/sim/signals/fdm-initialized", func{
	print("Hourmeter initialized");
	settimer(update_hourmeter, 36);
});

var update_hourmeter = func{
	
	if(getprop("/engines/engine/running")){
		setprop("/instrumentation/ilec/hours", (getprop("/instrumentation/ilec/hours") or 0)+0.01);
	}
	
	settimer(update_hourmeter, 36);
}