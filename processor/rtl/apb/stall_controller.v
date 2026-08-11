module stall_controller(

    input apb_request,
    input apb_busy,

    output stall_pipeline

);

// assign stall_pipeline =
//        apb_request &&
//        apb_busy;

    assign stall_pipeline = apb_busy ;

endmodule