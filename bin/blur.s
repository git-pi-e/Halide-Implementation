	.text
	.file	"posix_allocator.cpp"
	.section	.text.halide_default_malloc,"ax",@progbits
	.weak	halide_default_malloc           # -- Begin function halide_default_malloc
	.p2align	4, 0x90
	.type	halide_default_malloc,@function
halide_default_malloc:                  # @halide_default_malloc
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	leaq	64(%rsi), %rdi
	callq	malloc@PLT
	testq	%rax, %rax
	je	.LBB0_1
# %bb.2:                                # %if.end
	movq	%rax, %rcx
	addq	$71, %rax
	andq	$-64, %rax
	movq	%rcx, -8(%rax)
	popq	%rbp
	retq
.LBB0_1:
	xorl	%eax, %eax
	popq	%rbp
	retq
.Lfunc_end0:
	.size	halide_default_malloc, .Lfunc_end0-halide_default_malloc
                                        # -- End function
	.section	.text.halide_default_free,"ax",@progbits
	.weak	halide_default_free             # -- Begin function halide_default_free
	.p2align	4, 0x90
	.type	halide_default_free,@function
halide_default_free:                    # @halide_default_free
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	-8(%rsi), %rdi
	popq	%rbp
	jmp	free@PLT                        # TAILCALL
.Lfunc_end1:
	.size	halide_default_free, .Lfunc_end1-halide_default_free
                                        # -- End function
	.section	.text.halide_set_custom_malloc,"ax",@progbits
	.weak	halide_set_custom_malloc        # -- Begin function halide_set_custom_malloc
	.p2align	4, 0x90
	.type	halide_set_custom_malloc,@function
halide_set_custom_malloc:               # @halide_set_custom_malloc
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal13custom_mallocE@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rax
	movq	%rdi, (%rcx)
	popq	%rbp
	retq
.Lfunc_end2:
	.size	halide_set_custom_malloc, .Lfunc_end2-halide_set_custom_malloc
                                        # -- End function
	.section	.text.halide_set_custom_free,"ax",@progbits
	.weak	halide_set_custom_free          # -- Begin function halide_set_custom_free
	.p2align	4, 0x90
	.type	halide_set_custom_free,@function
halide_set_custom_free:                 # @halide_set_custom_free
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal11custom_freeE@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rax
	movq	%rdi, (%rcx)
	popq	%rbp
	retq
.Lfunc_end3:
	.size	halide_set_custom_free, .Lfunc_end3-halide_set_custom_free
                                        # -- End function
	.section	.text.halide_malloc,"ax",@progbits
	.weak	halide_malloc                   # -- Begin function halide_malloc
	.p2align	4, 0x90
	.type	halide_malloc,@function
halide_malloc:                          # @halide_malloc
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal13custom_mallocE@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.Lfunc_end4:
	.size	halide_malloc, .Lfunc_end4-halide_malloc
                                        # -- End function
	.section	.text.halide_free,"ax",@progbits
	.weak	halide_free                     # -- Begin function halide_free
	.p2align	4, 0x90
	.type	halide_free,@function
halide_free:                            # @halide_free
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal11custom_freeE@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.Lfunc_end5:
	.size	halide_free, .Lfunc_end5-halide_free
                                        # -- End function
	.section	.text.halide_default_error,"ax",@progbits
	.weak	halide_default_error            # -- Begin function halide_default_error
	.p2align	4, 0x90
	.type	halide_default_error,@function
halide_default_error:                   # @halide_default_error
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	subq	$4104, %rsp                     # imm = 0x1008
	movq	%rsi, %rbx
	movq	%rdi, %r15
	leaq	-26(%rbp), %rsi
	leaq	.L.str(%rip), %rdx
	leaq	-4120(%rbp), %r14
	movq	%r14, %rdi
	callq	halide_string_to_string@PLT
	leaq	4094(%rax), %rsi
	movq	%rax, %rdi
	movq	%rbx, %rdx
	callq	halide_string_to_string@PLT
	cmpb	$10, -1(%rax)
	je	.LBB6_2
# %bb.1:                                # %if.then
	movw	$10, (%rax)
	incq	%rax
.LBB6_2:                                # %if.end
	subq	%r14, %rax
	incq	%rax
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	halide_print@PLT
	callq	abort@PLT
	addq	$4104, %rsp                     # imm = 0x1008
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end6:
	.size	halide_default_error, .Lfunc_end6-halide_default_error
                                        # -- End function
	.section	.text.halide_error,"ax",@progbits
	.weak	halide_error                    # -- Begin function halide_error
	.p2align	4, 0x90
	.type	halide_error,@function
halide_error:                           # @halide_error
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal13error_handlerE@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.Lfunc_end7:
	.size	halide_error, .Lfunc_end7-halide_error
                                        # -- End function
	.section	.text.halide_set_error_handler,"ax",@progbits
	.weak	halide_set_error_handler        # -- Begin function halide_set_error_handler
	.p2align	4, 0x90
	.type	halide_set_error_handler,@function
halide_set_error_handler:               # @halide_set_error_handler
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal13error_handlerE@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rax
	movq	%rdi, (%rcx)
	popq	%rbp
	retq
.Lfunc_end8:
	.size	halide_set_error_handler, .Lfunc_end8-halide_set_error_handler
                                        # -- End function
	.section	.text.halide_print,"ax",@progbits
	.weak	halide_print                    # -- Begin function halide_print
	.p2align	4, 0x90
	.type	halide_print,@function
halide_print:                           # @halide_print
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal12custom_printE@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.Lfunc_end9:
	.size	halide_print, .Lfunc_end9-halide_print
                                        # -- End function
	.section	.text.halide_set_custom_print,"ax",@progbits
	.weak	halide_set_custom_print         # -- Begin function halide_set_custom_print
	.p2align	4, 0x90
	.type	halide_set_custom_print,@function
halide_set_custom_print:                # @halide_set_custom_print
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal12custom_printE@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rax
	movq	%rdi, (%rcx)
	popq	%rbp
	retq
.Lfunc_end10:
	.size	halide_set_custom_print, .Lfunc_end10-halide_set_custom_print
                                        # -- End function
	.section	.text.halide_start_clock,"ax",@progbits
	.weak	halide_start_clock              # -- Begin function halide_start_clock
	.p2align	4, 0x90
	.type	halide_start_clock,@function
halide_start_clock:                     # @halide_start_clock
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	pushq	%rax
	movq	halide_reference_clock_inited@GOTPCREL(%rip), %rbx
	cmpb	$0, (%rbx)
	jne	.LBB11_2
# %bb.1:                                # %if.then
	movq	halide_reference_clock@GOTPCREL(%rip), %rdx
	movl	$228, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	syscall@PLT
	movb	$1, (%rbx)
.LBB11_2:                               # %if.end
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end11:
	.size	halide_start_clock, .Lfunc_end11-halide_start_clock
                                        # -- End function
	.section	.text.halide_current_time_ns,"ax",@progbits
	.weak	halide_current_time_ns          # -- Begin function halide_current_time_ns
	.p2align	4, 0x90
	.type	halide_current_time_ns,@function
halide_current_time_ns:                 # @halide_current_time_ns
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	leaq	-16(%rbp), %rdx
	movl	$228, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	syscall@PLT
	vmovdqa	-16(%rbp), %xmm0
	movq	halide_reference_clock@GOTPCREL(%rip), %rax
	vpsubq	(%rax), %xmm0, %xmm0
	vmovq	%xmm0, %rax
	imulq	$1000000000, %rax, %rcx         # imm = 0x3B9ACA00
	vpextrq	$1, %xmm0, %rax
	addq	%rcx, %rax
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end12:
	.size	halide_current_time_ns, .Lfunc_end12-halide_current_time_ns
                                        # -- End function
	.section	.text.halide_sleep_ms,"ax",@progbits
	.weak	halide_sleep_ms                 # -- Begin function halide_sleep_ms
	.p2align	4, 0x90
	.type	halide_sleep_ms,@function
halide_sleep_ms:                        # @halide_sleep_ms
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	imull	$1000, %esi, %edi               # imm = 0x3E8
	popq	%rbp
	jmp	usleep@PLT                      # TAILCALL
.Lfunc_end13:
	.size	halide_sleep_ms, .Lfunc_end13-halide_sleep_ms
                                        # -- End function
	.section	.text.halide_default_print,"ax",@progbits
	.weak	halide_default_print            # -- Begin function halide_default_print
	.p2align	4, 0x90
	.type	halide_default_print,@function
halide_default_print:                   # @halide_default_print
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	pushq	%rax
	movq	%rsi, %rbx
	movq	%rsi, %rdi
	callq	strlen@PLT
	movl	$1, %edi
	movq	%rbx, %rsi
	movq	%rax, %rdx
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	jmp	write@PLT                       # TAILCALL
.Lfunc_end14:
	.size	halide_default_print, .Lfunc_end14-halide_default_print
                                        # -- End function
	.section	.text.halide_host_cpu_count,"ax",@progbits
	.weak	halide_host_cpu_count           # -- Begin function halide_host_cpu_count
	.p2align	4, 0x90
	.type	halide_host_cpu_count,@function
halide_host_cpu_count:                  # @halide_host_cpu_count
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$84, %edi
	popq	%rbp
	jmp	sysconf@PLT                     # TAILCALL
.Lfunc_end15:
	.size	halide_host_cpu_count, .Lfunc_end15-halide_host_cpu_count
                                        # -- End function
	.section	.text.halide_thread_yield,"ax",@progbits
	.weak	halide_thread_yield             # -- Begin function halide_thread_yield
	.p2align	4, 0x90
	.type	halide_thread_yield,@function
halide_thread_yield:                    # @halide_thread_yield
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	popq	%rbp
	jmp	sched_yield@PLT                 # TAILCALL
.Lfunc_end16:
	.size	halide_thread_yield, .Lfunc_end16-halide_thread_yield
                                        # -- End function
	.section	.text.halide_default_do_task,"ax",@progbits
	.weak	halide_default_do_task          # -- Begin function halide_default_do_task
	.p2align	4, 0x90
	.type	halide_default_do_task,@function
halide_default_do_task:                 # @halide_default_do_task
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rsi, %rax
	movl	%edx, %esi
	movq	%rcx, %rdx
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.Lfunc_end17:
	.size	halide_default_do_task, .Lfunc_end17-halide_default_do_task
                                        # -- End function
	.section	.text.halide_default_do_loop_task,"ax",@progbits
	.weak	halide_default_do_loop_task     # -- Begin function halide_default_do_loop_task
	.p2align	4, 0x90
	.type	halide_default_do_loop_task,@function
halide_default_do_loop_task:            # @halide_default_do_loop_task
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rsi, %rax
	movl	%edx, %esi
	movl	%ecx, %edx
	movq	%r8, %rcx
	movq	%r9, %r8
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.Lfunc_end18:
	.size	halide_default_do_loop_task, .Lfunc_end18-halide_default_do_loop_task
                                        # -- End function
	.section	.text.halide_default_do_par_for,"ax",@progbits
	.weak	halide_default_do_par_for       # -- Begin function halide_default_do_par_for
	.p2align	4, 0x90
	.type	halide_default_do_par_for,@function
halide_default_do_par_for:              # @halide_default_do_par_for
# %bb.0:                                # %entry
	testl	%ecx, %ecx
	jle	.LBB19_1
# %bb.2:                                # %if.end
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	subq	$128, %rsp
	movq	$0, -144(%rbp)
	movl	%edx, -108(%rbp)
	movl	%ecx, -104(%rbp)
	movb	$0, -96(%rbp)
	movl	$0, -112(%rbp)
	movq	%r8, -136(%rbp)
	movl	$0, -100(%rbp)
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%xmm0, -128(%rbp)
	movq	%rsi, -88(%rbp)
	movq	%rdi, -40(%rbp)
	movq	$0, -32(%rbp)
	movl	$0, -24(%rbp)
	movb	$0, -20(%rbp)
	leaq	-144(%rbp), %rbx
	movq	%rbx, -72(%rbp)
	movl	$0, -64(%rbp)
	movq	$0, -56(%rbp)
	movq	_ZN6Halide7Runtime8Internal10work_queueE@GOTPCREL(%rip), %r14
	movq	%r14, %rdi
	callq	halide_mutex_lock@PLT
	movl	$1, %edi
	movq	%rbx, %rsi
	xorl	%edx, %edx
	callq	_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_@PLT
	movq	%rbx, %rdi
	callq	_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE@PLT
	movq	%r14, %rdi
	callq	halide_mutex_unlock@PLT
	movl	-28(%rbp), %eax
	addq	$128, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.LBB19_1:
	xorl	%eax, %eax
	retq
.Lfunc_end19:
	.size	halide_default_do_par_for, .Lfunc_end19-halide_default_do_par_for
                                        # -- End function
	.section	.text.halide_mutex_lock,"ax",@progbits
	.weak	halide_mutex_lock               # -- Begin function halide_mutex_lock
	.p2align	4, 0x90
	.type	halide_mutex_lock,@function
halide_mutex_lock:                      # @halide_mutex_lock
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$16, %rsp
	movl	$1, %ecx
	xorl	%eax, %eax
	lock		cmpxchgq	%rcx, (%rdi)
	jne	.LBB20_1
.LBB20_4:                               # %_ZN6Halide7Runtime8Internal15Synchronization10fast_mutex4lockEv.exit
	addq	$16, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB20_1:                               # %if.then.i
	movq	%rdi, %rbx
	movq	(%rdi), %rax
	movl	$40, %r12d
	movq	_ZTVN6Halide7Runtime8Internal15Synchronization21mutex_parking_controlE@GOTPCREL(%rip), %r15
	addq	$16, %r15
	leaq	-48(%rbp), %r14
	.p2align	4, 0x90
.LBB20_2:                               # %while.cond.outer.i.i
                                        # =>This Inner Loop Header: Depth=1
	testb	$1, %al
	jne	.LBB20_5
# %bb.3:                                # %if.then.i.i
                                        #   in Loop: Header=BB20_2 Depth=1
	movq	%rax, %rcx
	orq	$1, %rcx
	lock		cmpxchgq	%rcx, (%rbx)
	jne	.LBB20_2
	jmp	.LBB20_4
.LBB20_5:                               # %if.end4.i.i
                                        #   in Loop: Header=BB20_2 Depth=1
	testl	%r12d, %r12d
	jg	.LBB20_6
# %bb.8:                                # %if.end8.i.i
                                        #   in Loop: Header=BB20_2 Depth=1
	testb	$2, %al
	jne	.LBB20_10
.LBB20_9:                               # %if.then10.i.i
                                        #   in Loop: Header=BB20_2 Depth=1
	movq	%rax, %rcx
	orq	$2, %rcx
	lock		cmpxchgq	%rcx, (%rbx)
	jne	.LBB20_2
	jmp	.LBB20_10
.LBB20_6:                               # %_ZN6Halide7Runtime8Internal15Synchronization12spin_control11should_spinEv.exit.i.i
                                        #   in Loop: Header=BB20_2 Depth=1
	decl	%r12d
	je	.LBB20_7
# %bb.12:                               # %if.then6.i.i
                                        #   in Loop: Header=BB20_2 Depth=1
	callq	halide_thread_yield@PLT
	movq	(%rbx), %rax
	jmp	.LBB20_2
.LBB20_7:                               #   in Loop: Header=BB20_2 Depth=1
	xorl	%r12d, %r12d
	testb	$2, %al
	je	.LBB20_9
.LBB20_10:                              # %if.end19.i.i
                                        #   in Loop: Header=BB20_2 Depth=1
	movq	%r15, -48(%rbp)
	movq	%rbx, -40(%rbp)
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	_ZN6Halide7Runtime8Internal15Synchronization15parking_control4parkEy@PLT
	cmpq	%rbx, %rax
	je	.LBB20_4
# %bb.11:                               # %if.end24.i.i
                                        #   in Loop: Header=BB20_2 Depth=1
	movq	(%rbx), %rax
	movl	$40, %r12d
	jmp	.LBB20_2
.Lfunc_end20:
	.size	halide_mutex_lock, .Lfunc_end20-halide_mutex_lock
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_ # -- Begin function _ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_,@function
_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_: # @_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$40, %rsp
	movq	%rsi, %rbx
	movl	%edi, %r14d
	movq	_ZN6Halide7Runtime8Internal10work_queueE@GOTPCREL(%rip), %r8
	cmpb	$0, 2121(%r8)
	movq	%rdx, -64(%rbp)                 # 8-byte Spill
	je	.LBB21_1
# %bb.9:                                # %if.end4
	movl	%r14d, %r15d
	movl	%r14d, -48(%rbp)                # 4-byte Spill
	testl	%r14d, %r14d
	jle	.LBB21_10
.LBB21_20:                              # %for.body.preheader
	movq	%r15, %r9
	shlq	$7, %r9
	movl	$-1, %r10d
	xorl	%ecx, %ecx
	movl	$1, %eax
	xorl	%r12d, %r12d
	xorl	%edi, %edi
	xorl	%r14d, %r14d
	xorl	%r13d, %r13d
	jmp	.LBB21_21
	.p2align	4, 0x90
.LBB21_22:                              # %if.then23
                                        #   in Loop: Header=BB21_21 Depth=1
	incl	%r10d
.LBB21_24:                              # %for.inc
                                        #   in Loop: Header=BB21_21 Depth=1
	addl	%esi, %r12d
	subq	$-128, %rcx
	cmpq	%rcx, %r9
	je	.LBB21_11
.LBB21_21:                              # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movl	44(%rbx,%rcx), %esi
	testl	%esi, %esi
	movzbl	%r13b, %r13d
	cmovel	%eax, %r13d
	movzbl	%dil, %edi
	cmovnel	%eax, %edi
	cmpl	$0, 32(%rbx,%rcx)
	movzbl	%r14b, %r14d
	cmovnel	%eax, %r14d
	cmpb	$0, 48(%rbx,%rcx)
	jne	.LBB21_22
# %bb.23:                               # %if.else24
                                        #   in Loop: Header=BB21_21 Depth=1
	addl	40(%rbx,%rcx), %r10d
	jmp	.LBB21_24
.LBB21_11:                              # %for.cond.cleanup.loopexit
	andb	$1, %r14b
	andb	$1, %dil
	andb	$1, %r13b
	testq	%rdx, %rdx
	movl	%edi, -52(%rbp)                 # 4-byte Spill
	je	.LBB21_13
.LBB21_25:                              # %do.body61
	movl	112(%rdx), %eax
	imull	44(%rdx), %eax
	subl	96(%rdx), %eax
	cmpl	%eax, %r12d
	jle	.LBB21_27
# %bb.26:                               # %if.then66
	leaq	.L.str.3(%rip), %rsi
	xorl	%edi, %edi
	movl	%r10d, %r12d
	callq	halide_print@PLT
	callq	abort@PLT
	movl	%r12d, %r10d
	movl	-52(%rbp), %edi                 # 4-byte Reload
	movq	_ZN6Halide7Runtime8Internal10work_queueE@GOTPCREL(%rip), %r8
	movq	-64(%rbp), %rdx                 # 8-byte Reload
.LBB21_27:                              # %do.end69
	movl	%r14d, %eax
	orb	%dil, %al
	movl	-48(%rbp), %esi                 # 4-byte Reload
	je	.LBB21_29
# %bb.28:                               # %if.then73
	incl	96(%rdx)
	jmp	.LBB21_29
.LBB21_1:                               # %land.rhs.i.preheader
	leaq	12(%r8), %rax
	movl	$2128, %ecx                     # imm = 0x850
	addq	_ZN6Halide7Runtime8Internal10work_queueE@GOTPCREL(%rip), %rcx
	.p2align	4, 0x90
.LBB21_2:                               # %land.rhs.i
                                        # =>This Inner Loop Header: Depth=1
	cmpb	$0, (%rax)
	jne	.LBB21_4
# %bb.3:                                # %while.body.i
                                        #   in Loop: Header=BB21_2 Depth=1
	incq	%rax
	cmpq	%rcx, %rax
	jb	.LBB21_2
.LBB21_4:                               # %do.body.i
	movl	$2128, %ecx                     # imm = 0x850
	addq	_ZN6Halide7Runtime8Internal10work_queueE@GOTPCREL(%rip), %rcx
	cmpq	%rcx, %rax
	je	.LBB21_6
# %bb.5:                                # %if.then.i
	leaq	.L.str.6(%rip), %rsi
	xorl	%edi, %edi
	callq	halide_print@PLT
	callq	abort@PLT
	movq	_ZN6Halide7Runtime8Internal10work_queueE@GOTPCREL(%rip), %r8
	movq	-64(%rbp), %rdx                 # 8-byte Reload
.LBB21_6:                               # %_ZNK6Halide7Runtime8Internal12work_queue_t13assert_zeroedEv.exit
	movl	8(%r8), %eax
	testl	%eax, %eax
	jne	.LBB21_8
# %bb.7:                                # %if.then2
	callq	_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv@PLT
	movq	_ZN6Halide7Runtime8Internal10work_queueE@GOTPCREL(%rip), %r8
	movq	-64(%rbp), %rdx                 # 8-byte Reload
.LBB21_8:                               # %if.end
	testl	%eax, %eax
	movl	$1, %ecx
	cmovgl	%eax, %ecx
	cmpl	$256, %ecx                      # imm = 0x100
	movl	$256, %eax                      # imm = 0x100
	cmovbl	%ecx, %eax
	movl	%eax, 8(%r8)
	movb	$1, 2121(%r8)
	movl	%r14d, %r15d
	movl	%r14d, -48(%rbp)                # 4-byte Spill
	testl	%r14d, %r14d
	jg	.LBB21_20
.LBB21_10:
	xorl	%r13d, %r13d
	movl	$-1, %r10d
	xorl	%r14d, %r14d
	xorl	%edi, %edi
	xorl	%r12d, %r12d
	testq	%rdx, %rdx
	movl	%edi, -52(%rbp)                 # 4-byte Spill
	jne	.LBB21_25
.LBB21_13:                              # %if.then32
	movl	%r10d, -68(%rbp)                # 4-byte Spill
	movl	%r14d, %eax
	orb	%dil, %al
	sete	-41(%rbp)                       # 1-byte Folded Spill
	movl	24(%r8), %ecx
	cmpl	$255, %ecx
	jg	.LBB21_18
# %bb.14:                               # %land.rhs.preheader
	movzbl	%al, %eax
	addl	%eax, %r12d
	jmp	.LBB21_15
	.p2align	4, 0x90
.LBB21_17:                              # %while.body
                                        #   in Loop: Header=BB21_15 Depth=1
	incl	28(%r8)
	movq	_ZN6Halide7Runtime8Internal13worker_threadEPv@GOTPCREL(%rip), %rdi
	xorl	%esi, %esi
	callq	halide_spawn_thread@PLT
	movq	_ZN6Halide7Runtime8Internal10work_queueE@GOTPCREL(%rip), %r8
	movslq	24(%r8), %rdx
	leal	1(%rdx), %ecx
	movl	%ecx, 24(%r8)
	movq	%rax, 72(%r8,%rdx,8)
	cmpq	$255, %rdx
	jge	.LBB21_18
.LBB21_15:                              # %land.rhs
                                        # =>This Inner Loop Header: Depth=1
	movl	8(%r8), %eax
	decl	%eax
	cmpl	%eax, %ecx
	jl	.LBB21_17
# %bb.16:                               # %lor.rhs
                                        #   in Loop: Header=BB21_15 Depth=1
	subl	2124(%r8), %ecx
	incl	%ecx
	cmpl	%r12d, %ecx
	jl	.LBB21_17
.LBB21_18:                              # %do.end50
	cmpb	$0, -41(%rbp)                   # 1-byte Folded Reload
	movl	-48(%rbp), %esi                 # 4-byte Reload
	movl	-68(%rbp), %r10d                # 4-byte Reload
	jne	.LBB21_29
# %bb.19:                               # %if.then54
	incl	2124(%r8)
.LBB21_29:                              # %if.end77
	testl	%esi, %esi
	jle	.LBB21_33
# %bb.30:                               # %for.body83.preheader
	movq	16(%r8), %rax
	incq	%r15
	.p2align	4, 0x90
.LBB21_31:                              # %for.body83
                                        # =>This Inner Loop Header: Depth=1
	leal	-2(%r15), %ecx
	shlq	$7, %rcx
	movq	%rax, 64(%rbx,%rcx)
	leaq	(%rbx,%rcx), %rax
	movq	%rbx, 72(%rbx,%rcx)
	movl	%esi, 80(%rbx,%rcx)
	movl	$0, 96(%rbx,%rcx)
	decq	%r15
	cmpq	$1, %r15
	ja	.LBB21_31
# %bb.32:                               # %for.cond80.for.cond.cleanup82_crit_edge
	movq	%rbx, 16(%r8)
.LBB21_33:                              # %for.cond.cleanup82
	movl	24(%r8), %eax
	movl	64(%r8), %ecx
	cmpl	%ecx, %r10d
	cmovgl	%eax, %r10d
	cmpl	%eax, %ecx
	cmovll	%eax, %r10d
	cmpl	$0, 68(%r8)
	cmovnel	%eax, %r10d
	movl	%r10d, 32(%r8)
	leaq	40(%r8), %rdi
	callq	halide_cond_broadcast@PLT
	movq	_ZN6Halide7Runtime8Internal10work_queueE@GOTPCREL(%rip), %rcx
	movl	32(%rcx), %eax
	cmpl	28(%rcx), %eax
	jle	.LBB21_36
# %bb.34:                               # %if.then107
	leaq	48(%rcx), %rdi
	callq	halide_cond_broadcast@PLT
	movq	_ZN6Halide7Runtime8Internal10work_queueE@GOTPCREL(%rip), %rcx
	testb	%r13b, %r13b
	je	.LBB21_36
# %bb.35:                               # %if.then109
	leaq	56(%rcx), %rdi
	callq	halide_cond_broadcast@PLT
	movq	_ZN6Halide7Runtime8Internal10work_queueE@GOTPCREL(%rip), %rcx
.LBB21_36:                              # %if.end111
	orb	-52(%rbp), %r14b                # 1-byte Folded Reload
	je	.LBB21_40
# %bb.37:                               # %if.then115
	movq	-64(%rbp), %rax                 # 8-byte Reload
	testq	%rax, %rax
	je	.LBB21_39
# %bb.38:                               # %if.then117
	decl	96(%rax)
	jmp	.LBB21_40
.LBB21_39:                              # %if.else120
	decl	2124(%rcx)
.LBB21_40:                              # %if.end123
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end21:
	.size	_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_, .Lfunc_end21-_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE # -- Begin function _ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE,@function
_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE: # @_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$88, %rsp
	movq	%rdi, %r13
	xorl	%eax, %eax
	movq	%rax, -48(%rbp)                 # 8-byte Spill
	movq	_ZN6Halide7Runtime8Internal10work_queueE@GOTPCREL(%rip), %r14
	leaq	48(%r14), %rax
	movq	%rax, -104(%rbp)                # 8-byte Spill
	leaq	40(%r14), %rax
	movq	%rax, -96(%rbp)                 # 8-byte Spill
	leaq	56(%r14), %rax
	movq	%rax, -64(%rbp)                 # 8-byte Spill
	leaq	16(%r14), %rax
	movq	%rax, -120(%rbp)                # 8-byte Spill
	movq	%rdi, -88(%rbp)                 # 8-byte Spill
	jmp	.LBB22_1
.LBB22_91:                              # %land.lhs.true307
                                        #   in Loop: Header=BB22_1 Depth=1
	cmpb	$0, 124(%r12)
	movl	$0, %eax
	movq	%rax, -48(%rbp)                 # 8-byte Spill
	je	.LBB22_1
	.p2align	4, 0x90
.LBB22_92:                              # %if.then310
                                        #   in Loop: Header=BB22_1 Depth=1
	movq	-64(%rbp), %rdi                 # 8-byte Reload
	callq	halide_cond_broadcast@PLT
	xorl	%eax, %eax
	movq	%rax, -48(%rbp)                 # 8-byte Spill
.LBB22_1:                               # %while.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB22_13 Depth 2
                                        #     Child Loop BB22_11 Depth 2
                                        #       Child Loop BB22_30 Depth 3
                                        #     Child Loop BB22_52 Depth 2
                                        #       Child Loop BB22_54 Depth 3
                                        #         Child Loop BB22_55 Depth 4
                                        #     Child Loop BB22_78 Depth 2
	testq	%r13, %r13
	je	.LBB22_7
# %bb.2:                                # %cond.true
                                        #   in Loop: Header=BB22_1 Depth=1
	movl	112(%r13), %eax
	movl	40(%r13), %ecx
	orl	%eax, %ecx
	je	.LBB22_93
# %bb.3:                                # %if.then
                                        #   in Loop: Header=BB22_1 Depth=1
	movq	16(%r14), %r12
	cmpl	$0, 116(%r13)
	je	.LBB22_16
# %bb.4:                                # %if.then3
                                        #   in Loop: Header=BB22_1 Depth=1
	testl	%eax, %eax
	jne	.LBB22_9
# %bb.5:                                # %while.cond6.preheader
                                        #   in Loop: Header=BB22_1 Depth=1
	cmpq	%r13, %r12
	je	.LBB22_6
	.p2align	4, 0x90
.LBB22_13:                              # %while.body8
                                        #   Parent Loop BB22_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%r12, %rax
	movq	64(%r12), %r12
	cmpq	%r13, %r12
	jne	.LBB22_13
# %bb.14:                               # %while.end.loopexit
                                        #   in Loop: Header=BB22_1 Depth=1
	addq	$64, %rax
	jmp	.LBB22_15
	.p2align	4, 0x90
.LBB22_7:                               # %cond.end
                                        #   in Loop: Header=BB22_1 Depth=1
	cmpb	$0, 2120(%r14)
	jne	.LBB22_93
# %bb.8:                                # %while.body.thread
                                        #   in Loop: Header=BB22_1 Depth=1
	movq	16(%r14), %r12
.LBB22_9:                               # %do.end
                                        #   in Loop: Header=BB22_1 Depth=1
	movq	%r14, %r15
	testq	%r12, %r12
	je	.LBB22_34
# %bb.10:                               # %do.end27.preheader
                                        #   in Loop: Header=BB22_1 Depth=1
	movq	-120(%rbp), %r14                # 8-byte Reload
	jmp	.LBB22_11
	.p2align	4, 0x90
.LBB22_33:                              # %cleanup
                                        #   in Loop: Header=BB22_11 Depth=2
	movq	%r12, %r14
	movq	64(%r12), %rax
	addq	$64, %r14
	movq	%rax, %r12
	testq	%rax, %rax
	je	.LBB22_34
.LBB22_11:                              # %do.end27
                                        #   Parent Loop BB22_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB22_30 Depth 3
	movq	88(%r12), %rdi
	testq	%rdi, %rdi
	je	.LBB22_12
# %bb.19:                               # %if.else32
                                        #   in Loop: Header=BB22_11 Depth=2
	movl	44(%rdi), %edx
	movl	112(%rdi), %ecx
	testl	%ecx, %ecx
	je	.LBB22_21
# %bb.20:                               # %if.else38
                                        #   in Loop: Header=BB22_11 Depth=2
	imull	%ecx, %edx
.LBB22_21:                              # %if.end45
                                        #   in Loop: Header=BB22_11 Depth=2
	subl	96(%rdi), %edx
	jmp	.LBB22_22
	.p2align	4, 0x90
.LBB22_12:                              # %if.then31
                                        #   in Loop: Header=BB22_11 Depth=2
	movq	%r15, %rax
	movl	24(%r15), %edx
	subl	2124(%r15), %edx
	incl	%edx
.LBB22_22:                              # %if.end45
                                        #   in Loop: Header=BB22_11 Depth=2
	movl	44(%r12), %esi
	movb	$1, %bl
	movb	$1, %cl
	testq	%r13, %r13
	je	.LBB22_24
# %bb.23:                               # %lor.lhs.false
                                        #   in Loop: Header=BB22_11 Depth=2
	movq	72(%r12), %rcx
	cmpq	72(%r13), %rcx
	sete	%al
	testl	%esi, %esi
	sete	%cl
	orb	%al, %cl
.LBB22_24:                              # %lor.end
                                        #   in Loop: Header=BB22_11 Depth=2
	cmpb	$0, 48(%r12)
	je	.LBB22_26
# %bb.25:                               # %lor.rhs70
                                        #   in Loop: Header=BB22_11 Depth=2
	cmpl	$0, 112(%r12)
	sete	%bl
.LBB22_26:                              # %lor.end73
                                        #   in Loop: Header=BB22_11 Depth=2
	cmpl	%esi, %edx
	jl	.LBB22_33
# %bb.27:                               # %lor.end73
                                        #   in Loop: Header=BB22_11 Depth=2
	xorb	$1, %cl
	jne	.LBB22_33
# %bb.28:                               # %lor.end73
                                        #   in Loop: Header=BB22_11 Depth=2
	testb	%bl, %bl
	je	.LBB22_33
# %bb.29:                               # %if.then86
                                        #   in Loop: Header=BB22_11 Depth=2
	movl	120(%r12), %ecx
	cmpl	32(%r12), %ecx
	jge	.LBB22_46
	.p2align	4, 0x90
.LBB22_30:                              # %for.body.i
                                        #   Parent Loop BB22_1 Depth=1
                                        #     Parent Loop BB22_11 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	24(%r12), %rax
	movslq	%ecx, %rcx
	shlq	$4, %rcx
	movq	(%rax,%rcx), %rdi
	movl	8(%rax,%rcx), %esi
	callq	halide_default_semaphore_try_acquire@PLT
	testb	%al, %al
	je	.LBB22_33
# %bb.31:                               # %for.inc.i
                                        #   in Loop: Header=BB22_30 Depth=3
	movl	120(%r12), %ecx
	incl	%ecx
	movl	%ecx, 120(%r12)
	cmpl	32(%r12), %ecx
	jl	.LBB22_30
# %bb.32:                               # %if.else127.loopexit
                                        #   in Loop: Header=BB22_1 Depth=1
	leaq	88(%r12), %rcx
	leaq	44(%r12), %rax
	movq	88(%r12), %rdi
	movl	44(%r12), %esi
	movl	$0, 120(%r12)
	incl	112(%r12)
	testq	%rdi, %rdi
	je	.LBB22_48
.LBB22_49:                              # %if.else143
                                        #   in Loop: Header=BB22_1 Depth=1
	addl	%esi, 96(%rdi)
	cmpb	$0, 48(%r12)
	movq	%rax, -48(%rbp)                 # 8-byte Spill
	movq	%rcx, -56(%rbp)                 # 8-byte Spill
	je	.LBB22_70
.LBB22_51:                              # %if.then156
                                        #   in Loop: Header=BB22_1 Depth=1
	movq	64(%r12), %rax
	movq	%rax, (%r14)
	movq	%r15, %r14
	movq	%r15, %rdi
	callq	halide_mutex_unlock@PLT
	xorl	%ebx, %ebx
	movl	$1, %r15d
	.p2align	4, 0x90
.LBB22_52:                              # %while.cond161.preheader
                                        #   Parent Loop BB22_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB22_54 Depth 3
                                        #         Child Loop BB22_55 Depth 4
	movl	40(%r12), %ecx
	movl	%ecx, %eax
	subl	%ebx, %eax
	cmpl	%r15d, %eax
	jle	.LBB22_61
# %bb.53:                               # %land.rhs.preheader
                                        #   in Loop: Header=BB22_52 Depth=2
	movl	32(%r12), %eax
	movl	120(%r12), %edx
	jmp	.LBB22_54
	.p2align	4, 0x90
.LBB22_58:                              # %while.body167
                                        #   in Loop: Header=BB22_54 Depth=3
	movl	$0, 120(%r12)
	incl	%r15d
	movl	%ecx, %esi
	subl	%ebx, %esi
	xorl	%edx, %edx
	cmpl	%r15d, %esi
	jle	.LBB22_59
.LBB22_54:                              # %land.rhs
                                        #   Parent Loop BB22_1 Depth=1
                                        #     Parent Loop BB22_52 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB22_55 Depth 4
	cmpl	%eax, %edx
	jge	.LBB22_58
	.p2align	4, 0x90
.LBB22_55:                              # %for.body.i480
                                        #   Parent Loop BB22_1 Depth=1
                                        #     Parent Loop BB22_52 Depth=2
                                        #       Parent Loop BB22_54 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movq	24(%r12), %rax
	movslq	%edx, %rcx
	shlq	$4, %rcx
	movq	(%rax,%rcx), %rdi
	movl	8(%rax,%rcx), %esi
	callq	halide_default_semaphore_try_acquire@PLT
	testb	%al, %al
	je	.LBB22_61
# %bb.56:                               # %for.inc.i483
                                        #   in Loop: Header=BB22_55 Depth=4
	movl	32(%r12), %eax
	movl	120(%r12), %edx
	incl	%edx
	movl	%edx, 120(%r12)
	cmpl	%eax, %edx
	jl	.LBB22_55
# %bb.57:                               # %while.body167.loopexit
                                        #   in Loop: Header=BB22_54 Depth=3
	movl	40(%r12), %ecx
	jmp	.LBB22_58
	.p2align	4, 0x90
.LBB22_61:                              # %while.end169
                                        #   in Loop: Header=BB22_52 Depth=2
	testl	%r15d, %r15d
	je	.LBB22_62
.LBB22_59:                              # %if.end172
                                        #   in Loop: Header=BB22_52 Depth=2
	movq	104(%r12), %rdi
	movl	36(%r12), %edx
	addl	%ebx, %edx
	movq	(%r12), %rsi
	movq	8(%r12), %r8
	movl	%r15d, %ecx
	movq	%r12, %r9
	callq	halide_do_loop_task@PLT
	addl	%r15d, %ebx
	xorl	%r15d, %r15d
	testl	%eax, %eax
	je	.LBB22_52
# %bb.60:                               #   in Loop: Header=BB22_1 Depth=1
	movl	%eax, %r13d
	jmp	.LBB22_63
	.p2align	4, 0x90
.LBB22_34:                              # %if.then103
                                        #   in Loop: Header=BB22_1 Depth=1
	testq	%r13, %r13
	je	.LBB22_39
# %bb.35:                               # %if.then105
                                        #   in Loop: Header=BB22_1 Depth=1
	movq	-48(%rbp), %rax                 # 8-byte Reload
	leal	1(%rax), %ebx
	movq	%r15, %r14
	cmpl	$39, %eax
	jg	.LBB22_37
# %bb.36:                               # %if.then107
                                        #   in Loop: Header=BB22_1 Depth=1
	movq	%r15, %rdi
	callq	halide_mutex_unlock@PLT
	callq	halide_thread_yield@PLT
	movq	%r15, %rdi
	callq	halide_mutex_lock@PLT
	jmp	.LBB22_38
	.p2align	4, 0x90
.LBB22_16:                              # %if.else
                                        #   in Loop: Header=BB22_1 Depth=1
	movq	88(%r13), %rax
	testq	%rax, %rax
	je	.LBB22_9
# %bb.17:                               # %land.lhs.true
                                        #   in Loop: Header=BB22_1 Depth=1
	movl	116(%rax), %eax
	testl	%eax, %eax
	je	.LBB22_9
# %bb.18:                               # %if.then15
                                        #   in Loop: Header=BB22_1 Depth=1
	movl	%eax, 116(%r13)
	movq	-64(%rbp), %rdi                 # 8-byte Reload
	callq	halide_cond_broadcast@PLT
	jmp	.LBB22_1
.LBB22_62:                              #   in Loop: Header=BB22_1 Depth=1
	xorl	%r13d, %r13d
	movb	$1, %r15b
.LBB22_63:                              # %while.end179
                                        #   in Loop: Header=BB22_1 Depth=1
	movq	%r14, %rdi
	callq	halide_mutex_lock@PLT
	addl	%ebx, 36(%r12)
	movl	40(%r12), %eax
	subl	%ebx, %eax
	movl	%eax, 40(%r12)
	testb	%r15b, %r15b
	je	.LBB22_64
# %bb.67:                               # %if.else190
                                        #   in Loop: Header=BB22_1 Depth=1
	testl	%eax, %eax
	jle	.LBB22_68
# %bb.69:                               # %if.then194
                                        #   in Loop: Header=BB22_1 Depth=1
	movq	16(%r14), %rax
	movq	%rax, 64(%r12)
	movq	%r12, 16(%r14)
.LBB22_68:                              #   in Loop: Header=BB22_1 Depth=1
	xorl	%eax, %eax
	movq	-48(%rbp), %r8                  # 8-byte Reload
	movq	-56(%rbp), %rbx                 # 8-byte Reload
	movq	(%rbx), %rcx
	movl	(%r8), %edx
	testq	%rcx, %rcx
	jne	.LBB22_86
	jmp	.LBB22_85
.LBB22_64:                              # %if.end230.thread502
                                        #   in Loop: Header=BB22_1 Depth=1
	movl	$0, 40(%r12)
	movq	-48(%rbp), %r8                  # 8-byte Reload
	movq	-56(%rbp), %rbx                 # 8-byte Reload
	jmp	.LBB22_65
.LBB22_39:                              # %if.else112
                                        #   in Loop: Header=BB22_1 Depth=1
	movq	%r15, %r14
	incl	64(%r15)
	movl	28(%r15), %eax
	cmpl	32(%r15), %eax
	jle	.LBB22_41
# %bb.40:                               # %if.then115
                                        #   in Loop: Header=BB22_1 Depth=1
	decl	%eax
	movl	%eax, 28(%r14)
	movq	-104(%rbp), %rdi                # 8-byte Reload
	movq	%r14, %rsi
	callq	halide_cond_wait@PLT
	incl	28(%r14)
	decl	64(%r14)
	jmp	.LBB22_1
.LBB22_37:                              # %if.else108
                                        #   in Loop: Header=BB22_1 Depth=1
	incl	68(%r15)
	movb	$1, 124(%r13)
	movq	-64(%rbp), %rdi                 # 8-byte Reload
	movq	%r15, %rsi
	callq	halide_cond_wait@PLT
	movb	$0, 124(%r13)
	decl	68(%r15)
.LBB22_38:                              # %while.cond
                                        #   in Loop: Header=BB22_1 Depth=1
	movl	%ebx, %eax
	movq	%rax, -48(%rbp)                 # 8-byte Spill
	jmp	.LBB22_1
.LBB22_41:                              # %if.else118
                                        #   in Loop: Header=BB22_1 Depth=1
	movq	-48(%rbp), %rax                 # 8-byte Reload
	leal	1(%rax), %ebx
	cmpl	$39, %eax
	jg	.LBB22_43
# %bb.42:                               # %if.then121
                                        #   in Loop: Header=BB22_1 Depth=1
	movq	%r14, %rdi
	callq	halide_mutex_unlock@PLT
	callq	halide_thread_yield@PLT
	movq	%r14, %rdi
	callq	halide_mutex_lock@PLT
	jmp	.LBB22_44
.LBB22_6:                               #   in Loop: Header=BB22_1 Depth=1
	leaq	16(%r14), %rax
.LBB22_15:                              # %while.end
                                        #   in Loop: Header=BB22_1 Depth=1
	movq	64(%r13), %rcx
	movq	%rcx, (%rax)
	movl	$0, 40(%r13)
	jmp	.LBB22_1
.LBB22_43:                              # %if.else122
                                        #   in Loop: Header=BB22_1 Depth=1
	movq	-96(%rbp), %rdi                 # 8-byte Reload
	movq	%r14, %rsi
	callq	halide_cond_wait@PLT
.LBB22_44:                              # %if.end124
                                        #   in Loop: Header=BB22_1 Depth=1
	movl	%ebx, %eax
	movq	%rax, -48(%rbp)                 # 8-byte Spill
	decl	64(%r14)
	jmp	.LBB22_1
.LBB22_46:                              # %if.else127.loopexit63
                                        #   in Loop: Header=BB22_1 Depth=1
	leaq	88(%r12), %rcx
	leaq	44(%r12), %rax
	movl	$0, 120(%r12)
	incl	112(%r12)
	testq	%rdi, %rdi
	jne	.LBB22_49
.LBB22_48:                              # %if.then136
                                        #   in Loop: Header=BB22_1 Depth=1
	addl	%esi, 2124(%r15)
	cmpb	$0, 48(%r12)
	movq	%rax, -48(%rbp)                 # 8-byte Spill
	movq	%rcx, -56(%rbp)                 # 8-byte Spill
	jne	.LBB22_51
.LBB22_70:                              # %if.else198
                                        #   in Loop: Header=BB22_1 Depth=1
	movq	(%r12), %rax
	movq	%rax, -112(%rbp)                # 8-byte Spill
	movq	8(%r12), %rax
	movq	%rax, -80(%rbp)                 # 8-byte Spill
	movl	36(%r12), %r13d
	movq	56(%r12), %rbx
	movq	104(%r12), %rax
	movq	%rax, -72(%rbp)                 # 8-byte Spill
	leal	1(%r13), %eax
	movl	%eax, 36(%r12)
	decl	40(%r12)
	jne	.LBB22_72
# %bb.71:                               # %if.then208
                                        #   in Loop: Header=BB22_1 Depth=1
	movq	64(%r12), %rax
	movq	%rax, (%r14)
.LBB22_72:                              # %if.end210
                                        #   in Loop: Header=BB22_1 Depth=1
	movq	%r15, %r14
	movq	%r15, %rdi
	callq	halide_mutex_unlock@PLT
	testq	%rbx, %rbx
	je	.LBB22_74
# %bb.73:                               # %if.then212
                                        #   in Loop: Header=BB22_1 Depth=1
	movq	-72(%rbp), %rdi                 # 8-byte Reload
	movq	%rbx, %rsi
	movl	%r13d, %edx
	movq	-80(%rbp), %rcx                 # 8-byte Reload
	callq	halide_do_task@PLT
	jmp	.LBB22_75
.LBB22_74:                              # %if.else220
                                        #   in Loop: Header=BB22_1 Depth=1
	movq	-72(%rbp), %rdi                 # 8-byte Reload
	movq	-112(%rbp), %rsi                # 8-byte Reload
	movl	%r13d, %edx
	movl	$1, %ecx
	movq	-80(%rbp), %r8                  # 8-byte Reload
	movq	%r12, %r9
	callq	halide_do_loop_task@PLT
.LBB22_75:                              # %if.end230
                                        #   in Loop: Header=BB22_1 Depth=1
	movl	%eax, %r13d
	movq	%r14, %rdi
	callq	halide_mutex_lock@PLT
	testl	%r13d, %r13d
	movq	-48(%rbp), %r8                  # 8-byte Reload
	movq	-56(%rbp), %rbx                 # 8-byte Reload
	je	.LBB22_76
.LBB22_65:                              # %if.then238
                                        #   in Loop: Header=BB22_1 Depth=1
	movl	%r13d, 116(%r12)
	movl	80(%r12), %ecx
	testl	%ecx, %ecx
	jle	.LBB22_66
# %bb.77:                               # %do.end243.lr.ph
                                        #   in Loop: Header=BB22_1 Depth=1
	movq	72(%r12), %rdx
	shlq	$7, %rcx
	xorl	%esi, %esi
	xorl	%eax, %eax
	jmp	.LBB22_78
.LBB22_81:                              # %land.rhs254
                                        #   in Loop: Header=BB22_78 Depth=2
	movzbl	124(%rdx,%rsi), %edi
.LBB22_82:                              # %land.end260
                                        #   in Loop: Header=BB22_78 Depth=2
	andb	$1, %al
	orb	%dil, %al
.LBB22_83:                              # %for.inc
                                        #   in Loop: Header=BB22_78 Depth=2
	subq	$-128, %rsi
	cmpq	%rsi, %rcx
	je	.LBB22_84
.LBB22_78:                              # %do.end243
                                        #   Parent Loop BB22_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$0, 116(%rdx,%rsi)
	jne	.LBB22_83
# %bb.79:                               # %if.then247
                                        #   in Loop: Header=BB22_78 Depth=2
	movl	%r13d, 116(%rdx,%rsi)
	cmpl	$0, 112(%r12)
	je	.LBB22_81
# %bb.80:                               #   in Loop: Header=BB22_78 Depth=2
	xorl	%edi, %edi
	jmp	.LBB22_82
.LBB22_66:                              #   in Loop: Header=BB22_1 Depth=1
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB22_84:                              # %if.end271
                                        #   in Loop: Header=BB22_1 Depth=1
	movq	(%rbx), %rcx
	movl	(%r8), %edx
	testq	%rcx, %rcx
	je	.LBB22_85
.LBB22_86:                              # %if.else281
                                        #   in Loop: Header=BB22_1 Depth=1
	subl	%edx, 96(%rcx)
	jmp	.LBB22_87
.LBB22_76:                              #   in Loop: Header=BB22_1 Depth=1
	xorl	%eax, %eax
	movq	(%rbx), %rcx
	movl	(%r8), %edx
	testq	%rcx, %rcx
	jne	.LBB22_86
.LBB22_85:                              # %if.then274
                                        #   in Loop: Header=BB22_1 Depth=1
	subl	%edx, 2124(%r14)
.LBB22_87:                              # %if.end290
                                        #   in Loop: Header=BB22_1 Depth=1
	movq	-88(%rbp), %r13                 # 8-byte Reload
	movl	112(%r12), %ecx
	decl	%ecx
	movl	%ecx, 112(%r12)
	testb	$1, %al
	jne	.LBB22_92
# %bb.88:                               # %lor.lhs.false297
                                        #   in Loop: Header=BB22_1 Depth=1
	movl	$0, %eax
	movq	%rax, -48(%rbp)                 # 8-byte Spill
	testl	%ecx, %ecx
	jne	.LBB22_1
# %bb.89:                               # %land.lhs.true300
                                        #   in Loop: Header=BB22_1 Depth=1
	cmpl	$0, 40(%r12)
	je	.LBB22_91
# %bb.90:                               # %lor.lhs.false304
                                        #   in Loop: Header=BB22_1 Depth=1
	cmpl	$0, 116(%r12)
	movl	$0, %eax
	movq	%rax, -48(%rbp)                 # 8-byte Spill
	jne	.LBB22_91
	jmp	.LBB22_1
.LBB22_93:                              # %while.end316
	addq	$88, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end22:
	.size	_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE, .Lfunc_end22-_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE
                                        # -- End function
	.section	.text.halide_mutex_unlock,"ax",@progbits
	.weak	halide_mutex_unlock             # -- Begin function halide_mutex_unlock
	.p2align	4, 0x90
	.type	halide_mutex_unlock,@function
halide_mutex_unlock:                    # @halide_mutex_unlock
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	xorl	%ecx, %ecx
	movl	$1, %eax
	lock		cmpxchgq	%rcx, (%rdi)
	je	.LBB23_3
# %bb.1:                                # %if.then.i
	movq	%rdi, %rsi
	xorl	%ecx, %ecx
	movl	$1, %eax
	lock		cmpxchgq	%rcx, (%rdi)
	je	.LBB23_3
# %bb.2:                                # %if.end.i.i
	movq	_ZTVN6Halide7Runtime8Internal15Synchronization21mutex_parking_controlE@GOTPCREL(%rip), %rax
	addq	$16, %rax
	movq	%rax, -16(%rbp)
	movq	%rsi, -8(%rbp)
	leaq	-16(%rbp), %rdi
	callq	_ZN6Halide7Runtime8Internal15Synchronization15parking_control10unpark_oneEy@PLT
.LBB23_3:                               # %_ZN6Halide7Runtime8Internal15Synchronization10fast_mutex6unlockEv.exit
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end23:
	.size	halide_mutex_unlock, .Lfunc_end23-halide_mutex_unlock
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization15parking_control10unpark_oneEy,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization15parking_control10unpark_oneEy # -- Begin function _ZN6Halide7Runtime8Internal15Synchronization15parking_control10unpark_oneEy
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal15Synchronization15parking_control10unpark_oneEy,@function
_ZN6Halide7Runtime8Internal15Synchronization15parking_control10unpark_oneEy: # @_ZN6Halide7Runtime8Internal15Synchronization15parking_control10unpark_oneEy
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	movq	%rsi, %r15
	movq	%rdi, -56(%rbp)                 # 8-byte Spill
	movq	%rsi, %rdi
	callq	_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy@PLT
	movq	%rax, %rbx
	movq	8(%rax), %r12
	movq	%rax, %r13
	addq	$8, %r13
	xorl	%eax, %eax
	movq	%rax, -64(%rbp)                 # 8-byte Spill
                                        # implicit-def: $rax
                                        # kill: killed $rax
	jmp	.LBB24_2
	.p2align	4, 0x90
.LBB24_1:                               #   in Loop: Header=BB24_2 Depth=1
	leaq	144(%r12), %r13
	movq	%r12, -64(%rbp)                 # 8-byte Spill
	movq	%rax, %r12
	cmpq	%r15, %r14
	je	.LBB24_22
.LBB24_2:                               # %while.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB24_6 Depth 2
                                        #     Child Loop BB24_12 Depth 2
	testq	%r12, %r12
	je	.LBB24_17
# %bb.3:                                # %while.body
                                        #   in Loop: Header=BB24_2 Depth=1
	movq	136(%r12), %r14
	movq	144(%r12), %rax
	cmpq	%r15, %r14
	jne	.LBB24_1
# %bb.4:                                # %if.then
                                        #   in Loop: Header=BB24_2 Depth=1
	movq	%rax, (%r13)
	cmpq	%r12, 16(%rbx)
	je	.LBB24_9
# %bb.5:                                # %while.cond7.preheader
                                        #   in Loop: Header=BB24_2 Depth=1
	testq	%rax, %rax
	je	.LBB24_10
	.p2align	4, 0x90
.LBB24_6:                               # %while.body9
                                        #   Parent Loop BB24_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	136(%rax), %rcx
	movq	144(%rax), %rax
	testq	%rax, %rax
	je	.LBB24_8
# %bb.7:                                # %while.body9
                                        #   in Loop: Header=BB24_6 Depth=2
	cmpq	%r15, %rcx
	jne	.LBB24_6
.LBB24_8:                               # %if.end.loopexit
                                        #   in Loop: Header=BB24_2 Depth=1
	cmpq	%r15, %rcx
	sete	%al
	jmp	.LBB24_11
.LBB24_9:                               # %if.then5
                                        #   in Loop: Header=BB24_2 Depth=1
	movq	-64(%rbp), %rax                 # 8-byte Reload
	movq	%rax, 16(%rbx)
.LBB24_10:                              #   in Loop: Header=BB24_2 Depth=1
	xorl	%eax, %eax
.LBB24_11:                              # %if.end
                                        #   in Loop: Header=BB24_2 Depth=1
	movq	-56(%rbp), %rdi                 # 8-byte Reload
	movq	(%rdi), %rcx
	movzbl	%al, %edx
	movl	$1, %esi
	movq	%rdx, -48(%rbp)                 # 8-byte Spill
                                        # kill: def $edx killed $edx killed $rdx
	callq	*16(%rcx)
	movq	%rax, 152(%r12)
	movq	%r12, %rdi
	callq	pthread_mutex_lock@PLT
	movq	(%rbx), %rax
	.p2align	4, 0x90
.LBB24_12:                              # %atomicrmw.start
                                        #   Parent Loop BB24_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%rax, %rcx
	andq	$-2, %rcx
	lock		cmpxchgq	%rcx, (%rbx)
	jne	.LBB24_12
# %bb.13:                               # %atomicrmw.end
                                        #   in Loop: Header=BB24_2 Depth=1
	cmpq	$4, %rax
	jb	.LBB24_16
# %bb.14:                               # %atomicrmw.end
                                        #   in Loop: Header=BB24_2 Depth=1
	andl	$2, %eax
	testq	%rax, %rax
	jne	.LBB24_16
# %bb.15:                               # %if.then.i
                                        #   in Loop: Header=BB24_2 Depth=1
	movq	%rbx, %rdi
	callq	_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv@PLT
.LBB24_16:                              # %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit
                                        #   in Loop: Header=BB24_2 Depth=1
	movb	$0, 128(%r12)
	leaq	64(%r12), %rdi
	callq	pthread_cond_signal@PLT
	movq	%r12, %rdi
	callq	pthread_mutex_unlock@PLT
	cmpq	%r15, %r14
	jne	.LBB24_2
	jmp	.LBB24_22
.LBB24_17:                              # %while.end22
	movq	-56(%rbp), %rdi                 # 8-byte Reload
	movq	(%rdi), %rax
	xorl	%esi, %esi
	xorl	%edx, %edx
	callq	*16(%rax)
	movq	(%rbx), %rax
	.p2align	4, 0x90
.LBB24_18:                              # %atomicrmw.start2
                                        # =>This Inner Loop Header: Depth=1
	movq	%rax, %rcx
	andq	$-2, %rcx
	lock		cmpxchgq	%rcx, (%rbx)
	jne	.LBB24_18
# %bb.19:                               # %atomicrmw.end1
	xorl	%ecx, %ecx
	movq	%rcx, -48(%rbp)                 # 8-byte Spill
	cmpq	$4, %rax
	jb	.LBB24_22
# %bb.20:                               # %atomicrmw.end1
	andl	$2, %eax
	testq	%rax, %rax
	jne	.LBB24_22
# %bb.21:                               # %if.then.i68
	movq	%rbx, %rdi
	callq	_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv@PLT
	xorl	%eax, %eax
	movq	%rax, -48(%rbp)                 # 8-byte Spill
.LBB24_22:                              # %cleanup27
	movq	-48(%rbp), %rax                 # 8-byte Reload
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end24:
	.size	_ZN6Halide7Runtime8Internal15Synchronization15parking_control10unpark_oneEy, .Lfunc_end24-_ZN6Halide7Runtime8Internal15Synchronization15parking_control10unpark_oneEy
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy # -- Begin function _ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy,@function
_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy: # @_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	pushq	%rax
	movabsq	$-7046029254386353131, %rax     # imm = 0x9E3779B97F4A7C15
	imulq	%rdi, %rax
	shrq	$54, %rax
	leaq	(%rax,%rax,2), %rcx
	movq	_ZN6Halide7Runtime8Internal15Synchronization5tableE@GOTPCREL(%rip), %rdx
	leaq	(%rdx,%rcx,8), %rbx
	movl	$1, %esi
	xorl	%eax, %eax
	lock		cmpxchgq	%rsi, (%rdx,%rcx,8)
	je	.LBB25_2
# %bb.1:                                # %if.then.i
	movq	%rbx, %rdi
	callq	_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv@PLT
.LBB25_2:                               # %_ZN6Halide7Runtime8Internal15Synchronization9word_lock4lockEv.exit
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end25:
	.size	_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy, .Lfunc_end25-_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv # -- Begin function _ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv,@function
_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv: # @_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movq	%rdi, %r14
	movq	(%rdi), %rbx
	.p2align	4, 0x90
.LBB26_1:                               # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpq	$4, %rbx
	jb	.LBB26_18
# %bb.2:                                # %while.cond
                                        #   in Loop: Header=BB26_1 Depth=1
	movl	%ebx, %eax
	andl	$2, %eax
	testq	%rax, %rax
	jne	.LBB26_18
# %bb.3:                                # %if.end
                                        #   in Loop: Header=BB26_1 Depth=1
	movq	%rbx, %rcx
	orq	$2, %rcx
	movq	%rbx, %rax
	lock		cmpxchgq	%rcx, (%r14)
	movq	%rax, %rbx
	jne	.LBB26_1
	jmp	.LBB26_4
	.p2align	4, 0x90
.LBB26_11:                              #   in Loop: Header=BB26_4 Depth=1
	movq	%rax, %rbx
	#MEMBARRIER
	jmp	.LBB26_4
	.p2align	4, 0x90
.LBB26_5:                               # %while.body17.preheader
                                        #   in Loop: Header=BB26_4 Depth=1
	movq	-48(%rbp), %r15                 # 8-byte Reload
	jmp	.LBB26_6
	.p2align	4, 0x90
.LBB26_8:                               # %do.end
                                        #   in Loop: Header=BB26_6 Depth=2
	movq	%r15, 144(%r13)
	movq	152(%r13), %r12
	movq	%r13, %r15
	testq	%r12, %r12
	jne	.LBB26_9
.LBB26_6:                               # %while.body17
                                        #   Parent Loop BB26_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	136(%r15), %r13
	testq	%r13, %r13
	jne	.LBB26_8
# %bb.7:                                # %if.then20
                                        #   in Loop: Header=BB26_6 Depth=2
	xorl	%edi, %edi
	leaq	.L.str.5(%rip), %rsi
	callq	halide_print@PLT
	callq	abort@PLT
	jmp	.LBB26_8
	.p2align	4, 0x90
.LBB26_4:                               # %while.cond11
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB26_6 Depth 2
                                        #     Child Loop BB26_13 Depth 2
	movq	%rbx, %rax
	andq	$-4, %rax
	movq	%rax, -48(%rbp)                 # 8-byte Spill
	movq	152(%rax), %r12
	testq	%r12, %r12
	je	.LBB26_5
.LBB26_9:                               # %while.end23
                                        #   in Loop: Header=BB26_4 Depth=1
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movq	%r12, 152(%rax)
	testb	$1, %bl
	jne	.LBB26_10
# %bb.12:                               # %if.end35
                                        #   in Loop: Header=BB26_4 Depth=1
	movq	144(%r12), %rax
	testq	%rax, %rax
	jne	.LBB26_16
	.p2align	4, 0x90
.LBB26_13:                              # %while.body41
                                        #   Parent Loop BB26_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	%ebx, %ecx
	andl	$1, %ecx
	movq	%rbx, %rax
	lock		cmpxchgq	%rcx, (%r14)
	je	.LBB26_17
# %bb.14:                               # %if.end47
                                        #   in Loop: Header=BB26_13 Depth=2
	movq	%rax, %rbx
	cmpq	$4, %rax
	jb	.LBB26_13
# %bb.15:                               # %cleanup70
                                        #   in Loop: Header=BB26_4 Depth=1
	#MEMBARRIER
	jmp	.LBB26_4
	.p2align	4, 0x90
.LBB26_10:                              # %if.then27
                                        #   in Loop: Header=BB26_4 Depth=1
	movq	%rbx, %rcx
	andq	$-3, %rcx
	movq	%rbx, %rax
	lock		cmpxchgq	%rcx, (%r14)
	jne	.LBB26_11
.LBB26_18:                              # %cleanup75
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB26_16:                              # %if.else62
	movq	-48(%rbp), %rcx                 # 8-byte Reload
	movq	%rax, 152(%rcx)
	lock		andq	$-3, (%r14)
.LBB26_17:                              # %if.end66
	movq	%r12, %rdi
	callq	pthread_mutex_lock@PLT
	movb	$0, 128(%r12)
	leaq	64(%r12), %rdi
	callq	pthread_cond_signal@PLT
	movq	%r12, %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	pthread_mutex_unlock@PLT        # TAILCALL
.Lfunc_end26:
	.size	_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv, .Lfunc_end26-_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
                                        # -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4                               # -- Begin function _ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv
.LCPI27_0:
	.zero	16
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv,@function
_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv: # @_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$168, %rsp
	movq	%rdi, %r12
	movq	(%rdi), %rbx
	movl	$40, %r13d
	leaq	-136(%rbp), %r14
	leaq	-200(%rbp), %r15
	jmp	.LBB27_1
.LBB27_16:                              # %_ZN6Halide7Runtime8Internal15Synchronization13thread_parker4parkEv.exit
                                        #   in Loop: Header=BB27_1 Depth=1
	movq	%r15, %rdi
	callq	pthread_mutex_unlock@PLT
	movq	(%r12), %rbx
	movl	$40, %r13d
.LBB27_17:                              # %if.end22
                                        #   in Loop: Header=BB27_1 Depth=1
	movq	%r14, %rdi
	callq	pthread_cond_destroy@PLT
	movq	%r15, %rdi
	callq	pthread_mutex_destroy@PLT
	.p2align	4, 0x90
.LBB27_1:                               # %while.cond.outer
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB27_14 Depth 2
	testb	$1, %bl
	jne	.LBB27_4
# %bb.2:                                # %if.then
                                        #   in Loop: Header=BB27_1 Depth=1
	movq	%rbx, %rcx
	orq	$1, %rcx
	movq	%rbx, %rax
	lock		cmpxchgq	%rcx, (%r12)
	je	.LBB27_18
# %bb.3:                                # %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_acquire_relaxedEPyS4_S4_.exit
                                        #   in Loop: Header=BB27_1 Depth=1
	movq	%rax, %rbx
	jmp	.LBB27_1
.LBB27_4:                               # %if.end4
                                        #   in Loop: Header=BB27_1 Depth=1
	cmpq	$4, %rbx
	jb	.LBB27_8
# %bb.5:                                # %if.end4
                                        #   in Loop: Header=BB27_1 Depth=1
	testl	%r13d, %r13d
	jle	.LBB27_8
# %bb.6:                                # %_ZN6Halide7Runtime8Internal15Synchronization12spin_control11should_spinEv.exit
                                        #   in Loop: Header=BB27_1 Depth=1
	decl	%r13d
	je	.LBB27_7
# %bb.19:                               # %if.then7
                                        #   in Loop: Header=BB27_1 Depth=1
	callq	halide_thread_yield@PLT
	movq	(%r12), %rbx
	jmp	.LBB27_1
.LBB27_7:                               #   in Loop: Header=BB27_1 Depth=1
	xorl	%r13d, %r13d
.LBB27_8:                               # %if.end9
                                        #   in Loop: Header=BB27_1 Depth=1
	movb	$0, -72(%rbp)
	movq	%r15, %rdi
	xorl	%esi, %esi
	callq	pthread_mutex_init@PLT
	movq	%r14, %rdi
	xorl	%esi, %esi
	callq	pthread_cond_init@PLT
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%xmm0, -64(%rbp)
	movq	$0, -48(%rbp)
	movb	$1, -72(%rbp)
	movq	%rbx, %rax
	andq	$-4, %rax
	je	.LBB27_9
# %bb.10:                               # %if.else
                                        #   in Loop: Header=BB27_1 Depth=1
	movq	%rax, -64(%rbp)
	jmp	.LBB27_11
.LBB27_9:                               # %if.then12
                                        #   in Loop: Header=BB27_1 Depth=1
	movq	%r15, -48(%rbp)
.LBB27_11:                              # %if.end13
                                        #   in Loop: Header=BB27_1 Depth=1
	movl	%ebx, %ecx
	andl	$3, %ecx
	orq	%r15, %rcx
	movq	%rbx, %rax
	lock		cmpxchgq	%rcx, (%r12)
	jne	.LBB27_12
# %bb.13:                               # %if.then19
                                        #   in Loop: Header=BB27_1 Depth=1
	movq	%r15, %rdi
	callq	pthread_mutex_lock@PLT
	cmpb	$0, -72(%rbp)
	je	.LBB27_16
	.p2align	4, 0x90
.LBB27_14:                              # %while.body.i
                                        #   Parent Loop BB27_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	pthread_cond_wait@PLT
	cmpb	$0, -72(%rbp)
	jne	.LBB27_14
	jmp	.LBB27_16
.LBB27_12:                              # %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_release_relaxedEPyS4_S4_.exit
                                        #   in Loop: Header=BB27_1 Depth=1
	movq	%rax, %rbx
	jmp	.LBB27_17
.LBB27_18:                              # %cleanup23
	addq	$168, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end27:
	.size	_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv, .Lfunc_end27-_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization21mutex_parking_control8validateERNS2_15validate_actionE,"axG",@progbits,_ZN6Halide7Runtime8Internal15Synchronization21mutex_parking_control8validateERNS2_15validate_actionE,comdat
	.weak	_ZN6Halide7Runtime8Internal15Synchronization21mutex_parking_control8validateERNS2_15validate_actionE # -- Begin function _ZN6Halide7Runtime8Internal15Synchronization21mutex_parking_control8validateERNS2_15validate_actionE
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal15Synchronization21mutex_parking_control8validateERNS2_15validate_actionE,@function
_ZN6Halide7Runtime8Internal15Synchronization21mutex_parking_control8validateERNS2_15validate_actionE: # @_ZN6Halide7Runtime8Internal15Synchronization21mutex_parking_control8validateERNS2_15validate_actionE
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	8(%rdi), %rax
	movq	(%rax), %rax
	cmpq	$3, %rax
	sete	%al
	popq	%rbp
	retq
.Lfunc_end28:
	.size	_ZN6Halide7Runtime8Internal15Synchronization21mutex_parking_control8validateERNS2_15validate_actionE, .Lfunc_end28-_ZN6Halide7Runtime8Internal15Synchronization21mutex_parking_control8validateERNS2_15validate_actionE
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization15parking_control12before_sleepEv,"axG",@progbits,_ZN6Halide7Runtime8Internal15Synchronization15parking_control12before_sleepEv,comdat
	.weak	_ZN6Halide7Runtime8Internal15Synchronization15parking_control12before_sleepEv # -- Begin function _ZN6Halide7Runtime8Internal15Synchronization15parking_control12before_sleepEv
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal15Synchronization15parking_control12before_sleepEv,@function
_ZN6Halide7Runtime8Internal15Synchronization15parking_control12before_sleepEv: # @_ZN6Halide7Runtime8Internal15Synchronization15parking_control12before_sleepEv
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	popq	%rbp
	retq
.Lfunc_end29:
	.size	_ZN6Halide7Runtime8Internal15Synchronization15parking_control12before_sleepEv, .Lfunc_end29-_ZN6Halide7Runtime8Internal15Synchronization15parking_control12before_sleepEv
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization21mutex_parking_control6unparkEib,"axG",@progbits,_ZN6Halide7Runtime8Internal15Synchronization21mutex_parking_control6unparkEib,comdat
	.weak	_ZN6Halide7Runtime8Internal15Synchronization21mutex_parking_control6unparkEib # -- Begin function _ZN6Halide7Runtime8Internal15Synchronization21mutex_parking_control6unparkEib
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal15Synchronization21mutex_parking_control6unparkEib,@function
_ZN6Halide7Runtime8Internal15Synchronization21mutex_parking_control6unparkEib: # @_ZN6Halide7Runtime8Internal15Synchronization21mutex_parking_control6unparkEib
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edx, %eax
	addq	%rax, %rax
	movq	8(%rdi), %rcx
	movq	%rax, (%rcx)
	xorl	%eax, %eax
	popq	%rbp
	retq
.Lfunc_end30:
	.size	_ZN6Halide7Runtime8Internal15Synchronization21mutex_parking_control6unparkEib, .Lfunc_end30-_ZN6Halide7Runtime8Internal15Synchronization21mutex_parking_control6unparkEib
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization15parking_control16requeue_callbackERKNS2_15validate_actionEbb,"axG",@progbits,_ZN6Halide7Runtime8Internal15Synchronization15parking_control16requeue_callbackERKNS2_15validate_actionEbb,comdat
	.weak	_ZN6Halide7Runtime8Internal15Synchronization15parking_control16requeue_callbackERKNS2_15validate_actionEbb # -- Begin function _ZN6Halide7Runtime8Internal15Synchronization15parking_control16requeue_callbackERKNS2_15validate_actionEbb
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal15Synchronization15parking_control16requeue_callbackERKNS2_15validate_actionEbb,@function
_ZN6Halide7Runtime8Internal15Synchronization15parking_control16requeue_callbackERKNS2_15validate_actionEbb: # @_ZN6Halide7Runtime8Internal15Synchronization15parking_control16requeue_callbackERKNS2_15validate_actionEbb
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	popq	%rbp
	retq
.Lfunc_end31:
	.size	_ZN6Halide7Runtime8Internal15Synchronization15parking_control16requeue_callbackERKNS2_15validate_actionEbb, .Lfunc_end31-_ZN6Halide7Runtime8Internal15Synchronization15parking_control16requeue_callbackERKNS2_15validate_actionEbb
                                        # -- End function
	.section	.text.halide_cond_broadcast,"ax",@progbits
	.weak	halide_cond_broadcast           # -- Begin function halide_cond_broadcast
	.p2align	4, 0x90
	.type	halide_cond_broadcast,@function
halide_cond_broadcast:                  # @halide_cond_broadcast
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	(%rdi), %rdx
	testq	%rdx, %rdx
	je	.LBB32_2
# %bb.1:                                # %if.end.i
	movq	%rdi, %rsi
	movq	_ZTVN6Halide7Runtime8Internal15Synchronization25broadcast_parking_controlE@GOTPCREL(%rip), %rax
	addq	$16, %rax
	movq	%rax, -24(%rbp)
	movq	%rdi, -16(%rbp)
	movq	%rdx, -8(%rbp)
	leaq	-24(%rbp), %rdi
	xorl	%ecx, %ecx
	callq	_ZN6Halide7Runtime8Internal15Synchronization15parking_control14unpark_requeueEyyy@PLT
.LBB32_2:                               # %_ZN6Halide7Runtime8Internal15Synchronization9fast_cond9broadcastEv.exit
	addq	$32, %rsp
	popq	%rbp
	retq
.Lfunc_end32:
	.size	halide_cond_broadcast, .Lfunc_end32-halide_cond_broadcast
                                        # -- End function
	.section	.text.halide_default_semaphore_try_acquire,"ax",@progbits
	.weak	halide_default_semaphore_try_acquire # -- Begin function halide_default_semaphore_try_acquire
	.p2align	4, 0x90
	.type	halide_default_semaphore_try_acquire,@function
halide_default_semaphore_try_acquire:   # @halide_default_semaphore_try_acquire
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	testl	%esi, %esi
	je	.LBB33_1
# %bb.2:                                # %if.end
	movl	(%rdi), %eax
	movl	%eax, %edx
	subl	%esi, %edx
	js	.LBB33_3
	.p2align	4, 0x90
.LBB33_4:                               # %land.rhs
                                        # =>This Inner Loop Header: Depth=1
	lock		cmpxchgl	%edx, (%rdi)
	sete	%cl
	je	.LBB33_6
# %bb.5:                                # %land.rhs
                                        #   in Loop: Header=BB33_4 Depth=1
	movl	%eax, %edx
	subl	%esi, %edx
	jns	.LBB33_4
.LBB33_6:                               # %return
	movl	%ecx, %eax
	popq	%rbp
	retq
.LBB33_1:
	movb	$1, %cl
	movl	%ecx, %eax
	popq	%rbp
	retq
.LBB33_3:
	xorl	%ecx, %ecx
	movl	%ecx, %eax
	popq	%rbp
	retq
.Lfunc_end33:
	.size	halide_default_semaphore_try_acquire, .Lfunc_end33-halide_default_semaphore_try_acquire
                                        # -- End function
	.section	.text.halide_cond_wait,"ax",@progbits
	.weak	halide_cond_wait                # -- Begin function halide_cond_wait
	.p2align	4, 0x90
	.type	halide_cond_wait,@function
halide_cond_wait:                       # @halide_cond_wait
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$48, %rsp
	movq	%rsi, %rbx
	movq	%rdi, %rsi
	movq	_ZTVN6Halide7Runtime8Internal15Synchronization20wait_parking_controlE@GOTPCREL(%rip), %rax
	addq	$16, %rax
	movq	%rax, -72(%rbp)
	movq	%rdi, -64(%rbp)
	movq	%rbx, -56(%rbp)
	leaq	-72(%rbp), %rdi
	callq	_ZN6Halide7Runtime8Internal15Synchronization15parking_control4parkEy@PLT
	cmpq	%rbx, %rax
	jne	.LBB34_1
# %bb.12:                               # %if.else.i
	movq	(%rbx), %rax
	testb	$1, %al
	jne	.LBB34_14
# %bb.13:                               # %if.then2.i
	leaq	.L.str.5.6(%rip), %rsi
	xorl	%edi, %edi
	callq	halide_print@PLT
	callq	abort@PLT
	jmp	.LBB34_14
.LBB34_1:                               # %if.then.i
	movl	$1, %ecx
	xorl	%eax, %eax
	lock		cmpxchgq	%rcx, (%rbx)
	jne	.LBB34_2
.LBB34_14:                              # %_ZN6Halide7Runtime8Internal15Synchronization9fast_cond4waitEPNS2_10fast_mutexE.exit
	addq	$48, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB34_2:                               # %if.then.i.i
	movq	(%rbx), %rax
	movl	$40, %r12d
	movq	_ZTVN6Halide7Runtime8Internal15Synchronization21mutex_parking_controlE@GOTPCREL(%rip), %r15
	addq	$16, %r15
	leaq	-48(%rbp), %r14
	.p2align	4, 0x90
.LBB34_3:                               # %while.cond.outer.i.i.i
                                        # =>This Inner Loop Header: Depth=1
	testb	$1, %al
	jne	.LBB34_5
# %bb.4:                                # %if.then.i.i.i
                                        #   in Loop: Header=BB34_3 Depth=1
	movq	%rax, %rcx
	orq	$1, %rcx
	lock		cmpxchgq	%rcx, (%rbx)
	jne	.LBB34_3
	jmp	.LBB34_14
.LBB34_5:                               # %if.end4.i.i.i
                                        #   in Loop: Header=BB34_3 Depth=1
	testl	%r12d, %r12d
	jg	.LBB34_6
# %bb.8:                                # %if.end8.i.i.i
                                        #   in Loop: Header=BB34_3 Depth=1
	testb	$2, %al
	jne	.LBB34_10
.LBB34_9:                               # %if.then10.i.i.i
                                        #   in Loop: Header=BB34_3 Depth=1
	movq	%rax, %rcx
	orq	$2, %rcx
	lock		cmpxchgq	%rcx, (%rbx)
	jne	.LBB34_3
	jmp	.LBB34_10
.LBB34_6:                               # %_ZN6Halide7Runtime8Internal15Synchronization12spin_control11should_spinEv.exit.i.i.i
                                        #   in Loop: Header=BB34_3 Depth=1
	decl	%r12d
	je	.LBB34_7
# %bb.15:                               # %if.then6.i.i.i
                                        #   in Loop: Header=BB34_3 Depth=1
	callq	halide_thread_yield@PLT
	movq	(%rbx), %rax
	jmp	.LBB34_3
.LBB34_7:                               #   in Loop: Header=BB34_3 Depth=1
	xorl	%r12d, %r12d
	testb	$2, %al
	je	.LBB34_9
.LBB34_10:                              # %if.end19.i.i.i
                                        #   in Loop: Header=BB34_3 Depth=1
	movq	%r15, -48(%rbp)
	movq	%rbx, -40(%rbp)
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	_ZN6Halide7Runtime8Internal15Synchronization15parking_control4parkEy@PLT
	cmpq	%rbx, %rax
	je	.LBB34_14
# %bb.11:                               # %if.end24.i.i.i
                                        #   in Loop: Header=BB34_3 Depth=1
	movq	(%rbx), %rax
	movl	$40, %r12d
	jmp	.LBB34_3
.Lfunc_end34:
	.size	halide_cond_wait, .Lfunc_end34-halide_cond_wait
                                        # -- End function
	.section	.text.halide_do_loop_task,"ax",@progbits
	.weak	halide_do_loop_task             # -- Begin function halide_do_loop_task
	.p2align	4, 0x90
	.type	halide_do_loop_task,@function
halide_do_loop_task:                    # @halide_do_loop_task
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal19custom_do_loop_taskE@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.Lfunc_end35:
	.size	halide_do_loop_task, .Lfunc_end35-halide_do_loop_task
                                        # -- End function
	.section	.text.halide_do_task,"ax",@progbits
	.weak	halide_do_task                  # -- Begin function halide_do_task
	.p2align	4, 0x90
	.type	halide_do_task,@function
halide_do_task:                         # @halide_do_task
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal14custom_do_taskE@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.Lfunc_end36:
	.size	halide_do_task, .Lfunc_end36-halide_do_task
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization15parking_control4parkEy,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization15parking_control4parkEy # -- Begin function _ZN6Halide7Runtime8Internal15Synchronization15parking_control4parkEy
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal15Synchronization15parking_control4parkEy,@function
_ZN6Halide7Runtime8Internal15Synchronization15parking_control4parkEy: # @_ZN6Halide7Runtime8Internal15Synchronization15parking_control4parkEy
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$184, %rsp
	movq	%rsi, %r13
	movq	%rdi, %r14
	movb	$0, -88(%rbp)
	leaq	-216(%rbp), %r12
	movq	%r12, %rdi
	xorl	%esi, %esi
	callq	pthread_mutex_init@PLT
	leaq	-152(%rbp), %r15
	movq	%r15, %rdi
	xorl	%esi, %esi
	callq	pthread_cond_init@PLT
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%xmm0, -80(%rbp)
	movq	$0, -64(%rbp)
	movq	%r13, %rdi
	callq	_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy@PLT
	movq	%rax, %rbx
	movb	$0, -56(%rbp)
	movq	$0, -48(%rbp)
	movq	(%r14), %rax
	leaq	-56(%rbp), %rsi
	movq	%r14, %rdi
	callq	*(%rax)
	testb	%al, %al
	je	.LBB37_1
# %bb.6:                                # %if.end
	movq	$0, -72(%rbp)
	movq	%r13, -80(%rbp)
	movb	$1, -88(%rbp)
	movq	%rbx, %rax
	addq	$8, %rax
	movl	$144, %ecx
	addq	16(%rbx), %rcx
	cmpq	$0, 8(%rbx)
	cmoveq	%rax, %rcx
	leaq	-64(%rbp), %r13
	movq	%r12, (%rcx)
	movq	%r12, 16(%rbx)
	movq	(%rbx), %rax
	.p2align	4, 0x90
.LBB37_7:                               # %atomicrmw.start2
                                        # =>This Inner Loop Header: Depth=1
	movq	%rax, %rcx
	andq	$-2, %rcx
	lock		cmpxchgq	%rcx, (%rbx)
	jne	.LBB37_7
# %bb.8:                                # %atomicrmw.end1
	cmpq	$4, %rax
	jb	.LBB37_11
# %bb.9:                                # %atomicrmw.end1
	andl	$2, %eax
	testq	%rax, %rax
	jne	.LBB37_11
# %bb.10:                               # %if.then.i27
	movq	%rbx, %rdi
	callq	_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv@PLT
.LBB37_11:                              # %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit28
	movq	(%r14), %rax
	movq	%r14, %rdi
	callq	*8(%rax)
	leaq	-216(%rbp), %rdi
	callq	pthread_mutex_lock@PLT
	cmpb	$0, -88(%rbp)
	je	.LBB37_14
# %bb.12:                               # %while.body.i.preheader
	leaq	-216(%rbp), %rbx
	.p2align	4, 0x90
.LBB37_13:                              # %while.body.i
                                        # =>This Inner Loop Header: Depth=1
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	pthread_cond_wait@PLT
	cmpb	$0, -88(%rbp)
	jne	.LBB37_13
.LBB37_14:                              # %_ZN6Halide7Runtime8Internal15Synchronization13thread_parker4parkEv.exit
	leaq	-216(%rbp), %rdi
	callq	pthread_mutex_unlock@PLT
	jmp	.LBB37_15
.LBB37_1:                               # %if.then
	leaq	-48(%rbp), %r13
	movq	(%rbx), %rax
	.p2align	4, 0x90
.LBB37_2:                               # %atomicrmw.start
                                        # =>This Inner Loop Header: Depth=1
	movq	%rax, %rcx
	andq	$-2, %rcx
	lock		cmpxchgq	%rcx, (%rbx)
	jne	.LBB37_2
# %bb.3:                                # %atomicrmw.end
	cmpq	$4, %rax
	jb	.LBB37_15
# %bb.4:                                # %atomicrmw.end
	andl	$2, %eax
	testq	%rax, %rax
	jne	.LBB37_15
# %bb.5:                                # %if.then.i
	movq	%rbx, %rdi
	callq	_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv@PLT
.LBB37_15:                              # %cleanup
	movq	(%r13), %rbx
	movq	%r15, %rdi
	callq	pthread_cond_destroy@PLT
	leaq	-216(%rbp), %rdi
	callq	pthread_mutex_destroy@PLT
	movq	%rbx, %rax
	addq	$184, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end37:
	.size	_ZN6Halide7Runtime8Internal15Synchronization15parking_control4parkEy, .Lfunc_end37-_ZN6Halide7Runtime8Internal15Synchronization15parking_control4parkEy
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control8validateERNS2_15validate_actionE,"axG",@progbits,_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control8validateERNS2_15validate_actionE,comdat
	.weak	_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control8validateERNS2_15validate_actionE # -- Begin function _ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control8validateERNS2_15validate_actionE
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control8validateERNS2_15validate_actionE,@function
_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control8validateERNS2_15validate_actionE: # @_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control8validateERNS2_15validate_actionE
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	8(%rdi), %rax
	movq	(%rax), %rdx
	movq	16(%rdi), %rcx
	testq	%rdx, %rdx
	je	.LBB38_1
# %bb.2:                                # %if.else
	movb	$1, %al
	cmpq	%rcx, %rdx
	je	.LBB38_4
# %bb.3:                                # %if.then5
	movq	%rcx, 8(%rsi)
	xorl	%eax, %eax
.LBB38_4:                               # %cleanup
                                        # kill: def $al killed $al killed $eax
	popq	%rbp
	retq
.LBB38_1:                               # %if.then
	movq	%rcx, (%rax)
	movb	$1, %al
                                        # kill: def $al killed $al killed $eax
	popq	%rbp
	retq
.Lfunc_end38:
	.size	_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control8validateERNS2_15validate_actionE, .Lfunc_end38-_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control8validateERNS2_15validate_actionE
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control12before_sleepEv,"axG",@progbits,_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control12before_sleepEv,comdat
	.weak	_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control12before_sleepEv # -- Begin function _ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control12before_sleepEv
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control12before_sleepEv,@function
_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control12before_sleepEv: # @_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control12before_sleepEv
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movq	16(%rdi), %rsi
	xorl	%ecx, %ecx
	movl	$1, %eax
	lock		cmpxchgq	%rcx, (%rsi)
	je	.LBB39_3
# %bb.1:                                # %if.then.i
	xorl	%ecx, %ecx
	movl	$1, %eax
	lock		cmpxchgq	%rcx, (%rsi)
	je	.LBB39_3
# %bb.2:                                # %if.end.i.i
	movq	_ZTVN6Halide7Runtime8Internal15Synchronization21mutex_parking_controlE@GOTPCREL(%rip), %rax
	addq	$16, %rax
	movq	%rax, -16(%rbp)
	movq	%rsi, -8(%rbp)
	leaq	-16(%rbp), %rdi
	callq	_ZN6Halide7Runtime8Internal15Synchronization15parking_control10unpark_oneEy@PLT
.LBB39_3:                               # %_ZN6Halide7Runtime8Internal15Synchronization10fast_mutex6unlockEv.exit
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end39:
	.size	_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control12before_sleepEv, .Lfunc_end39-_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control12before_sleepEv
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control6unparkEib,"axG",@progbits,_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control6unparkEib,comdat
	.weak	_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control6unparkEib # -- Begin function _ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control6unparkEib
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control6unparkEib,@function
_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control6unparkEib: # @_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control6unparkEib
# %bb.0:                                # %entry
	testl	%edx, %edx
	jne	.LBB40_2
# %bb.1:                                # %if.then
	pushq	%rbp
	movq	%rsp, %rbp
	movq	8(%rdi), %rax
	movq	$0, (%rax)
	popq	%rbp
.LBB40_2:                               # %if.end
	xorl	%eax, %eax
	retq
.Lfunc_end40:
	.size	_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control6unparkEib, .Lfunc_end40-_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control6unparkEib
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization15parking_control14unpark_requeueEyyy,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization15parking_control14unpark_requeueEyyy # -- Begin function _ZN6Halide7Runtime8Internal15Synchronization15parking_control14unpark_requeueEyyy
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal15Synchronization15parking_control14unpark_requeueEyyy,@function
_ZN6Halide7Runtime8Internal15Synchronization15parking_control14unpark_requeueEyyy: # @_ZN6Halide7Runtime8Internal15Synchronization15parking_control14unpark_requeueEyyy
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$40, %rsp
	movq	%rcx, %r14
	movq	%rdx, %r12
	movq	%rsi, %rbx
	movq	%rdi, %r15
	leaq	-56(%rbp), %rdi
	callq	_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy@PLT
	movb	$0, -72(%rbp)
	movq	$0, -64(%rbp)
	movq	(%r15), %rax
	leaq	-72(%rbp), %rsi
	movq	%r15, %rdi
	callq	*(%rax)
	testb	%al, %al
	je	.LBB41_1
# %bb.2:                                # %if.end
	movq	-56(%rbp), %rdx
	movq	8(%rdx), %rcx
	testq	%rcx, %rcx
	je	.LBB41_3
# %bb.4:                                # %while.body.preheader
	addq	$8, %rdx
	xorl	%r13d, %r13d
	xorl	%r8d, %r8d
	xorl	%r9d, %r9d
	xorl	%edi, %edi
	jmp	.LBB41_5
	.p2align	4, 0x90
.LBB41_6:                               #   in Loop: Header=BB41_5 Depth=1
	leaq	144(%rsi), %rdx
	movq	%rsi, %rdi
.LBB41_15:                              # %if.end22
                                        #   in Loop: Header=BB41_5 Depth=1
	testq	%rcx, %rcx
	je	.LBB41_16
.LBB41_5:                               # %while.body
                                        # =>This Inner Loop Header: Depth=1
	movq	%rcx, %rsi
	movq	136(%rcx), %rax
	movq	144(%rcx), %rcx
	cmpq	%rbx, %rax
	jne	.LBB41_6
# %bb.7:                                # %if.then4
                                        #   in Loop: Header=BB41_5 Depth=1
	movq	%rcx, (%rdx)
	movq	-56(%rbp), %rax
	cmpq	%rsi, 16(%rax)
	je	.LBB41_8
# %bb.9:                                # %if.end10
                                        #   in Loop: Header=BB41_5 Depth=1
	cmpb	$0, -72(%rbp)
	jne	.LBB41_10
	jmp	.LBB41_12
.LBB41_8:                               # %if.then7
                                        #   in Loop: Header=BB41_5 Depth=1
	movq	%rdi, 16(%rax)
	cmpb	$0, -72(%rbp)
	je	.LBB41_12
.LBB41_10:                              # %if.end10
                                        #   in Loop: Header=BB41_5 Depth=1
	testq	%r13, %r13
	jne	.LBB41_12
# %bb.11:                               #   in Loop: Header=BB41_5 Depth=1
	movq	%rsi, %r13
	jmp	.LBB41_15
	.p2align	4, 0x90
.LBB41_12:                              # %if.else
                                        #   in Loop: Header=BB41_5 Depth=1
	movq	%rsi, %rax
	testq	%r9, %r9
	je	.LBB41_14
# %bb.13:                               # %if.else15
                                        #   in Loop: Header=BB41_5 Depth=1
	movq	%rsi, 144(%r8)
	movq	%r9, %rax
.LBB41_14:                              # %if.end17
                                        #   in Loop: Header=BB41_5 Depth=1
	movq	%r12, 136(%rsi)
	movq	%rax, %r9
	movq	%rsi, %r8
	jmp	.LBB41_15
.LBB41_1:                               # %if.then
	leaq	-56(%rbp), %rdi
	callq	_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE@PLT
	xorl	%eax, %eax
	jmp	.LBB41_26
.LBB41_16:                              # %while.end
	testq	%r9, %r9
	je	.LBB41_17
# %bb.18:                               # %if.then24
	movq	$0, 144(%r8)
	movq	-48(%rbp), %rcx
	cmpq	$0, 8(%rcx)
	je	.LBB41_19
# %bb.20:                               # %if.else31
	movl	$144, %eax
	addq	16(%rcx), %rax
	jmp	.LBB41_21
.LBB41_3:
	xorl	%eax, %eax
	xorl	%r13d, %r13d
	jmp	.LBB41_22
.LBB41_17:
	xorl	%eax, %eax
	jmp	.LBB41_22
.LBB41_19:
	leaq	8(%rcx), %rax
.LBB41_21:                              # %if.end35
	movq	%r9, (%rax)
	movq	%r8, 16(%rcx)
	movb	$1, %al
.LBB41_22:                              # %if.end38
	xorl	%edx, %edx
	testq	%r13, %r13
	setne	%dl
	movq	(%r15), %rbx
	movzbl	%al, %ecx
	leaq	-72(%rbp), %rsi
	movq	%r15, %rdi
	callq	*24(%rbx)
	testq	%r13, %r13
	je	.LBB41_24
# %bb.23:                               # %if.then44
	movq	%r14, 152(%r13)
	movq	%r13, %rdi
	callq	pthread_mutex_lock@PLT
	leaq	-56(%rbp), %rdi
	callq	_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE@PLT
	movb	$0, 128(%r13)
	leaq	64(%r13), %rdi
	callq	pthread_cond_signal@PLT
	movq	%r13, %rdi
	callq	pthread_mutex_unlock@PLT
	jmp	.LBB41_25
.LBB41_24:                              # %if.else48
	leaq	-56(%rbp), %rdi
	callq	_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE@PLT
.LBB41_25:                              # %if.end49
	testq	%r13, %r13
	setne	%al
	andb	-72(%rbp), %al
	movzbl	%al, %eax
.LBB41_26:                              # %cleanup
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end41:
	.size	_ZN6Halide7Runtime8Internal15Synchronization15parking_control14unpark_requeueEyyy, .Lfunc_end41-_ZN6Halide7Runtime8Internal15Synchronization15parking_control14unpark_requeueEyyy
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy # -- Begin function _ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy,@function
_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy: # @_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movq	%rdx, %r13
	movq	%rsi, %rbx
	movq	%rdi, %r12
	movabsq	$-7046029254386353131, %rax     # imm = 0x9E3779B97F4A7C15
	imulq	%rax, %rbx
	shrq	$54, %rbx
	imulq	%rax, %r13
	shrq	$54, %r13
	cmpq	%r13, %rbx
	jne	.LBB42_2
# %bb.1:                                # %if.then
	leaq	(%rbx,%rbx,2), %rcx
	movq	_ZN6Halide7Runtime8Internal15Synchronization5tableE@GOTPCREL(%rip), %rdx
	leaq	(%rdx,%rcx,8), %r14
	movl	$1, %esi
	xorl	%eax, %eax
	lock		cmpxchgq	%rsi, (%rdx,%rcx,8)
	movq	%rbx, %r13
	movq	%r14, %r15
	je	.LBB42_10
.LBB42_9:                               # %cleanup.sink.split
	leaq	(,%r13,2), %rdi
	addq	%r13, %rdi
	shlq	$3, %rdi
	addq	_ZN6Halide7Runtime8Internal15Synchronization5tableE@GOTPCREL(%rip), %rdi
	callq	_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv@PLT
.LBB42_10:                              # %cleanup
	movq	%r14, (%r12)
	movq	%r15, 8(%r12)
	movq	%r12, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB42_2:                               # %if.else
	jae	.LBB42_6
# %bb.3:                                # %if.then3
	leaq	(%rbx,%rbx,2), %rcx
	movq	_ZN6Halide7Runtime8Internal15Synchronization5tableE@GOTPCREL(%rip), %rdx
	leaq	(%rdx,%rcx,8), %r14
	leaq	(,%r13,2), %rax
	addq	%r13, %rax
	leaq	(%rdx,%rax,8), %r15
	movl	$1, %ebx
	xorl	%eax, %eax
	lock		cmpxchgq	%rbx, (%rdx,%rcx,8)
	je	.LBB42_5
# %bb.4:                                # %if.then.i40
	movq	%r14, %rdi
	callq	_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv@PLT
.LBB42_5:                               # %_ZN6Halide7Runtime8Internal15Synchronization9word_lock4lockEv.exit41
	xorl	%eax, %eax
	lock		cmpxchgq	%rbx, (%r15)
	jne	.LBB42_9
	jmp	.LBB42_10
.LBB42_6:                               # %if.else9
	leaq	(,%r13,2), %rcx
	addq	%r13, %rcx
	movq	_ZN6Halide7Runtime8Internal15Synchronization5tableE@GOTPCREL(%rip), %rdx
	leaq	(%rdx,%rcx,8), %r15
	leaq	(%rbx,%rbx,2), %rax
	leaq	(%rdx,%rax,8), %r14
	movl	$1, %r13d
	xorl	%eax, %eax
	lock		cmpxchgq	%r13, (%rdx,%rcx,8)
	je	.LBB42_8
# %bb.7:                                # %if.then.i48
	movq	%r15, %rdi
	callq	_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv@PLT
.LBB42_8:                               # %_ZN6Halide7Runtime8Internal15Synchronization9word_lock4lockEv.exit49
	xorl	%eax, %eax
	lock		cmpxchgq	%r13, (%r14)
	movq	%rbx, %r13
	jne	.LBB42_9
	jmp	.LBB42_10
.Lfunc_end42:
	.size	_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy, .Lfunc_end42-_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE # -- Begin function _ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE,@function
_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE: # @_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	pushq	%rax
	movq	%rdi, %rbx
	movq	(%rdi), %rdi
	movq	8(%rbx), %rcx
	cmpq	%rcx, %rdi
	je	.LBB43_1
# %bb.3:                                # %if.else
	jbe	.LBB43_11
# %bb.4:                                # %if.then5
	movq	(%rdi), %rax
	.p2align	4, 0x90
.LBB43_5:                               # %atomicrmw.start2
                                        # =>This Inner Loop Header: Depth=1
	movq	%rax, %rcx
	andq	$-2, %rcx
	lock		cmpxchgq	%rcx, (%rdi)
	jne	.LBB43_5
# %bb.6:                                # %atomicrmw.end1
	cmpq	$4, %rax
	jb	.LBB43_9
# %bb.7:                                # %atomicrmw.end1
	andl	$2, %eax
	testq	%rax, %rax
	jne	.LBB43_9
# %bb.8:                                # %if.then.i30
	callq	_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv@PLT
.LBB43_9:                               # %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit31
	movq	8(%rbx), %rdi
	movq	(%rdi), %rax
	.p2align	4, 0x90
.LBB43_10:                              # %atomicrmw.start8
                                        # =>This Inner Loop Header: Depth=1
	movq	%rax, %rcx
	andq	$-2, %rcx
	lock		cmpxchgq	%rcx, (%rdi)
	jne	.LBB43_10
	jmp	.LBB43_18
.LBB43_1:                               # %if.then
	movq	(%rdi), %rax
	.p2align	4, 0x90
.LBB43_2:                               # %atomicrmw.start
                                        # =>This Inner Loop Header: Depth=1
	movq	%rax, %rcx
	andq	$-2, %rcx
	lock		cmpxchgq	%rcx, (%rdi)
	jne	.LBB43_2
	jmp	.LBB43_18
.LBB43_11:                              # %if.else10
	movq	(%rcx), %rax
	.p2align	4, 0x90
.LBB43_12:                              # %atomicrmw.start14
                                        # =>This Inner Loop Header: Depth=1
	movq	%rax, %rdx
	andq	$-2, %rdx
	lock		cmpxchgq	%rdx, (%rcx)
	jne	.LBB43_12
# %bb.13:                               # %atomicrmw.end13
	cmpq	$4, %rax
	jb	.LBB43_16
# %bb.14:                               # %atomicrmw.end13
	andl	$2, %eax
	testq	%rax, %rax
	jne	.LBB43_16
# %bb.15:                               # %if.then.i44
	movq	%rcx, %rdi
	callq	_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv@PLT
.LBB43_16:                              # %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit45
	movq	(%rbx), %rdi
	movq	(%rdi), %rax
	.p2align	4, 0x90
.LBB43_17:                              # %atomicrmw.start20
                                        # =>This Inner Loop Header: Depth=1
	movq	%rax, %rcx
	andq	$-2, %rcx
	lock		cmpxchgq	%rcx, (%rdi)
	jne	.LBB43_17
.LBB43_18:                              # %atomicrmw.end19
	cmpq	$4, %rax
	jb	.LBB43_20
# %bb.19:                               # %atomicrmw.end19
	andl	$2, %eax
	testq	%rax, %rax
	jne	.LBB43_20
# %bb.21:                               # %if.end15.sink.split
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	jmp	_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv@PLT # TAILCALL
.LBB43_20:                              # %if.end15
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end43:
	.size	_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE, .Lfunc_end43-_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization25broadcast_parking_control8validateERNS2_15validate_actionE,"axG",@progbits,_ZN6Halide7Runtime8Internal15Synchronization25broadcast_parking_control8validateERNS2_15validate_actionE,comdat
	.weak	_ZN6Halide7Runtime8Internal15Synchronization25broadcast_parking_control8validateERNS2_15validate_actionE # -- Begin function _ZN6Halide7Runtime8Internal15Synchronization25broadcast_parking_control8validateERNS2_15validate_actionE
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal15Synchronization25broadcast_parking_control8validateERNS2_15validate_actionE,@function
_ZN6Halide7Runtime8Internal15Synchronization25broadcast_parking_control8validateERNS2_15validate_actionE: # @_ZN6Halide7Runtime8Internal15Synchronization25broadcast_parking_control8validateERNS2_15validate_actionE
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	8(%rdi), %rax
	movq	(%rax), %r9
	movq	16(%rdi), %rdx
	cmpq	%rdx, %r9
	jne	.LBB44_6
# %bb.1:                                # %if.end
	movq	$0, (%rax)
	movq	16(%rdi), %rdi
	movq	(%rdi), %rax
	movb	$1, %r8b
	.p2align	4, 0x90
.LBB44_2:                               # %if.end
                                        # =>This Inner Loop Header: Depth=1
	testb	$1, %al
	je	.LBB44_5
# %bb.3:                                # %if.end.i
                                        #   in Loop: Header=BB44_2 Depth=1
	movq	%rax, %rcx
	orq	$2, %rcx
	lock		cmpxchgq	%rcx, (%rdi)
	jne	.LBB44_2
# %bb.4:
	xorl	%r8d, %r8d
.LBB44_5:                               # %_ZN6Halide7Runtime8Internal15Synchronization10fast_mutex21make_parked_if_lockedEv.exit
	movb	%r8b, (%rsi)
.LBB44_6:                               # %cleanup
	cmpq	%rdx, %r9
	sete	%al
	popq	%rbp
	retq
.Lfunc_end44:
	.size	_ZN6Halide7Runtime8Internal15Synchronization25broadcast_parking_control8validateERNS2_15validate_actionE, .Lfunc_end44-_ZN6Halide7Runtime8Internal15Synchronization25broadcast_parking_control8validateERNS2_15validate_actionE
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization15parking_control6unparkEib,"axG",@progbits,_ZN6Halide7Runtime8Internal15Synchronization15parking_control6unparkEib,comdat
	.weak	_ZN6Halide7Runtime8Internal15Synchronization15parking_control6unparkEib # -- Begin function _ZN6Halide7Runtime8Internal15Synchronization15parking_control6unparkEib
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal15Synchronization15parking_control6unparkEib,@function
_ZN6Halide7Runtime8Internal15Synchronization15parking_control6unparkEib: # @_ZN6Halide7Runtime8Internal15Synchronization15parking_control6unparkEib
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	xorl	%eax, %eax
	popq	%rbp
	retq
.Lfunc_end45:
	.size	_ZN6Halide7Runtime8Internal15Synchronization15parking_control6unparkEib, .Lfunc_end45-_ZN6Halide7Runtime8Internal15Synchronization15parking_control6unparkEib
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization25broadcast_parking_control16requeue_callbackERKNS2_15validate_actionEbb,"axG",@progbits,_ZN6Halide7Runtime8Internal15Synchronization25broadcast_parking_control16requeue_callbackERKNS2_15validate_actionEbb,comdat
	.weak	_ZN6Halide7Runtime8Internal15Synchronization25broadcast_parking_control16requeue_callbackERKNS2_15validate_actionEbb # -- Begin function _ZN6Halide7Runtime8Internal15Synchronization25broadcast_parking_control16requeue_callbackERKNS2_15validate_actionEbb
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal15Synchronization25broadcast_parking_control16requeue_callbackERKNS2_15validate_actionEbb,@function
_ZN6Halide7Runtime8Internal15Synchronization25broadcast_parking_control16requeue_callbackERKNS2_15validate_actionEbb: # @_ZN6Halide7Runtime8Internal15Synchronization25broadcast_parking_control16requeue_callbackERKNS2_15validate_actionEbb
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	cmpb	$0, (%rsi)
	je	.LBB46_3
# %bb.1:                                # %entry
	testb	%cl, %cl
	je	.LBB46_3
# %bb.2:                                # %if.then
	movq	16(%rdi), %rax
	lock		orq	$2, (%rax)
.LBB46_3:                               # %if.end
	popq	%rbp
	retq
.Lfunc_end46:
	.size	_ZN6Halide7Runtime8Internal15Synchronization25broadcast_parking_control16requeue_callbackERKNS2_15validate_actionEbb, .Lfunc_end46-_ZN6Halide7Runtime8Internal15Synchronization25broadcast_parking_control16requeue_callbackERKNS2_15validate_actionEbb
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal27default_desired_num_threadsEv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv # -- Begin function _ZN6Halide7Runtime8Internal27default_desired_num_threadsEv
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv,@function
_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv: # @_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	leaq	.L.str.1(%rip), %rdi
	callq	getenv@PLT
	testq	%rax, %rax
	jne	.LBB47_2
# %bb.1:                                # %if.end
	leaq	.L.str.2(%rip), %rdi
	callq	getenv@PLT
	testq	%rax, %rax
	je	.LBB47_3
.LBB47_2:                               # %cond.true
	movq	%rax, %rdi
	popq	%rbp
	jmp	atoi@PLT                        # TAILCALL
.LBB47_3:                               # %cond.false
	popq	%rbp
	jmp	halide_host_cpu_count@PLT       # TAILCALL
.Lfunc_end47:
	.size	_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv, .Lfunc_end47-_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal13worker_threadEPv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal13worker_threadEPv # -- Begin function _ZN6Halide7Runtime8Internal13worker_threadEPv
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal13worker_threadEPv,@function
_ZN6Halide7Runtime8Internal13worker_threadEPv: # @_ZN6Halide7Runtime8Internal13worker_threadEPv
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	movq	%rdi, %rbx
	movq	_ZN6Halide7Runtime8Internal10work_queueE@GOTPCREL(%rip), %r14
	movq	%r14, %rdi
	callq	halide_mutex_lock@PLT
	movq	%rbx, %rdi
	callq	_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE@PLT
	movq	%r14, %rdi
	popq	%rbx
	popq	%r14
	popq	%rbp
	jmp	halide_mutex_unlock@PLT         # TAILCALL
.Lfunc_end48:
	.size	_ZN6Halide7Runtime8Internal13worker_threadEPv, .Lfunc_end48-_ZN6Halide7Runtime8Internal13worker_threadEPv
                                        # -- End function
	.section	.text.halide_spawn_thread,"ax",@progbits
	.weak	halide_spawn_thread             # -- Begin function halide_spawn_thread
	.p2align	4, 0x90
	.type	halide_spawn_thread,@function
halide_spawn_thread:                    # @halide_spawn_thread
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	movq	%rsi, %r14
	movq	%rdi, %r15
	movl	$24, %edi
	callq	malloc@PLT
	movq	%rax, %rbx
	movq	%r15, (%rax)
	movq	%r14, 8(%rax)
	leaq	16(%rax), %rdi
	movq	$0, 16(%rax)
	movq	_ZN6Halide7Runtime8Internal19spawn_thread_helperEPv@GOTPCREL(%rip), %rdx
	xorl	%esi, %esi
	movq	%rax, %rcx
	callq	pthread_create@PLT
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end49:
	.size	halide_spawn_thread, .Lfunc_end49-halide_spawn_thread
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal19spawn_thread_helperEPv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal19spawn_thread_helperEPv # -- Begin function _ZN6Halide7Runtime8Internal19spawn_thread_helperEPv
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal19spawn_thread_helperEPv,@function
_ZN6Halide7Runtime8Internal19spawn_thread_helperEPv: # @_ZN6Halide7Runtime8Internal19spawn_thread_helperEPv
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, %rax
	movq	8(%rdi), %rdi
	callq	*(%rax)
	xorl	%eax, %eax
	popq	%rbp
	retq
.Lfunc_end50:
	.size	_ZN6Halide7Runtime8Internal19spawn_thread_helperEPv, .Lfunc_end50-_ZN6Halide7Runtime8Internal19spawn_thread_helperEPv
                                        # -- End function
	.section	.text.halide_default_do_parallel_tasks,"ax",@progbits
	.weak	halide_default_do_parallel_tasks # -- Begin function halide_default_do_parallel_tasks
	.p2align	4, 0x90
	.type	halide_default_do_parallel_tasks,@function
halide_default_do_parallel_tasks:       # @halide_default_do_parallel_tasks
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	movq	%rcx, %r15
	movl	%esi, %r14d
	movslq	%esi, %rax
	movq	%rsp, %r12
	movq	%rax, %rcx
	shlq	$7, %rcx
	subq	%rcx, %r12
	movq	%r12, %rsp
	testl	%eax, %eax
	jle	.LBB51_4
# %bb.1:                                # %for.body.preheader
	leaq	124(%r12), %rax
	xorl	%ecx, %ecx
	jmp	.LBB51_2
	.p2align	4, 0x90
.LBB51_6:                               # %if.end
                                        #   in Loop: Header=BB51_2 Depth=1
	vmovups	(%rdx), %ymm0
	vmovups	24(%rdx), %ymm1
	addq	$56, %rdx
	vmovups	%ymm1, -100(%rax)
	vmovups	%ymm0, -124(%rax)
	movq	$0, -68(%rax)
	movq	%rdi, -20(%rax)
	movq	$0, -12(%rax)
	movl	$0, -4(%rax)
	movb	$0, (%rax)
	movq	%r15, -36(%rax)
.LBB51_7:                               # %for.inc
                                        #   in Loop: Header=BB51_2 Depth=1
	incq	%rcx
	movslq	%r14d, %rsi
	subq	$-128, %rax
	cmpq	%rsi, %rcx
	jge	.LBB51_4
.LBB51_2:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$0, 40(%rdx)
	jg	.LBB51_6
# %bb.3:                                # %if.then
                                        #   in Loop: Header=BB51_2 Depth=1
	decl	%r14d
	jmp	.LBB51_7
.LBB51_4:                               # %for.cond.cleanup
	testl	%r14d, %r14d
	je	.LBB51_5
# %bb.8:                                # %if.end19
	movq	_ZN6Halide7Runtime8Internal10work_queueE@GOTPCREL(%rip), %rdi
	vzeroupper
	callq	halide_mutex_lock@PLT
	movl	%r14d, %edi
	movq	%r12, %rsi
	movq	%r15, %rdx
	callq	_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_@PLT
	testl	%r14d, %r14d
	jle	.LBB51_9
# %bb.12:                               # %for.body25.preheader
	movl	%r14d, %ebx
	xorl	%r14d, %r14d
	.p2align	4, 0x90
.LBB51_13:                              # %for.body25
                                        # =>This Inner Loop Header: Depth=1
	movq	%r12, %rdi
	callq	_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE@PLT
	movl	116(%r12), %eax
	testl	%eax, %eax
	cmovnel	%eax, %r14d
	subq	$-128, %r12
	decq	%rbx
	jne	.LBB51_13
	jmp	.LBB51_10
.LBB51_5:
	xorl	%r14d, %r14d
	jmp	.LBB51_11
.LBB51_9:
	xorl	%r14d, %r14d
.LBB51_10:                              # %for.cond.cleanup24
	movq	_ZN6Halide7Runtime8Internal10work_queueE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_unlock@PLT
.LBB51_11:                              # %cleanup
	movl	%r14d, %eax
	leaq	-32(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	vzeroupper
	retq
.Lfunc_end51:
	.size	halide_default_do_parallel_tasks, .Lfunc_end51-halide_default_do_parallel_tasks
                                        # -- End function
	.section	.text.halide_default_semaphore_init,"ax",@progbits
	.weak	halide_default_semaphore_init   # -- Begin function halide_default_semaphore_init
	.p2align	4, 0x90
	.type	halide_default_semaphore_init,@function
halide_default_semaphore_init:          # @halide_default_semaphore_init
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%esi, %eax
	movl	%esi, (%rdi)
	popq	%rbp
	retq
.Lfunc_end52:
	.size	halide_default_semaphore_init, .Lfunc_end52-halide_default_semaphore_init
                                        # -- End function
	.section	.text.halide_default_semaphore_release,"ax",@progbits
	.weak	halide_default_semaphore_release # -- Begin function halide_default_semaphore_release
	.p2align	4, 0x90
	.type	halide_default_semaphore_release,@function
halide_default_semaphore_release:       # @halide_default_semaphore_release
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	movl	%esi, %r14d
	movl	%esi, %ebx
	lock		xaddl	%ebx, (%rdi)
	testl	%esi, %esi
	je	.LBB53_3
# %bb.1:                                # %entry
	testl	%ebx, %ebx
	jne	.LBB53_3
# %bb.2:                                # %if.then
	movq	_ZN6Halide7Runtime8Internal10work_queueE@GOTPCREL(%rip), %r15
	movq	%r15, %rdi
	callq	halide_mutex_lock@PLT
	leaq	40(%r15), %rdi
	callq	halide_cond_broadcast@PLT
	leaq	56(%r15), %rdi
	callq	halide_cond_broadcast@PLT
	movq	%r15, %rdi
	callq	halide_mutex_unlock@PLT
.LBB53_3:                               # %if.end
	addl	%r14d, %ebx
	movl	%ebx, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end53:
	.size	halide_default_semaphore_release, .Lfunc_end53-halide_default_semaphore_release
                                        # -- End function
	.section	.text.halide_thread_pool_cleanup,"ax",@progbits
	.weak	halide_thread_pool_cleanup      # -- Begin function halide_thread_pool_cleanup
	.p2align	4, 0x90
	.type	halide_thread_pool_cleanup,@function
halide_thread_pool_cleanup:             # @halide_thread_pool_cleanup
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	popq	%rbp
	jmp	halide_shutdown_thread_pool@PLT # TAILCALL
.Lfunc_end54:
	.size	halide_thread_pool_cleanup, .Lfunc_end54-halide_thread_pool_cleanup
                                        # -- End function
	.section	.text.halide_shutdown_thread_pool,"ax",@progbits
	.weak	halide_shutdown_thread_pool     # -- Begin function halide_shutdown_thread_pool
	.p2align	4, 0x90
	.type	halide_shutdown_thread_pool,@function
halide_shutdown_thread_pool:            # @halide_shutdown_thread_pool
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	movq	_ZN6Halide7Runtime8Internal10work_queueE@GOTPCREL(%rip), %r14
	cmpb	$0, 2121(%r14)
	je	.LBB55_5
# %bb.1:                                # %if.then
	movq	%r14, %rdi
	callq	halide_mutex_lock@PLT
	movb	$1, 2120(%r14)
	leaq	56(%r14), %rdi
	callq	halide_cond_broadcast@PLT
	leaq	40(%r14), %rdi
	callq	halide_cond_broadcast@PLT
	leaq	48(%r14), %rdi
	callq	halide_cond_broadcast@PLT
	movq	%r14, %rdi
	callq	halide_mutex_unlock@PLT
	cmpl	$0, 24(%r14)
	jle	.LBB55_4
# %bb.2:                                # %for.body.preheader
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB55_3:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movq	72(%r14,%rbx,8), %rdi
	callq	halide_join_thread@PLT
	incq	%rbx
	movslq	24(%r14), %rax
	cmpq	%rax, %rbx
	jl	.LBB55_3
.LBB55_4:                               # %for.cond.cleanup
	addq	$12, %r14
	movl	$2116, %edx                     # imm = 0x844
	movq	%r14, %rdi
	xorl	%esi, %esi
	popq	%rbx
	popq	%r14
	popq	%rbp
	jmp	memset@PLT                      # TAILCALL
.LBB55_5:                               # %if.end
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end55:
	.size	halide_shutdown_thread_pool, .Lfunc_end55-halide_shutdown_thread_pool
                                        # -- End function
	.section	.text.halide_join_thread,"ax",@progbits
	.weak	halide_join_thread              # -- Begin function halide_join_thread
	.p2align	4, 0x90
	.type	halide_join_thread,@function
halide_join_thread:                     # @halide_join_thread
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	pushq	%rax
	movq	%rdi, %rbx
	movq	$0, -16(%rbp)
	movq	16(%rdi), %rdi
	leaq	-16(%rbp), %rsi
	callq	pthread_join@PLT
	movq	%rbx, %rdi
	callq	free@PLT
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end56:
	.size	halide_join_thread, .Lfunc_end56-halide_join_thread
                                        # -- End function
	.section	.text.halide_cond_signal,"ax",@progbits
	.weak	halide_cond_signal              # -- Begin function halide_cond_signal
	.p2align	4, 0x90
	.type	halide_cond_signal,@function
halide_cond_signal:                     # @halide_cond_signal
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	(%rdi), %rax
	testq	%rax, %rax
	je	.LBB57_2
# %bb.1:                                # %if.end.i
	movq	%rdi, %rsi
	movq	_ZTVN6Halide7Runtime8Internal15Synchronization22signal_parking_controlE@GOTPCREL(%rip), %rcx
	addq	$16, %rcx
	movq	%rcx, -24(%rbp)
	movq	%rdi, -16(%rbp)
	movq	%rax, -8(%rbp)
	leaq	-24(%rbp), %rdi
	callq	_ZN6Halide7Runtime8Internal15Synchronization15parking_control10unpark_oneEy@PLT
.LBB57_2:                               # %_ZN6Halide7Runtime8Internal15Synchronization9fast_cond6signalEv.exit
	addq	$32, %rsp
	popq	%rbp
	retq
.Lfunc_end57:
	.size	halide_cond_signal, .Lfunc_end57-halide_cond_signal
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization15parking_control8validateERNS2_15validate_actionE,"axG",@progbits,_ZN6Halide7Runtime8Internal15Synchronization15parking_control8validateERNS2_15validate_actionE,comdat
	.weak	_ZN6Halide7Runtime8Internal15Synchronization15parking_control8validateERNS2_15validate_actionE # -- Begin function _ZN6Halide7Runtime8Internal15Synchronization15parking_control8validateERNS2_15validate_actionE
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal15Synchronization15parking_control8validateERNS2_15validate_actionE,@function
_ZN6Halide7Runtime8Internal15Synchronization15parking_control8validateERNS2_15validate_actionE: # @_ZN6Halide7Runtime8Internal15Synchronization15parking_control8validateERNS2_15validate_actionE
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movb	$1, %al
	popq	%rbp
	retq
.Lfunc_end58:
	.size	_ZN6Halide7Runtime8Internal15Synchronization15parking_control8validateERNS2_15validate_actionE, .Lfunc_end58-_ZN6Halide7Runtime8Internal15Synchronization15parking_control8validateERNS2_15validate_actionE
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization22signal_parking_control6unparkEib,"axG",@progbits,_ZN6Halide7Runtime8Internal15Synchronization22signal_parking_control6unparkEib,comdat
	.weak	_ZN6Halide7Runtime8Internal15Synchronization22signal_parking_control6unparkEib # -- Begin function _ZN6Halide7Runtime8Internal15Synchronization22signal_parking_control6unparkEib
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal15Synchronization22signal_parking_control6unparkEib,@function
_ZN6Halide7Runtime8Internal15Synchronization22signal_parking_control6unparkEib: # @_ZN6Halide7Runtime8Internal15Synchronization22signal_parking_control6unparkEib
# %bb.0:                                # %entry
	testl	%edx, %edx
	jne	.LBB59_2
# %bb.1:                                # %if.then
	pushq	%rbp
	movq	%rsp, %rbp
	movq	8(%rdi), %rax
	movq	$0, (%rax)
	popq	%rbp
.LBB59_2:                               # %if.end
	xorl	%eax, %eax
	retq
.Lfunc_end59:
	.size	_ZN6Halide7Runtime8Internal15Synchronization22signal_parking_control6unparkEib, .Lfunc_end59-_ZN6Halide7Runtime8Internal15Synchronization22signal_parking_control6unparkEib
                                        # -- End function
	.section	.text.halide_mutex_array_create,"ax",@progbits
	.weak	halide_mutex_array_create       # -- Begin function halide_mutex_array_create
	.p2align	4, 0x90
	.type	halide_mutex_array_create,@function
halide_mutex_array_create:              # @halide_mutex_array_create
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	movl	%edi, %r15d
	xorl	%ebx, %ebx
	movl	$8, %esi
	xorl	%edi, %edi
	callq	halide_malloc@PLT
	testq	%rax, %rax
	je	.LBB60_4
# %bb.1:                                # %if.end
	movq	%rax, %r14
	movslq	%r15d, %rbx
	shlq	$3, %rbx
	xorl	%edi, %edi
	movq	%rbx, %rsi
	callq	halide_malloc@PLT
	movq	%rax, (%r14)
	testq	%rax, %rax
	je	.LBB60_2
# %bb.3:                                # %if.end6
	movq	%rax, %rdi
	xorl	%esi, %esi
	movq	%rbx, %rdx
	callq	memset@PLT
	movq	%r14, %rbx
	jmp	.LBB60_4
.LBB60_2:                               # %if.then5
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	movq	%r14, %rsi
	callq	halide_free@PLT
.LBB60_4:                               # %cleanup
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end60:
	.size	halide_mutex_array_create, .Lfunc_end60-halide_mutex_array_create
                                        # -- End function
	.section	.text.halide_mutex_array_destroy,"ax",@progbits
	.weak	halide_mutex_array_destroy      # -- Begin function halide_mutex_array_destroy
	.p2align	4, 0x90
	.type	halide_mutex_array_destroy,@function
halide_mutex_array_destroy:             # @halide_mutex_array_destroy
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	movq	%rsi, %r14
	movq	%rdi, %rbx
	movq	(%rsi), %rsi
	callq	halide_free@PLT
	movq	%rbx, %rdi
	movq	%r14, %rsi
	popq	%rbx
	popq	%r14
	popq	%rbp
	jmp	halide_free@PLT                 # TAILCALL
.Lfunc_end61:
	.size	halide_mutex_array_destroy, .Lfunc_end61-halide_mutex_array_destroy
                                        # -- End function
	.section	.text.halide_mutex_array_lock,"ax",@progbits
	.weak	halide_mutex_array_lock         # -- Begin function halide_mutex_array_lock
	.p2align	4, 0x90
	.type	halide_mutex_array_lock,@function
halide_mutex_array_lock:                # @halide_mutex_array_lock
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movslq	%esi, %rax
	shlq	$3, %rax
	addq	(%rdi), %rax
	movq	%rax, %rdi
	callq	halide_mutex_lock@PLT
	xorl	%eax, %eax
	popq	%rbp
	retq
.Lfunc_end62:
	.size	halide_mutex_array_lock, .Lfunc_end62-halide_mutex_array_lock
                                        # -- End function
	.section	.text.halide_mutex_array_unlock,"ax",@progbits
	.weak	halide_mutex_array_unlock       # -- Begin function halide_mutex_array_unlock
	.p2align	4, 0x90
	.type	halide_mutex_array_unlock,@function
halide_mutex_array_unlock:              # @halide_mutex_array_unlock
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movslq	%esi, %rax
	shlq	$3, %rax
	addq	(%rdi), %rax
	movq	%rax, %rdi
	callq	halide_mutex_unlock@PLT
	xorl	%eax, %eax
	popq	%rbp
	retq
.Lfunc_end63:
	.size	halide_mutex_array_unlock, .Lfunc_end63-halide_mutex_array_unlock
                                        # -- End function
	.section	.text.halide_set_num_threads,"ax",@progbits
	.weak	halide_set_num_threads          # -- Begin function halide_set_num_threads
	.p2align	4, 0x90
	.type	halide_set_num_threads,@function
halide_set_num_threads:                 # @halide_set_num_threads
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	movl	%edi, %ebx
	testl	%edi, %edi
	js	.LBB64_1
# %bb.2:                                # %if.end
	movq	_ZN6Halide7Runtime8Internal10work_queueE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_lock@PLT
	testl	%ebx, %ebx
	jne	.LBB64_4
# %bb.3:                                # %if.then2
	callq	_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv@PLT
	movl	%eax, %ebx
	jmp	.LBB64_4
.LBB64_1:                               # %if.end.thread
	leaq	.L.str.4(%rip), %rsi
	xorl	%edi, %edi
	callq	halide_error@PLT
	movq	_ZN6Halide7Runtime8Internal10work_queueE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_lock@PLT
.LBB64_4:                               # %if.end3
	movq	_ZN6Halide7Runtime8Internal10work_queueE@GOTPCREL(%rip), %rdi
	movl	8(%rdi), %r14d
	testl	%ebx, %ebx
	movl	$1, %eax
	cmovgl	%ebx, %eax
	cmpl	$256, %eax                      # imm = 0x100
	movl	$256, %ecx                      # imm = 0x100
	cmovbl	%eax, %ecx
	movl	%ecx, 8(%rdi)
	callq	halide_mutex_unlock@PLT
	movl	%r14d, %eax
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end64:
	.size	halide_set_num_threads, .Lfunc_end64-halide_set_num_threads
                                        # -- End function
	.section	.text.halide_set_custom_do_task,"ax",@progbits
	.weak	halide_set_custom_do_task       # -- Begin function halide_set_custom_do_task
	.p2align	4, 0x90
	.type	halide_set_custom_do_task,@function
halide_set_custom_do_task:              # @halide_set_custom_do_task
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal14custom_do_taskE@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rax
	movq	%rdi, (%rcx)
	popq	%rbp
	retq
.Lfunc_end65:
	.size	halide_set_custom_do_task, .Lfunc_end65-halide_set_custom_do_task
                                        # -- End function
	.section	.text.halide_set_custom_do_loop_task,"ax",@progbits
	.weak	halide_set_custom_do_loop_task  # -- Begin function halide_set_custom_do_loop_task
	.p2align	4, 0x90
	.type	halide_set_custom_do_loop_task,@function
halide_set_custom_do_loop_task:         # @halide_set_custom_do_loop_task
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal19custom_do_loop_taskE@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rax
	movq	%rdi, (%rcx)
	popq	%rbp
	retq
.Lfunc_end66:
	.size	halide_set_custom_do_loop_task, .Lfunc_end66-halide_set_custom_do_loop_task
                                        # -- End function
	.section	.text.halide_set_custom_do_par_for,"ax",@progbits
	.weak	halide_set_custom_do_par_for    # -- Begin function halide_set_custom_do_par_for
	.p2align	4, 0x90
	.type	halide_set_custom_do_par_for,@function
halide_set_custom_do_par_for:           # @halide_set_custom_do_par_for
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal17custom_do_par_forE@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rax
	movq	%rdi, (%rcx)
	popq	%rbp
	retq
.Lfunc_end67:
	.size	halide_set_custom_do_par_for, .Lfunc_end67-halide_set_custom_do_par_for
                                        # -- End function
	.section	.text.halide_set_custom_parallel_runtime,"ax",@progbits
	.weak	halide_set_custom_parallel_runtime # -- Begin function halide_set_custom_parallel_runtime
	.p2align	4, 0x90
	.type	halide_set_custom_parallel_runtime,@function
halide_set_custom_parallel_runtime:     # @halide_set_custom_parallel_runtime
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	16(%rbp), %r10
	movq	_ZN6Halide7Runtime8Internal17custom_do_par_forE@GOTPCREL(%rip), %rax
	movq	%rdi, (%rax)
	movq	_ZN6Halide7Runtime8Internal14custom_do_taskE@GOTPCREL(%rip), %rax
	movq	%rsi, (%rax)
	movq	_ZN6Halide7Runtime8Internal19custom_do_loop_taskE@GOTPCREL(%rip), %rax
	movq	%rdx, (%rax)
	movq	_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE@GOTPCREL(%rip), %rax
	movq	%rcx, (%rax)
	movq	_ZN6Halide7Runtime8Internal21custom_semaphore_initE@GOTPCREL(%rip), %rax
	movq	%r8, (%rax)
	movq	_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE@GOTPCREL(%rip), %rax
	movq	%r9, (%rax)
	movq	_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE@GOTPCREL(%rip), %rax
	movq	%r10, (%rax)
	popq	%rbp
	retq
.Lfunc_end68:
	.size	halide_set_custom_parallel_runtime, .Lfunc_end68-halide_set_custom_parallel_runtime
                                        # -- End function
	.section	.text.halide_do_par_for,"ax",@progbits
	.weak	halide_do_par_for               # -- Begin function halide_do_par_for
	.p2align	4, 0x90
	.type	halide_do_par_for,@function
halide_do_par_for:                      # @halide_do_par_for
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal17custom_do_par_forE@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.Lfunc_end69:
	.size	halide_do_par_for, .Lfunc_end69-halide_do_par_for
                                        # -- End function
	.section	.text.halide_do_parallel_tasks,"ax",@progbits
	.weak	halide_do_parallel_tasks        # -- Begin function halide_do_parallel_tasks
	.p2align	4, 0x90
	.type	halide_do_parallel_tasks,@function
halide_do_parallel_tasks:               # @halide_do_parallel_tasks
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.Lfunc_end70:
	.size	halide_do_parallel_tasks, .Lfunc_end70-halide_do_parallel_tasks
                                        # -- End function
	.section	.text.halide_semaphore_init,"ax",@progbits
	.weak	halide_semaphore_init           # -- Begin function halide_semaphore_init
	.p2align	4, 0x90
	.type	halide_semaphore_init,@function
halide_semaphore_init:                  # @halide_semaphore_init
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal21custom_semaphore_initE@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.Lfunc_end71:
	.size	halide_semaphore_init, .Lfunc_end71-halide_semaphore_init
                                        # -- End function
	.section	.text.halide_semaphore_release,"ax",@progbits
	.weak	halide_semaphore_release        # -- Begin function halide_semaphore_release
	.p2align	4, 0x90
	.type	halide_semaphore_release,@function
halide_semaphore_release:               # @halide_semaphore_release
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.Lfunc_end72:
	.size	halide_semaphore_release, .Lfunc_end72-halide_semaphore_release
                                        # -- End function
	.section	.text.halide_semaphore_try_acquire,"ax",@progbits
	.weak	halide_semaphore_try_acquire    # -- Begin function halide_semaphore_try_acquire
	.p2align	4, 0x90
	.type	halide_semaphore_try_acquire,@function
halide_semaphore_try_acquire:           # @halide_semaphore_try_acquire
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.Lfunc_end73:
	.size	halide_semaphore_try_acquire, .Lfunc_end73-halide_semaphore_try_acquire
                                        # -- End function
	.section	.text.halide_default_get_symbol,"ax",@progbits
	.weak	halide_default_get_symbol       # -- Begin function halide_default_get_symbol
	.p2align	4, 0x90
	.type	halide_default_get_symbol,@function
halide_default_get_symbol:              # @halide_default_get_symbol
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, %rsi
	xorl	%edi, %edi
	popq	%rbp
	jmp	dlsym@PLT                       # TAILCALL
.Lfunc_end74:
	.size	halide_default_get_symbol, .Lfunc_end74-halide_default_get_symbol
                                        # -- End function
	.section	.text.halide_default_load_library,"ax",@progbits
	.weak	halide_default_load_library     # -- Begin function halide_default_load_library
	.p2align	4, 0x90
	.type	halide_default_load_library,@function
halide_default_load_library:            # @halide_default_load_library
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	pushq	%rax
	movl	$1, %esi
	callq	dlopen@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.LBB75_2
# %bb.1:                                # %if.then
	callq	dlerror@PLT
.LBB75_2:                               # %if.end
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end75:
	.size	halide_default_load_library, .Lfunc_end75-halide_default_load_library
                                        # -- End function
	.section	.text.halide_default_get_library_symbol,"ax",@progbits
	.weak	halide_default_get_library_symbol # -- Begin function halide_default_get_library_symbol
	.p2align	4, 0x90
	.type	halide_default_get_library_symbol,@function
halide_default_get_library_symbol:      # @halide_default_get_library_symbol
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	popq	%rbp
	jmp	dlsym@PLT                       # TAILCALL
.Lfunc_end76:
	.size	halide_default_get_library_symbol, .Lfunc_end76-halide_default_get_library_symbol
                                        # -- End function
	.section	.text.halide_set_custom_get_symbol,"ax",@progbits
	.weak	halide_set_custom_get_symbol    # -- Begin function halide_set_custom_get_symbol
	.p2align	4, 0x90
	.type	halide_set_custom_get_symbol,@function
halide_set_custom_get_symbol:           # @halide_set_custom_get_symbol
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal17custom_get_symbolE@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rax
	movq	%rdi, (%rcx)
	popq	%rbp
	retq
.Lfunc_end77:
	.size	halide_set_custom_get_symbol, .Lfunc_end77-halide_set_custom_get_symbol
                                        # -- End function
	.section	.text.halide_set_custom_load_library,"ax",@progbits
	.weak	halide_set_custom_load_library  # -- Begin function halide_set_custom_load_library
	.p2align	4, 0x90
	.type	halide_set_custom_load_library,@function
halide_set_custom_load_library:         # @halide_set_custom_load_library
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal19custom_load_libraryE@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rax
	movq	%rdi, (%rcx)
	popq	%rbp
	retq
.Lfunc_end78:
	.size	halide_set_custom_load_library, .Lfunc_end78-halide_set_custom_load_library
                                        # -- End function
	.section	.text.halide_set_custom_get_library_symbol,"ax",@progbits
	.weak	halide_set_custom_get_library_symbol # -- Begin function halide_set_custom_get_library_symbol
	.p2align	4, 0x90
	.type	halide_set_custom_get_library_symbol,@function
halide_set_custom_get_library_symbol:   # @halide_set_custom_get_library_symbol
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal25custom_get_library_symbolE@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rax
	movq	%rdi, (%rcx)
	popq	%rbp
	retq
.Lfunc_end79:
	.size	halide_set_custom_get_library_symbol, .Lfunc_end79-halide_set_custom_get_library_symbol
                                        # -- End function
	.section	.text.halide_get_symbol,"ax",@progbits
	.weak	halide_get_symbol               # -- Begin function halide_get_symbol
	.p2align	4, 0x90
	.type	halide_get_symbol,@function
halide_get_symbol:                      # @halide_get_symbol
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal17custom_get_symbolE@GOTPCREL(%rip), %rax
	popq	%rbp
	jmpq	*(%rax)                         # TAILCALL
.Lfunc_end80:
	.size	halide_get_symbol, .Lfunc_end80-halide_get_symbol
                                        # -- End function
	.section	.text.halide_load_library,"ax",@progbits
	.weak	halide_load_library             # -- Begin function halide_load_library
	.p2align	4, 0x90
	.type	halide_load_library,@function
halide_load_library:                    # @halide_load_library
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal19custom_load_libraryE@GOTPCREL(%rip), %rax
	popq	%rbp
	jmpq	*(%rax)                         # TAILCALL
.Lfunc_end81:
	.size	halide_load_library, .Lfunc_end81-halide_load_library
                                        # -- End function
	.section	.text.halide_get_library_symbol,"ax",@progbits
	.weak	halide_get_library_symbol       # -- Begin function halide_get_library_symbol
	.p2align	4, 0x90
	.type	halide_get_library_symbol,@function
halide_get_library_symbol:              # @halide_get_library_symbol
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal25custom_get_library_symbolE@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.Lfunc_end82:
	.size	halide_get_library_symbol, .Lfunc_end82-halide_get_library_symbol
                                        # -- End function
	.section	.text.halide_set_gpu_device,"ax",@progbits
	.weak	halide_set_gpu_device           # -- Begin function halide_set_gpu_device
	.p2align	4, 0x90
	.type	halide_set_gpu_device,@function
halide_set_gpu_device:                  # @halide_set_gpu_device
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal17halide_gpu_deviceE@GOTPCREL(%rip), %rax
	movl	%edi, (%rax)
	movq	_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE@GOTPCREL(%rip), %rax
	movb	$1, (%rax)
	popq	%rbp
	retq
.Lfunc_end83:
	.size	halide_set_gpu_device, .Lfunc_end83-halide_set_gpu_device
                                        # -- End function
	.section	.text.halide_get_gpu_device,"ax",@progbits
	.weak	halide_get_gpu_device           # -- Begin function halide_get_gpu_device
	.p2align	4, 0x90
	.type	halide_get_gpu_device,@function
halide_get_gpu_device:                  # @halide_get_gpu_device
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	movq	_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE@GOTPCREL(%rip), %rbx
	.p2align	4, 0x90
.LBB84_1:                               # %while.cond.i
                                        # =>This Inner Loop Header: Depth=1
	movb	$1, %al
	xchgb	%al, (%rbx)
	testb	%al, %al
	jne	.LBB84_1
# %bb.2:                                # %_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVc.exit
	movq	_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE@GOTPCREL(%rip), %r14
	cmpb	$0, (%r14)
	je	.LBB84_4
# %bb.3:                                # %_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVc.exit.if.end4_crit_edge
	movq	_ZN6Halide7Runtime8Internal17halide_gpu_deviceE@GOTPCREL(%rip), %rax
	movl	(%rax), %eax
	jmp	.LBB84_8
.LBB84_4:                               # %if.then
	leaq	.L.str.8(%rip), %rdi
	callq	getenv@PLT
	testq	%rax, %rax
	je	.LBB84_5
# %bb.6:                                # %if.then2
	movq	%rax, %rdi
	callq	atoi@PLT
	jmp	.LBB84_7
.LBB84_5:
	movl	$-1, %eax
.LBB84_7:                               # %if.end
	movq	_ZN6Halide7Runtime8Internal17halide_gpu_deviceE@GOTPCREL(%rip), %rcx
	movl	%eax, (%rcx)
	movb	$1, (%r14)
.LBB84_8:                               # %if.end4
	movb	$0, (%rbx)
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end84:
	.size	halide_get_gpu_device, .Lfunc_end84-halide_get_gpu_device
                                        # -- End function
	.section	.text.halide_default_trace,"ax",@progbits
	.weak	halide_default_trace            # -- Begin function halide_default_trace
	.p2align	4, 0x90
	.type	halide_default_trace,@function
halide_default_trace:                   # @halide_default_trace
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$72, %rsp
	movq	%rsi, %r14
	movl	$1, %r15d
	movl	$1, %r12d
	lock		xaddl	%r12d, _ZZ20halide_default_traceE3ids(%rip)
	movq	%rdi, -56(%rbp)                 # 8-byte Spill
	callq	halide_get_trace_file@PLT
	movl	%eax, -48(%rbp)                 # 4-byte Spill
	testl	%eax, %eax
	movq	%r14, -64(%rbp)                 # 8-byte Spill
	movl	%r12d, -68(%rbp)                # 4-byte Spill
	jle	.LBB85_40
# %bb.1:                                # %if.then
	movzwl	34(%r14), %eax
	movzbl	33(%r14), %ebx
	addq	$7, %rbx
	shrq	$3, %rbx
	imulq	%rax, %rbx
	movl	48(%r14), %r12d
	shll	$2, %r12d
	movq	(%r14), %rdi
	callq	strlen@PLT
	movq	%rax, %r13
	incl	%r13d
	movq	24(%r14), %rdi
	testq	%rdi, %rdi
	je	.LBB85_3
# %bb.2:                                # %cond.true
	callq	strlen@PLT
	movq	%rax, %r15
	incl	%r15d
.LBB85_3:                               # %cond.end
	movq	%r12, -88(%rbp)                 # 8-byte Spill
	leal	(%r12,%rbx), %eax
	addl	%r13d, %eax
	leal	(%r15,%rax), %r12d
	addl	$31, %r12d
	andl	$-4, %r12d
	movq	_ZN6Halide7Runtime8Internal19halide_trace_bufferE@GOTPCREL(%rip), %rax
	movq	(%rax), %r14
	leaq	12(%r14), %rax
	movq	%rax, -80(%rbp)                 # 8-byte Spill
	cmpl	$1048577, %r12d                 # imm = 0x100001
	movq	%r15, -112(%rbp)                # 8-byte Spill
	movq	%r13, -104(%rbp)                # 8-byte Spill
	movq	%rbx, -96(%rbp)                 # 8-byte Spill
	jae	.LBB85_4
# %bb.12:                               # %while.body.i.i.us.i.preheader
	movl	$1073741823, %r13d              # imm = 0x3FFFFFFF
	movl	$-2147483648, %r15d             # imm = 0x80000000
	jmp	.LBB85_13
.LBB85_20:                              # %do.end.critedge.i.us.i
                                        #   in Loop: Header=BB85_13 Depth=1
	lock		andl	$2147483647, (%r14)     # imm = 0x7FFFFFFF
	.p2align	4, 0x90
.LBB85_13:                              # %while.body.i.i.us.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB85_16 Depth 2
	movl	(%r14), %eax
	andl	%r13d, %eax
	leal	1(%rax), %ecx
                                        # kill: def $eax killed $eax killed $rax
	lock		cmpxchgl	%ecx, (%r14)
	jne	.LBB85_13
# %bb.14:                               # %_ZN6Halide7Runtime8Internal23SharedExclusiveSpinLock14acquire_sharedEv.exit.i.us.i
                                        #   in Loop: Header=BB85_13 Depth=1
	movl	%r12d, %eax
	lock		xaddl	%eax, 4(%r14)
	leal	(%rax,%r12), %ecx
	cmpl	$1048577, %ecx                  # imm = 0x100001
	jb	.LBB85_22
# %bb.15:                               # %while.body.us.i
                                        #   in Loop: Header=BB85_13 Depth=1
	lock		addl	%r12d, 8(%r14)
	lock		decl	(%r14)
	.p2align	4, 0x90
.LBB85_16:                              # %while.body.i.i5.us.i
                                        #   Parent Loop BB85_13 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lock		orl	$1073741824, (%r14)     # imm = 0x40000000
	movl	$1073741824, %eax               # imm = 0x40000000
	lock		cmpxchgl	%r15d, (%r14)
	jne	.LBB85_16
# %bb.17:                               # %_ZN6Halide7Runtime8Internal23SharedExclusiveSpinLock17acquire_exclusiveEv.exit.i.us.i
                                        #   in Loop: Header=BB85_13 Depth=1
	movl	4(%r14), %ebx
	testl	%ebx, %ebx
	je	.LBB85_20
# %bb.18:                               # %if.then.i9.us.i
                                        #   in Loop: Header=BB85_13 Depth=1
	subl	8(%r14), %ebx
	movl	%ebx, 4(%r14)
	movl	-48(%rbp), %edi                 # 4-byte Reload
	movq	-80(%rbp), %rsi                 # 8-byte Reload
	movq	%rbx, %rdx
	callq	write@PLT
	movq	$0, 4(%r14)
	lock		andl	$2147483647, (%r14)     # imm = 0x7FFFFFFF
	cmpl	%eax, %ebx
	je	.LBB85_13
# %bb.19:                               # %if.then10.i.us.i
                                        #   in Loop: Header=BB85_13 Depth=1
	movq	-56(%rbp), %rdi                 # 8-byte Reload
	leaq	.L.str.32(%rip), %rsi
	callq	halide_print@PLT
	callq	abort@PLT
	jmp	.LBB85_13
.LBB85_40:                              # %if.else
	movl	$4096, %edi                     # imm = 0x1000
	callq	malloc@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.LBB85_41
# %bb.42:                               # %if.then6.i439
	leaq	4095(%rbx), %r13
	movb	$0, 4095(%rbx)
	jmp	.LBB85_43
.LBB85_4:
	movl	$1073741823, %r15d              # imm = 0x3FFFFFFF
	movl	$-2147483648, %r13d             # imm = 0x80000000
	jmp	.LBB85_5
.LBB85_21:                              # %do.end.critedge.i.i
                                        #   in Loop: Header=BB85_5 Depth=1
	lock		andl	$2147483647, (%r14)     # imm = 0x7FFFFFFF
	.p2align	4, 0x90
.LBB85_5:                               # %while.body.i.i.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB85_8 Depth 2
	movl	(%r14), %eax
	andl	%r15d, %eax
	leal	1(%rax), %ecx
                                        # kill: def $eax killed $eax killed $rax
	lock		cmpxchgl	%ecx, (%r14)
	jne	.LBB85_5
# %bb.6:                                # %_ZN6Halide7Runtime8Internal23SharedExclusiveSpinLock14acquire_sharedEv.exit.i.i
                                        #   in Loop: Header=BB85_5 Depth=1
	movq	-56(%rbp), %rdi                 # 8-byte Reload
	leaq	.L.str.31(%rip), %rsi
	callq	halide_print@PLT
	callq	abort@PLT
	movl	%r12d, %eax
	lock		xaddl	%eax, 4(%r14)
	leal	(%rax,%r12), %ecx
	cmpl	$1048577, %ecx                  # imm = 0x100001
	jb	.LBB85_22
# %bb.7:                                # %while.body.i
                                        #   in Loop: Header=BB85_5 Depth=1
	lock		addl	%r12d, 8(%r14)
	lock		decl	(%r14)
	.p2align	4, 0x90
.LBB85_8:                               # %while.body.i.i5.i
                                        #   Parent Loop BB85_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lock		orl	$1073741824, (%r14)     # imm = 0x40000000
	movl	$1073741824, %eax               # imm = 0x40000000
	lock		cmpxchgl	%r13d, (%r14)
	jne	.LBB85_8
# %bb.9:                                # %_ZN6Halide7Runtime8Internal23SharedExclusiveSpinLock17acquire_exclusiveEv.exit.i.i
                                        #   in Loop: Header=BB85_5 Depth=1
	movl	4(%r14), %ebx
	testl	%ebx, %ebx
	je	.LBB85_21
# %bb.10:                               # %if.then.i9.i
                                        #   in Loop: Header=BB85_5 Depth=1
	subl	8(%r14), %ebx
	movl	%ebx, 4(%r14)
	movl	-48(%rbp), %edi                 # 4-byte Reload
	movq	-80(%rbp), %rsi                 # 8-byte Reload
	movq	%rbx, %rdx
	callq	write@PLT
	movq	$0, 4(%r14)
	lock		andl	$2147483647, (%r14)     # imm = 0x7FFFFFFF
	cmpl	%eax, %ebx
	je	.LBB85_5
# %bb.11:                               # %if.then10.i.i
                                        #   in Loop: Header=BB85_5 Depth=1
	movq	-56(%rbp), %rdi                 # 8-byte Reload
	leaq	.L.str.32(%rip), %rsi
	callq	halide_print@PLT
	callq	abort@PLT
	jmp	.LBB85_5
.LBB85_22:                              # %_ZN6Halide7Runtime8Internal11TraceBuffer14acquire_packetEPvij.exit
	movl	%eax, %eax
	leaq	(%r14,%rax), %rbx
	addq	$12, %rbx
	cmpl	$4097, %r12d                    # imm = 0x1001
	movq	-96(%rbp), %r13                 # 8-byte Reload
	jb	.LBB85_27
# %bb.23:                               # %if.then17
	movl	$1024, %edi                     # imm = 0x400
	callq	malloc@PLT
	movq	%rax, %r14
	testq	%rax, %rax
	je	.LBB85_24
# %bb.25:                               # %if.else.i
	leaq	1023(%r14), %r15
	movb	$0, 1023(%r14)
	movl	%r12d, %edx
	movq	%r14, %rdi
	movq	%r15, %rsi
	movl	$1, %ecx
	callq	halide_uint64_to_string@PLT
	leaq	.L.str.7.164(%rip), %rdx
	movq	%rax, %rdi
	movq	%r15, %rsi
	callq	halide_string_to_string@PLT
	subq	%r14, %rax
	leaq	1(%rax), %rdx
	xorl	%edi, %edi
	movq	%r14, %rsi
	callq	halide_msan_annotate_memory_is_initialized@PLT
	xorl	%edi, %edi
	movq	%r14, %rsi
	callq	halide_print@PLT
	jmp	.LBB85_26
.LBB85_41:
	xorl	%r13d, %r13d
.LBB85_43:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy4096EEC2EPvPc.exit
	movzbl	33(%r14), %eax
	movl	$8, %ecx
	.p2align	4, 0x90
.LBB85_44:                              # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	%ecx, %r15d
	leal	(%r15,%r15), %ecx
	cmpl	%eax, %r15d
	jl	.LBB85_44
# %bb.45:                               # %do.body
	cmpl	$65, %r15d
	jl	.LBB85_47
# %bb.46:                               # %if.then63
	leaq	.L.str.2.11(%rip), %rsi
	movq	-56(%rbp), %rdi                 # 8-byte Reload
	callq	halide_print@PLT
	callq	abort@PLT
.LBB85_47:                              # %do.end
	movl	36(%r14), %ecx
	leaq	.Lreltable.halide_default_trace(%rip), %rax
	movq	%rcx, -48(%rbp)                 # 8-byte Spill
	movslq	(%rax,%rcx,4), %rdx
	addq	%rax, %rdx
	movq	%rbx, %rdi
	movq	%r13, %rsi
	callq	halide_string_to_string@PLT
	leaq	.L.str.20.177(%rip), %rdx
	movq	%rax, %rdi
	movq	%r13, %rsi
	callq	halide_string_to_string@PLT
	movq	(%r14), %rdx
	movq	%rax, %rdi
	movq	%r13, %rsi
	callq	halide_string_to_string@PLT
	leaq	.L.str.30.141(%rip), %rdx
	movq	%rax, %rdi
	movq	%r13, %rsi
	callq	halide_string_to_string@PLT
	movslq	44(%r14), %rdx
	movq	%rax, %rdi
	movq	%r13, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.22.179(%rip), %rdx
	movq	%rax, %rdi
	movq	%r13, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	cmpw	$2, 34(%r14)
	jb	.LBB85_49
# %bb.48:                               # %if.then80
	leaq	.L.str.17(%rip), %rdx
	movq	%r13, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
.LBB85_49:                              # %if.end82
	cmpl	$0, 48(%r14)
	movq	%rbx, -80(%rbp)                 # 8-byte Spill
	jle	.LBB85_56
# %bb.50:                               # %if.end100.peel
	movq	16(%r14), %rax
	movslq	(%rax), %rdx
	movq	%r13, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	movq	%rax, %rdi
	cmpl	$2, 48(%r14)
	jl	.LBB85_56
# %bb.51:                               # %if.then86.preheader
	movl	$1, %ebx
	leaq	.L.str.55(%rip), %r12
	jmp	.LBB85_52
	.p2align	4, 0x90
.LBB85_54:                              # %if.else97.split
                                        #   in Loop: Header=BB85_52 Depth=1
	movq	%r12, %rdx
.LBB85_55:                              # %if.end100
                                        #   in Loop: Header=BB85_52 Depth=1
	movq	%r13, %rsi
	callq	halide_string_to_string@PLT
	movq	-64(%rbp), %r14                 # 8-byte Reload
	movq	16(%r14), %rcx
	movslq	(%rcx,%rbx,4), %rdx
	movq	%rax, %rdi
	movq	%r13, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	movq	%rax, %rdi
	incq	%rbx
	movslq	48(%r14), %rax
	cmpq	%rax, %rbx
	jge	.LBB85_56
.LBB85_52:                              # %if.then86
                                        # =>This Inner Loop Header: Depth=1
	movzwl	34(%r14), %ecx
	cmpl	$2, %ecx
	jb	.LBB85_54
# %bb.53:                               # %land.lhs.true
                                        #   in Loop: Header=BB85_52 Depth=1
	movl	%ebx, %eax
	xorl	%edx, %edx
	divl	%ecx
	movl	%edx, %eax
	leaq	.L.str.18(%rip), %rdx
	testl	%eax, %eax
	jne	.LBB85_54
	jmp	.LBB85_55
.LBB85_56:                              # %for.cond.cleanup
	cmpw	$2, 34(%r14)
	leaq	.L.str.20(%rip), %rax
	leaq	.L.str.8.119(%rip), %rdx
	cmovaeq	%rax, %rdx
	movq	%r13, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %r12
	cmpl	$2, -48(%rbp)                   # 4-byte Folded Reload
	jge	.LBB85_93
# %bb.57:                               # %if.then115
	cmpw	$2, 34(%r14)
	leaq	.L.str.22(%rip), %rax
	leaq	.L.str.23(%rip), %rdx
	cmovaeq	%rax, %rdx
	movq	%r12, %rdi
	movq	%r13, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %r12
	cmpw	$0, 34(%r14)
	je	.LBB85_93
# %bb.58:                               # %if.end136.peel
	leaq	8(%r14), %rax
	movq	%rax, -48(%rbp)                 # 8-byte Spill
	movzbl	32(%r14), %eax
	cmpq	$3, %rax
	ja	.LBB85_87
# %bb.59:                               # %if.end136.peel
	leaq	.LJTI85_0(%rip), %rcx
	movslq	(%rcx,%rax,4), %rax
	addq	%rcx, %rax
	jmpq	*%rax
.LBB85_78:                              # %if.then140.peel
	cmpl	$8, %r15d
	je	.LBB85_83
# %bb.79:                               # %if.then140.peel
	cmpl	$16, %r15d
	je	.LBB85_82
# %bb.80:                               # %if.then140.peel
	cmpl	$32, %r15d
	jne	.LBB85_84
# %bb.81:                               # %if.then158.peel
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movq	(%rax), %rax
	movslq	(%rax), %rdx
	jmp	.LBB85_85
.LBB85_24:                              # %if.then.i427
	movl	%r12d, %edx
	xorl	%edi, %edi
	xorl	%esi, %esi
	movl	$1, %ecx
	callq	halide_uint64_to_string@PLT
	leaq	.L.str.7.164(%rip), %rdx
	movq	%rax, %rdi
	xorl	%esi, %esi
	callq	halide_string_to_string@PLT
	leaq	.L.str.29.163(%rip), %rsi
	xorl	%edi, %edi
	callq	halide_error@PLT
.LBB85_26:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE0ELy1024EED2Ev.exit
	movq	%r14, %rdi
	callq	free@PLT
.LBB85_27:                              # %if.end
	movl	%r12d, (%rbx)
	movl	-68(%rbp), %r15d                # 4-byte Reload
	movl	%r15d, 4(%rbx)
	movq	-64(%rbp), %r14                 # 8-byte Reload
	movl	32(%r14), %eax
	movl	%eax, 8(%rbx)
	vmovups	36(%r14), %xmm0
	vmovups	%xmm0, 12(%rbx)
	movq	16(%r14), %rsi
	testq	%rsi, %rsi
	je	.LBB85_29
# %bb.28:                               # %if.then28
	leaq	28(%rbx), %rdi
	movl	-88(%rbp), %edx                 # 4-byte Reload
	callq	memcpy@PLT
.LBB85_29:                              # %if.end33
	movq	8(%r14), %rsi
	testq	%rsi, %rsi
	je	.LBB85_31
# %bb.30:                               # %if.then35
	movslq	24(%rbx), %rax
	leaq	(%rbx,%rax,4), %rdi
	addq	$28, %rdi
	movq	%r13, %rdx
	callq	memcpy@PLT
.LBB85_31:                              # %if.end40
	movslq	24(%rbx), %rax
	leaq	(%rbx,%rax,4), %rax
	addq	$28, %rax
	movzwl	10(%rbx), %ecx
	movzbl	9(%rbx), %edi
	addq	$7, %rdi
	shrq	$3, %rdi
	imulq	%rcx, %rdi
	addq	%rax, %rdi
	movq	(%r14), %rsi
	movl	-104(%rbp), %edx                # 4-byte Reload
	callq	memcpy@PLT
	movslq	24(%rbx), %rax
	leaq	(%rbx,%rax,4), %rax
	addq	$28, %rax
	movzwl	10(%rbx), %ecx
	movzbl	9(%rbx), %edi
	addq	$7, %rdi
	shrq	$3, %rdi
	imulq	%rcx, %rdi
	addq	%rax, %rdi
	.p2align	4, 0x90
.LBB85_32:                              # %while.cond.i409
                                        # =>This Inner Loop Header: Depth=1
	cmpb	$0, (%rdi)
	leaq	1(%rdi), %rdi
	jne	.LBB85_32
# %bb.33:                               # %_ZN21halide_trace_packet_t9trace_tagEv.exit
	movq	24(%r14), %rax
	testq	%rax, %rax
	leaq	.L.str.1.10(%rip), %rsi
	cmovneq	%rax, %rsi
	movl	-112(%rbp), %edx                # 4-byte Reload
	callq	memcpy@PLT
	movq	_ZN6Halide7Runtime8Internal19halide_trace_bufferE@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rax
	mfence
	lock		decl	(%rax)
	cmpl	$9, 36(%r14)
	jne	.LBB85_130
# %bb.34:                               # %if.then57
	movq	(%rcx), %rbx
	movl	$-2147483648, %ecx              # imm = 0x80000000
	.p2align	4, 0x90
.LBB85_35:                              # %while.body.i.i
                                        # =>This Inner Loop Header: Depth=1
	lock		orl	$1073741824, (%rbx)     # imm = 0x40000000
	movl	$1073741824, %eax               # imm = 0x40000000
	lock		cmpxchgl	%ecx, (%rbx)
	jne	.LBB85_35
# %bb.36:                               # %_ZN6Halide7Runtime8Internal23SharedExclusiveSpinLock17acquire_exclusiveEv.exit.i
	movl	4(%rbx), %r14d
	testl	%r14d, %r14d
	je	.LBB85_39
# %bb.37:                               # %if.then.i
	subl	8(%rbx), %r14d
	movl	%r14d, 4(%rbx)
	leaq	12(%rbx), %rsi
	movl	-48(%rbp), %edi                 # 4-byte Reload
	movq	%r14, %rdx
	callq	write@PLT
	movq	$0, 4(%rbx)
	lock		andl	$2147483647, (%rbx)     # imm = 0x7FFFFFFF
	cmpl	%eax, %r14d
	je	.LBB85_130
# %bb.38:                               # %if.then10.i
	leaq	.L.str.32(%rip), %rsi
	movq	-56(%rbp), %rdi                 # 8-byte Reload
	callq	halide_print@PLT
	callq	abort@PLT
	jmp	.LBB85_130
.LBB85_39:                              # %do.end.critedge.i
	lock		andl	$2147483647, (%rbx)     # imm = 0x7FFFFFFF
	jmp	.LBB85_130
.LBB85_70:                              # %if.then176.peel
	cmpl	$8, %r15d
	je	.LBB85_76
# %bb.71:                               # %if.then176.peel
	cmpl	$16, %r15d
	je	.LBB85_75
# %bb.72:                               # %if.then176.peel
	cmpl	$32, %r15d
	jne	.LBB85_77
# %bb.73:                               # %if.then194.peel
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movq	(%rax), %rax
	movl	(%rax), %edx
	jmp	.LBB85_74
.LBB85_61:                              # %do.body213.peel
	cmpl	$15, %r15d
	jg	.LBB85_63
# %bb.62:                               # %if.then215.peel
	leaq	.L.str.24(%rip), %rsi
	movq	-56(%rbp), %rdi                 # 8-byte Reload
	callq	halide_print@PLT
	callq	abort@PLT
.LBB85_63:                              # %do.end218.peel
	cmpl	$32, %r15d
	je	.LBB85_66
# %bb.64:                               # %do.end218.peel
	cmpl	$16, %r15d
	jne	.LBB85_67
# %bb.65:                               # %if.then227.peel
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movq	(%rax), %rax
	movzwl	(%rax), %edi
	callq	halide_float16_bits_to_double@PLT
	jmp	.LBB85_68
.LBB85_60:                              # %if.then244.peel
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movq	(%rax), %rax
	movq	(%rax), %rdx
	movq	%r12, %rdi
	movq	%r13, %rsi
	callq	halide_pointer_to_string@PLT
	jmp	.LBB85_86
.LBB85_66:                              # %if.then220.peel
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movq	(%rax), %rax
	vmovss	(%rax), %xmm0                   # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movq	%r12, %rdi
	movq	%r13, %rsi
	xorl	%edx, %edx
	callq	halide_double_to_string@PLT
	jmp	.LBB85_86
.LBB85_67:                              # %if.else232.peel
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movq	(%rax), %rax
	vmovsd	(%rax), %xmm0                   # xmm0 = mem[0],zero
.LBB85_68:                              # %for.inc253.peel
	movq	%r12, %rdi
	movq	%r13, %rsi
	movl	$1, %edx
	callq	halide_double_to_string@PLT
	jmp	.LBB85_86
.LBB85_83:                              # %if.then142.peel
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movq	(%rax), %rax
	movsbq	(%rax), %rdx
	jmp	.LBB85_85
.LBB85_82:                              # %if.then150.peel
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movq	(%rax), %rax
	movswq	(%rax), %rdx
	jmp	.LBB85_85
.LBB85_84:                              # %if.else163.peel
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movq	(%rax), %rax
	movq	(%rax), %rdx
	jmp	.LBB85_85
.LBB85_76:                              # %if.then178.peel
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movq	(%rax), %rax
	movzbl	(%rax), %edx
	jmp	.LBB85_85
.LBB85_75:                              # %if.then186.peel
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movq	(%rax), %rax
	movzwl	(%rax), %edx
.LBB85_85:                              # %for.inc253.peel
	movq	%r12, %rdi
	movq	%r13, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	jmp	.LBB85_86
.LBB85_77:                              # %if.else199.peel
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movq	(%rax), %rax
	movq	(%rax), %rdx
.LBB85_74:                              # %for.inc253.peel
	movq	%r12, %rdi
	movq	%r13, %rsi
	movl	$1, %ecx
	callq	halide_uint64_to_string@PLT
.LBB85_86:                              # %for.inc253.peel
	movq	%rax, %r12
.LBB85_87:                              # %for.inc253.peel
	movq	-64(%rbp), %rax                 # 8-byte Reload
	cmpw	$2, 34(%rax)
	jb	.LBB85_93
# %bb.88:                               # %if.end136.preheader
	movl	$1, %r14d
	movq	-64(%rbp), %rbx                 # 8-byte Reload
	jmp	.LBB85_89
.LBB85_112:                             # %if.then186
                                        #   in Loop: Header=BB85_89 Depth=1
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movq	(%rax), %rax
	movzwl	(%rax,%r14,2), %edx
	.p2align	4, 0x90
.LBB85_104:                             # %for.inc253
                                        #   in Loop: Header=BB85_89 Depth=1
	movq	%r12, %rdi
	movq	%r13, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
.LBB85_126:                             # %for.inc253
                                        #   in Loop: Header=BB85_89 Depth=1
	movq	%rax, %r12
.LBB85_127:                             # %for.inc253
                                        #   in Loop: Header=BB85_89 Depth=1
	incq	%r14
	movq	-64(%rbp), %rbx                 # 8-byte Reload
	movzwl	34(%rbx), %eax
	cmpq	%rax, %r14
	jae	.LBB85_91
.LBB85_89:                              # %if.end136
                                        # =>This Inner Loop Header: Depth=1
	movq	%r12, %rdi
	movq	%r13, %rsi
	leaq	.L.str.55(%rip), %rdx
	callq	halide_string_to_string@PLT
	movq	%rax, %r12
	movzbl	32(%rbx), %eax
	cmpq	$3, %rax
	ja	.LBB85_127
# %bb.90:                               # %if.end136
                                        #   in Loop: Header=BB85_89 Depth=1
	leaq	.LJTI85_1(%rip), %rcx
	movslq	(%rcx,%rax,4), %rax
	addq	%rcx, %rax
	jmpq	*%rax
.LBB85_100:                             # %if.then140
                                        #   in Loop: Header=BB85_89 Depth=1
	cmpl	$32, %r15d
	je	.LBB85_106
# %bb.101:                              # %if.then140
                                        #   in Loop: Header=BB85_89 Depth=1
	cmpl	$16, %r15d
	je	.LBB85_105
# %bb.102:                              # %if.then140
                                        #   in Loop: Header=BB85_89 Depth=1
	cmpl	$8, %r15d
	jne	.LBB85_107
# %bb.103:                              # %if.then142
                                        #   in Loop: Header=BB85_89 Depth=1
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movq	(%rax), %rax
	movsbq	(%rax,%r14), %rdx
	jmp	.LBB85_104
	.p2align	4, 0x90
.LBB85_108:                             # %if.then176
                                        #   in Loop: Header=BB85_89 Depth=1
	cmpl	$32, %r15d
	je	.LBB85_113
# %bb.109:                              # %if.then176
                                        #   in Loop: Header=BB85_89 Depth=1
	cmpl	$16, %r15d
	je	.LBB85_112
# %bb.110:                              # %if.then176
                                        #   in Loop: Header=BB85_89 Depth=1
	cmpl	$8, %r15d
	jne	.LBB85_115
# %bb.111:                              # %if.then178
                                        #   in Loop: Header=BB85_89 Depth=1
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movq	(%rax), %rax
	movzbl	(%rax,%r14), %edx
	jmp	.LBB85_104
	.p2align	4, 0x90
.LBB85_116:                             # %do.body213
                                        #   in Loop: Header=BB85_89 Depth=1
	cmpl	$15, %r15d
	jg	.LBB85_118
# %bb.117:                              # %if.then215
                                        #   in Loop: Header=BB85_89 Depth=1
	movq	-56(%rbp), %rdi                 # 8-byte Reload
	leaq	.L.str.24(%rip), %rsi
	callq	halide_print@PLT
	callq	abort@PLT
.LBB85_118:                             # %do.end218
                                        #   in Loop: Header=BB85_89 Depth=1
	cmpl	$16, %r15d
	je	.LBB85_121
# %bb.119:                              # %do.end218
                                        #   in Loop: Header=BB85_89 Depth=1
	cmpl	$32, %r15d
	jne	.LBB85_122
# %bb.120:                              # %if.then220
                                        #   in Loop: Header=BB85_89 Depth=1
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movq	(%rax), %rax
	vmovss	(%rax,%r14,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movq	%r12, %rdi
	movq	%r13, %rsi
	xorl	%edx, %edx
	callq	halide_double_to_string@PLT
	jmp	.LBB85_126
	.p2align	4, 0x90
.LBB85_125:                             # %if.then244
                                        #   in Loop: Header=BB85_89 Depth=1
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movq	(%rax), %rax
	movq	(%rax,%r14,8), %rdx
	movq	%r12, %rdi
	movq	%r13, %rsi
	callq	halide_pointer_to_string@PLT
	jmp	.LBB85_126
.LBB85_121:                             # %if.then227
                                        #   in Loop: Header=BB85_89 Depth=1
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movq	(%rax), %rax
	movzwl	(%rax,%r14,2), %edi
	callq	halide_float16_bits_to_double@PLT
	jmp	.LBB85_123
.LBB85_122:                             # %if.else232
                                        #   in Loop: Header=BB85_89 Depth=1
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movq	(%rax), %rax
	vmovsd	(%rax,%r14,8), %xmm0            # xmm0 = mem[0],zero
.LBB85_123:                             # %for.inc253
                                        #   in Loop: Header=BB85_89 Depth=1
	movq	%r12, %rdi
	movq	%r13, %rsi
	movl	$1, %edx
	callq	halide_double_to_string@PLT
	jmp	.LBB85_126
.LBB85_106:                             # %if.then158
                                        #   in Loop: Header=BB85_89 Depth=1
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movq	(%rax), %rax
	movslq	(%rax,%r14,4), %rdx
	jmp	.LBB85_104
.LBB85_105:                             # %if.then150
                                        #   in Loop: Header=BB85_89 Depth=1
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movq	(%rax), %rax
	movswq	(%rax,%r14,2), %rdx
	jmp	.LBB85_104
.LBB85_113:                             # %if.then194
                                        #   in Loop: Header=BB85_89 Depth=1
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movq	(%rax), %rax
	movl	(%rax,%r14,4), %edx
	jmp	.LBB85_114
.LBB85_107:                             # %if.else163
                                        #   in Loop: Header=BB85_89 Depth=1
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movq	(%rax), %rax
	movq	(%rax,%r14,8), %rdx
	jmp	.LBB85_104
.LBB85_115:                             # %if.else199
                                        #   in Loop: Header=BB85_89 Depth=1
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movq	(%rax), %rax
	movq	(%rax,%r14,8), %rdx
.LBB85_114:                             # %for.inc253
                                        #   in Loop: Header=BB85_89 Depth=1
	movq	%r12, %rdi
	movq	%r13, %rsi
	movl	$1, %ecx
	callq	halide_uint64_to_string@PLT
	jmp	.LBB85_126
.LBB85_91:                              # %for.cond.cleanup131
	cmpw	$1, %ax
	jbe	.LBB85_93
# %bb.92:                               # %if.then260
	leaq	.L.str.25(%rip), %rdx
	movq	%r12, %rdi
	movq	%r13, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %r12
.LBB85_93:                              # %if.end263
	movq	-64(%rbp), %rax                 # 8-byte Reload
	movq	24(%rax), %rax
	testq	%rax, %rax
	je	.LBB85_96
# %bb.94:                               # %land.lhs.true266
	cmpb	$0, (%rax)
	je	.LBB85_96
# %bb.95:                               # %if.then269
	leaq	.L.str.26(%rip), %rdx
	movq	%r12, %rdi
	movq	%r13, %rsi
	callq	halide_string_to_string@PLT
	movq	-64(%rbp), %rcx                 # 8-byte Reload
	movq	24(%rcx), %rdx
	movq	%rax, %rdi
	movq	%r13, %rsi
	callq	halide_string_to_string@PLT
	leaq	.L.str.27(%rip), %rdx
	movq	%rax, %rdi
	movq	%r13, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %r12
.LBB85_96:                              # %if.end274
	leaq	.L.str.7.164(%rip), %rdx
	movq	%r12, %rdi
	movq	%r13, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %r14
	movq	_ZN6Halide7Runtime8Internal22halide_trace_file_lockE@GOTPCREL(%rip), %rbx
	.p2align	4, 0x90
.LBB85_97:                              # %while.cond.i414
                                        # =>This Inner Loop Header: Depth=1
	movb	$1, %al
	xchgb	%al, (%rbx)
	testb	%al, %al
	jne	.LBB85_97
# %bb.98:                               # %_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVc.exit
	movq	-80(%rbp), %r12                 # 8-byte Reload
	testq	%r12, %r12
	je	.LBB85_99
# %bb.128:                              # %if.else.i564
	subq	%r12, %r14
	incq	%r14
	movq	-56(%rbp), %r15                 # 8-byte Reload
	movq	%r15, %rdi
	movq	%r12, %rsi
	movq	%r14, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r15, %rdi
	movq	%r12, %rsi
	callq	halide_print@PLT
	movb	$0, (%rbx)
	movq	%r15, %rdi
	movq	%r12, %rsi
	movq	%r14, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	jmp	.LBB85_129
.LBB85_99:                              # %if.then.i558
	leaq	.L.str.29.163(%rip), %r14
	movq	-56(%rbp), %r15                 # 8-byte Reload
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	halide_print@PLT
	movb	$0, (%rbx)
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	halide_error@PLT
.LBB85_129:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy4096EED2Ev.exit
	movq	%r12, %rdi
	callq	free@PLT
	movl	-68(%rbp), %r15d                # 4-byte Reload
.LBB85_130:                             # %if.end277
	movl	%r15d, %eax
	addq	$72, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end85:
	.size	halide_default_trace, .Lfunc_end85-halide_default_trace
	.section	.rodata.halide_default_trace,"a",@progbits
	.p2align	2
.LJTI85_0:
	.long	.LBB85_78-.LJTI85_0
	.long	.LBB85_70-.LJTI85_0
	.long	.LBB85_61-.LJTI85_0
	.long	.LBB85_60-.LJTI85_0
.LJTI85_1:
	.long	.LBB85_100-.LJTI85_1
	.long	.LBB85_108-.LJTI85_1
	.long	.LBB85_116-.LJTI85_1
	.long	.LBB85_125-.LJTI85_1
                                        # -- End function
	.section	.text.halide_get_trace_file,"ax",@progbits
	.weak	halide_get_trace_file           # -- Begin function halide_get_trace_file
	.p2align	4, 0x90
	.type	halide_get_trace_file,@function
halide_get_trace_file:                  # @halide_get_trace_file
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	movq	%rdi, %r14
	movq	_ZN6Halide7Runtime8Internal22halide_trace_file_lockE@GOTPCREL(%rip), %rbx
	.p2align	4, 0x90
.LBB86_1:                               # %while.cond.i
                                        # =>This Inner Loop Header: Depth=1
	movb	$1, %al
	xchgb	%al, (%rbx)
	testb	%al, %al
	jne	.LBB86_1
# %bb.2:                                # %_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVc.exit
	movq	_ZN6Halide7Runtime8Internal17halide_trace_fileE@GOTPCREL(%rip), %r12
	cmpl	$0, (%r12)
	js	.LBB86_3
.LBB86_9:                               # %if.end11
	movl	(%r12), %eax
	movb	$0, (%rbx)
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB86_3:                               # %if.then
	leaq	.L.str.28(%rip), %rdi
	callq	getenv@PLT
	testq	%rax, %rax
	je	.LBB86_8
# %bb.4:                                # %if.then1
	leaq	.L.str.29(%rip), %rsi
	movq	%rax, %rdi
	callq	fopen@PLT
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.LBB86_6
# %bb.5:                                # %if.then4
	leaq	.L.str.30(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_print@PLT
	callq	abort@PLT
.LBB86_6:                               # %do.end
	movq	%r15, %rdi
	callq	fileno@PLT
	movl	%eax, %edi
	callq	halide_set_trace_file@PLT
	movq	_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE@GOTPCREL(%rip), %rax
	movq	%r15, (%rax)
	movq	_ZN6Halide7Runtime8Internal19halide_trace_bufferE@GOTPCREL(%rip), %r14
	cmpq	$0, (%r14)
	jne	.LBB86_9
# %bb.7:                                # %if.then7
	movl	$1048588, %edi                  # imm = 0x10000C
	callq	malloc@PLT
	movq	%rax, (%r14)
	movq	$0, 4(%rax)
	movl	$0, (%rax)
	jmp	.LBB86_9
.LBB86_8:                               # %if.else
	xorl	%edi, %edi
	callq	halide_set_trace_file@PLT
	jmp	.LBB86_9
.Lfunc_end86:
	.size	halide_get_trace_file, .Lfunc_end86-halide_get_trace_file
                                        # -- End function
	.section	.text.halide_set_trace_file,"ax",@progbits
	.weak	halide_set_trace_file           # -- Begin function halide_set_trace_file
	.p2align	4, 0x90
	.type	halide_set_trace_file,@function
halide_set_trace_file:                  # @halide_set_trace_file
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal17halide_trace_fileE@GOTPCREL(%rip), %rax
	movl	%edi, (%rax)
	popq	%rbp
	retq
.Lfunc_end87:
	.size	halide_set_trace_file, .Lfunc_end87-halide_set_trace_file
                                        # -- End function
	.section	.text.halide_trace_cleanup,"ax",@progbits
	.weak	halide_trace_cleanup            # -- Begin function halide_trace_cleanup
	.p2align	4, 0x90
	.type	halide_trace_cleanup,@function
halide_trace_cleanup:                   # @halide_trace_cleanup
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	popq	%rbp
	jmp	halide_shutdown_trace@PLT       # TAILCALL
.Lfunc_end88:
	.size	halide_trace_cleanup, .Lfunc_end88-halide_trace_cleanup
                                        # -- End function
	.section	.text.halide_shutdown_trace,"ax",@progbits
	.weak	halide_shutdown_trace           # -- Begin function halide_shutdown_trace
	.p2align	4, 0x90
	.type	halide_shutdown_trace,@function
halide_shutdown_trace:                  # @halide_shutdown_trace
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	movq	_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE@GOTPCREL(%rip), %r14
	movq	(%r14), %rdi
	testq	%rdi, %rdi
	je	.LBB89_1
# %bb.2:                                # %if.then
	callq	fclose@PLT
	movl	%eax, %ebx
	movq	_ZN6Halide7Runtime8Internal17halide_trace_fileE@GOTPCREL(%rip), %rax
	movl	$0, (%rax)
	movq	_ZN6Halide7Runtime8Internal29halide_trace_file_initializedE@GOTPCREL(%rip), %rax
	movb	$0, (%rax)
	movq	$0, (%r14)
	movq	_ZN6Halide7Runtime8Internal19halide_trace_bufferE@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	testq	%rdi, %rdi
	je	.LBB89_4
# %bb.3:                                # %if.then2
	callq	free@PLT
	jmp	.LBB89_4
.LBB89_1:
	xorl	%ebx, %ebx
.LBB89_4:                               # %return
	movl	%ebx, %eax
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end89:
	.size	halide_shutdown_trace, .Lfunc_end89-halide_shutdown_trace
                                        # -- End function
	.section	.text.halide_set_custom_trace,"ax",@progbits
	.weak	halide_set_custom_trace         # -- Begin function halide_set_custom_trace
	.p2align	4, 0x90
	.type	halide_set_custom_trace,@function
halide_set_custom_trace:                # @halide_set_custom_trace
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal19halide_custom_traceE@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rax
	movq	%rdi, (%rcx)
	popq	%rbp
	retq
.Lfunc_end90:
	.size	halide_set_custom_trace, .Lfunc_end90-halide_set_custom_trace
                                        # -- End function
	.section	.text.halide_trace,"ax",@progbits
	.weak	halide_trace                    # -- Begin function halide_trace
	.p2align	4, 0x90
	.type	halide_trace,@function
halide_trace:                           # @halide_trace
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal19halide_custom_traceE@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.Lfunc_end91:
	.size	halide_trace, .Lfunc_end91-halide_trace
                                        # -- End function
	.section	.text.halide_trace_helper,"ax",@progbits
	.weak	halide_trace_helper             # -- Begin function halide_trace_helper
	.p2align	4, 0x90
	.type	halide_trace_helper,@function
halide_trace_helper:                    # @halide_trace_helper
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$56, %rsp
	movl	%r9d, %ebx
	movq	%rcx, %r14
	movq	%rdx, %r12
	movq	%rdi, %r15
	movslq	48(%rbp), %r13
	movl	40(%rbp), %r9d
	movl	32(%rbp), %ecx
	movl	24(%rbp), %edx
	movl	16(%rbp), %eax
	movq	56(%rbp), %rdi
	movq	%rsi, -96(%rbp)
	movq	%r12, -88(%rbp)
	movq	%r14, -80(%rbp)
	movq	%rdi, -72(%rbp)
	movb	%r8b, -64(%rbp)
	movb	%bl, -63(%rbp)
	movw	%ax, -62(%rbp)
	movl	%edx, -60(%rbp)
	movl	%ecx, -56(%rbp)
	movl	%r9d, -52(%rbp)
	movl	%r13d, -48(%rbp)
	leaq	-96(%rbp), %rsi
	movl	$56, %edx
	movq	%r15, %rdi
	callq	halide_msan_annotate_memory_is_initialized@PLT
	leal	7(%rbx), %eax
	addl	$14, %ebx
	testl	%eax, %eax
	cmovnsl	%eax, %ebx
	sarl	$3, %ebx
	imull	16(%rbp), %ebx
	movslq	%ebx, %rdx
	movq	%r15, %rdi
	movq	%r12, %rsi
	callq	halide_msan_annotate_memory_is_initialized@PLT
	shlq	$2, %r13
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%r13, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r15, %rdi
	leaq	-96(%rbp), %rsi
	callq	halide_trace@PLT
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end92:
	.size	halide_trace_helper, .Lfunc_end92-halide_trace_helper
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal9ends_withEPKcS3_,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal9ends_withEPKcS3_ # -- Begin function _ZN6Halide7Runtime8Internal9ends_withEPKcS3_
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal9ends_withEPKcS3_,@function
_ZN6Halide7Runtime8Internal9ends_withEPKcS3_: # @_ZN6Halide7Runtime8Internal9ends_withEPKcS3_
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	$-2, %rax
	.p2align	4, 0x90
.LBB93_1:                               # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpb	$0, 2(%rdi,%rax)
	leaq	1(%rax), %rax
	jne	.LBB93_1
# %bb.2:                                # %while.cond1.preheader
	movq	$-2, %rcx
	.p2align	4, 0x90
.LBB93_3:                               # %while.cond1
                                        # =>This Inner Loop Header: Depth=1
	cmpb	$0, 2(%rsi,%rcx)
	leaq	1(%rcx), %rcx
	jne	.LBB93_3
# %bb.4:                                # %while.cond6.preheader
	xorl	%r8d, %r8d
	cmpq	$-1, %rax
	je	.LBB93_5
# %bb.7:                                # %while.cond6.preheader
	movl	$0, %edx
	cmpq	$-1, %rcx
	je	.LBB93_6
	.p2align	4, 0x90
.LBB93_8:                               # %if.end
                                        # =>This Inner Loop Header: Depth=1
	movzbl	(%rdi,%rax), %edx
	movzbl	(%rsi,%rcx), %r8d
	testq	%rax, %rax
	je	.LBB93_6
# %bb.9:                                # %if.end
                                        #   in Loop: Header=BB93_8 Depth=1
	testq	%rcx, %rcx
	je	.LBB93_6
# %bb.10:                               # %if.end.while.body8_crit_edge
                                        #   in Loop: Header=BB93_8 Depth=1
	decq	%rax
	decq	%rcx
	cmpb	%r8b, %dl
	je	.LBB93_8
# %bb.11:
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	popq	%rbp
	retq
.LBB93_5:
	xorl	%edx, %edx
.LBB93_6:                               # %while.end13
	cmpb	%r8b, %dl
	sete	%al
                                        # kill: def $al killed $al killed $eax
	popq	%rbp
	retq
.Lfunc_end93:
	.size	_ZN6Halide7Runtime8Internal9ends_withEPKcS3_, .Lfunc_end93-_ZN6Halide7Runtime8Internal9ends_withEPKcS3_
                                        # -- End function
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	5                               # -- Begin function halide_debug_to_file
.LCPI94_0:
	.long	327962                          # 0x5011a
	.long	1                               # 0x1
	.long	194                             # 0xc2
	.long	327963                          # 0x5011b
	.long	1                               # 0x1
	.long	202                             # 0xca
	.long	196892                          # 0x3011c
	.long	1                               # 0x1
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI94_1:
	.long	0                               # 0x0
	.long	1                               # 0x1
	.long	1                               # 0x1
	.long	1                               # 0x1
	.section	.text.halide_debug_to_file,"ax",@progbits
	.weak	halide_debug_to_file
	.p2align	4, 0x90
	.type	halide_debug_to_file,@function
halide_debug_to_file:                   # @halide_debug_to_file
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$4488, %rsp                     # imm = 0x1188
	movq	%rcx, %r15
	movl	%edx, %r12d
	movq	%rsi, %r14
	movq	%rdi, %r13
	cmpq	$0, 16(%rcx)
	jne	.LBB94_4
# %bb.1:                                # %entry
	cmpq	$0, (%r15)
	jne	.LBB94_4
# %bb.2:                                # %if.then
	leaq	.L.str.34(%rip), %rsi
	jmp	.LBB94_3
.LBB94_4:                               # %if.end
	cmpl	$5, 36(%r15)
	jl	.LBB94_6
# %bb.5:                                # %if.then1
	leaq	.L.str.1.35(%rip), %rsi
.LBB94_3:                               # %return
	movq	%r13, %rdi
	callq	halide_error@PLT
	movl	$-1, %ebx
.LBB94_105:                             # %return
	movl	%ebx, %eax
	addq	$4488, %rsp                     # imm = 0x1188
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB94_6:                               # %if.end2
	movq	%r13, %rdi
	movq	%r15, %rsi
	callq	halide_copy_to_host@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB94_105
# %bb.7:                                # %if.end6
	leaq	.L.str.2.36(%rip), %rsi
	movq	%r14, %rdi
	callq	fopen@PLT
	testq	%rax, %rax
	je	.LBB94_8
# %bb.9:                                # %if.end9
	movl	%r12d, -56(%rbp)                # 4-byte Spill
	movq	%rax, -48(%rbp)                 # 8-byte Spill
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%ymm0, -160(%rbp)
	vmovups	%ymm0, -128(%rbp)
	movslq	36(%r15), %rax
	testq	%rax, %rax
	jle	.LBB94_10
# %bb.18:                               # %for.body.lr.ph
	movq	40(%r15), %rcx
	leal	-1(%rax), %esi
	cmpl	$3, %esi
	movl	$3, %edx
	cmovbl	%esi, %edx
	shlq	$4, %rdx
	addq	$16, %rdx
	movl	$1, %r12d
	leaq	-156(%rbp), %rsi
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB94_19:                              # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vmovups	(%rcx,%rdi), %xmm0
	vmovups	%xmm0, -4(%rsi,%rdi)
	movl	-156(%rbp,%rdi), %ebx
	imulq	%rbx, %r12
	addq	$16, %rdi
	cmpq	%rdi, %rdx
	jne	.LBB94_19
# %bb.11:                               # %for.cond19.preheader
	cmpl	$3, %eax
	jle	.LBB94_12
	jmp	.LBB94_14
.LBB94_8:
	movl	$-2, %ebx
	jmp	.LBB94_105
.LBB94_10:
	movl	$1, %r12d
.LBB94_12:                              # %for.body22.preheader
	leal	-4(%rax), %ecx
	shlq	$4, %rax
	addq	%rbp, %rax
	addq	$-152, %rax
	movabsq	$4294967296, %rdx               # imm = 0x100000000
	.p2align	4, 0x90
.LBB94_13:                              # %for.body22
                                        # =>This Inner Loop Header: Depth=1
	movq	%rdx, -8(%rax)
	movl	$0, (%rax)
	addq	$16, %rax
	incl	%ecx
	jne	.LBB94_13
.LBB94_14:                              # %for.cond.cleanup21
	movzbl	33(%r15), %ebx
	addq	$7, %rbx
	shrq	$3, %rbx
	leaq	.L.str.3.37(%rip), %rsi
	movq	%r14, %rdi
	vzeroupper
	callq	_ZN6Halide7Runtime8Internal9ends_withEPKcS3_@PLT
	testb	%al, %al
	movq	%rbx, -72(%rbp)                 # 8-byte Spill
	jne	.LBB94_16
# %bb.15:                               # %lor.lhs.false
	leaq	.L.str.4.38(%rip), %rsi
	movq	%r14, %rdi
	callq	_ZN6Halide7Runtime8Internal9ends_withEPKcS3_@PLT
	testb	%al, %al
	je	.LBB94_31
.LBB94_16:                              # %if.then36
	movl	-156(%rbp), %ecx
	movl	-140(%rbp), %eax
	movl	-108(%rbp), %r14d
	cmpl	$2, %r14d
	setb	%dl
	movl	-124(%rbp), %esi
	cmpl	$5, %esi
	setl	%bl
	testb	%bl, %dl
	movq	-72(%rbp), %rbx                 # 8-byte Reload
	movl	$1, %r13d
	cmovel	%esi, %r13d
	cmovnel	%esi, %r14d
	movabsq	$34362509641, %rdx              # imm = 0x8002A4949
	movq	%rdx, -4528(%rbp)
	movl	$16777231, -4520(%rbp)          # imm = 0x100000F
	movw	$4, -4516(%rbp)
	movl	$1, -4514(%rbp)
	movl	%ecx, -4510(%rbp)
	movabsq	$4295229697, %rcx               # imm = 0x100040101
	movq	%rcx, -4506(%rbp)
	movl	%eax, -4498(%rbp)
	leal	(,%rbx,8), %ecx
	movabsq	$4295164162, %rdx               # imm = 0x100030102
	movq	%rdx, -4494(%rbp)
	movw	%cx, -4486(%rbp)
	movabsq	$4295164163, %rcx               # imm = 0x100030103
	movq	%rcx, -4482(%rbp)
	movw	$1, -4474(%rbp)
	xorl	%ecx, %ecx
	cmpl	$3, %r14d
	setge	%cl
	incl	%ecx
	movabsq	$4295164166, %rdx               # imm = 0x100030106
	movq	%rdx, -4470(%rbp)
	movw	%cx, -4462(%rbp)
	movl	$262417, -4458(%rbp)            # imm = 0x40111
	movl	%r14d, -4454(%rbp)
	movabsq	$845614636073170, %rcx          # imm = 0x30115000000D2
	movq	%rcx, -4450(%rbp)
	movl	$1, -4442(%rbp)
	movw	%r14w, -4438(%rbp)
	movabsq	$4295229718, %rcx               # imm = 0x100040116
	movq	%rcx, -4434(%rbp)
	imull	%ebx, %r12d
	cmpl	$1, %r14d
	leal	210(,%r14,4), %ecx
	cmovel	%r12d, %ecx
	movl	%eax, -4426(%rbp)
	movl	$262423, -4422(%rbp)            # imm = 0x40117
	movl	%r14d, -4418(%rbp)
	movl	%ecx, -4414(%rbp)
	vmovaps	.LCPI94_0(%rip), %ymm0          # ymm0 = [327962,1,194,327963,1,202,196892,1]
	vmovups	%ymm0, -4410(%rbp)
	movw	$2, -4378(%rbp)
	movabsq	$4295164200, %rax               # imm = 0x100030128
	movq	%rax, -4374(%rbp)
	movw	$1, -4366(%rbp)
	movslq	-56(%rbp), %rax                 # 4-byte Folded Reload
	movq	_ZN6Halide7Runtime8Internal30pixel_type_to_tiff_sample_typeE@GOTPCREL(%rip), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movabsq	$4295164243, %rcx               # imm = 0x100030153
	movq	%rcx, -4362(%rbp)
	movw	%ax, -4354(%rbp)
	movabsq	$4295262437, %rax               # imm = 0x1000480E5
	movq	%rax, -4350(%rbp)
	movl	%r13d, -4342(%rbp)
	vmovaps	.LCPI94_1(%rip), %xmm0          # xmm0 = [0,1,1,1]
	vmovups	%xmm0, -4338(%rbp)
	movl	$1, -4322(%rbp)
	leaq	-4528(%rbp), %rdi
	movl	$210, %esi
	movl	$1, %edx
	movq	-48(%rbp), %r12                 # 8-byte Reload
	movq	%r12, %rcx
	vzeroupper
	callq	fwrite@PLT
	testq	%rax, %rax
	je	.LBB94_17
# %bb.20:                               # %if.end103
	cmpl	$2, %r14d
	jl	.LBB94_30
# %bb.21:                               # %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit672.lr.ph
	leal	210(,%r14,8), %eax
	imull	%ebx, %r13d
	imull	-156(%rbp), %r13d
	movl	%eax, -432(%rbp)
	imull	-140(%rbp), %r13d
	leaq	-432(%rbp), %r12
	movl	%r14d, %ebx
	.p2align	4, 0x90
.LBB94_22:                              # %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit672
                                        # =>This Inner Loop Header: Depth=1
	movl	$4, %esi
	movl	$1, %edx
	movq	%r12, %rdi
	movq	-48(%rbp), %rcx                 # 8-byte Reload
	callq	fwrite@PLT
	testq	%rax, %rax
	je	.LBB94_23
# %bb.24:                               # %if.end118
                                        #   in Loop: Header=BB94_22 Depth=1
	addl	%r13d, -432(%rbp)
	decl	%ebx
	jne	.LBB94_22
# %bb.25:                               # %for.end129
	movl	%r13d, -256(%rbp)
	leaq	-256(%rbp), %rbx
	movq	-48(%rbp), %r12                 # 8-byte Reload
.LBB94_27:                              # %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit679
                                        # =>This Inner Loop Header: Depth=1
	movl	$4, %esi
	movl	$1, %edx
	movq	%rbx, %rdi
	movq	%r12, %rcx
	callq	fwrite@PLT
	testq	%rax, %rax
	je	.LBB94_28
# %bb.26:                               # %for.cond138
                                        #   in Loop: Header=BB94_27 Depth=1
	decl	%r14d
	jne	.LBB94_27
# %bb.29:                               # %cleanup151
	movq	-72(%rbp), %rbx                 # 8-byte Reload
.LBB94_30:                              # %cleanup154.thread
	xorl	%ecx, %ecx
	jmp	.LBB94_71
.LBB94_17:
	movl	$-3, %ebx
	jmp	.LBB94_104
.LBB94_31:                              # %if.else164
	leaq	.L.str.5.39(%rip), %rsi
	movq	%r14, %rdi
	callq	_ZN6Halide7Runtime8Internal9ends_withEPKcS3_@PLT
	testb	%al, %al
	je	.LBB94_68
# %bb.32:                               # %while.cond.preheader
	leaq	-2(%r14), %rax
	movq	$-1, %rcx
	.p2align	4, 0x90
.LBB94_33:                              # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	incq	%rax
	cmpb	$0, 1(%r14,%rcx)
	leaq	1(%rcx), %rcx
	jne	.LBB94_33
# %bb.34:                               # %while.body171.preheader
	negq	%rcx
	.p2align	4, 0x90
.LBB94_35:                              # %while.body171
                                        # =>This Inner Loop Header: Depth=1
	incq	%rcx
	cmpb	$46, (%rax)
	leaq	-1(%rax), %rax
	jne	.LBB94_35
# %bb.36:                               # %while.cond174.preheader
	leaq	-1(%rcx), %rdx
	xorl	%esi, %esi
.LBB94_37:                              # %while.cond174
                                        # =>This Inner Loop Header: Depth=1
	testq	%rcx, %rcx
	je	.LBB94_38
# %bb.39:                               # %land.rhs176
                                        #   in Loop: Header=BB94_37 Depth=1
	leaq	-1(%rsi), %r14
	incq	%rcx
	cmpb	$47, (%rax,%rsi)
	movq	%r14, %rsi
	jne	.LBB94_37
	jmp	.LBB94_40
.LBB94_68:                              # %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit728
	movl	-156(%rbp), %eax
	movl	-140(%rbp), %ecx
	movl	%eax, -4528(%rbp)
	movl	%ecx, -4524(%rbp)
	movl	-124(%rbp), %eax
	movl	%eax, -4520(%rbp)
	movl	-108(%rbp), %eax
	movl	%eax, -4516(%rbp)
	movl	-56(%rbp), %eax                 # 4-byte Reload
	movl	%eax, -4512(%rbp)
	leaq	-4528(%rbp), %rdi
	movl	$20, %esi
	movl	$1, %edx
	movq	-48(%rbp), %r12                 # 8-byte Reload
	movq	%r12, %rcx
	callq	fwrite@PLT
	xorl	%ecx, %ecx
	testq	%rax, %rax
	je	.LBB94_69
.LBB94_71:                              # %if.end311
	movq	%rcx, -80(%rbp)                 # 8-byte Spill
	movl	$4096, %eax                     # imm = 0x1000
	xorl	%edx, %edx
	divl	%ebx
	xorl	%r14d, %r14d
	movl	-108(%rbp), %r8d
	testl	%r8d, %r8d
	jle	.LBB94_98
# %bb.72:                               # %for.body322.lr.ph
	movl	-112(%rbp), %esi
	movl	%eax, %ecx
	imull	%ebx, %ecx
	movq	%rcx, -288(%rbp)                # 8-byte Spill
	movl	-128(%rbp), %ecx
	movq	%rcx, -168(%rbp)                # 8-byte Spill
	movl	-124(%rbp), %edi
	movl	-144(%rbp), %ecx
	movq	%rcx, -176(%rbp)                # 8-byte Spill
	movl	-140(%rbp), %ecx
	movq	%rcx, -192(%rbp)                # 8-byte Spill
	movl	-160(%rbp), %ecx
	movl	-156(%rbp), %edx
	movq	%rcx, -280(%rbp)                # 8-byte Spill
	movq	%rdx, -184(%rbp)                # 8-byte Spill
	addl	%edx, %ecx
	movl	%ecx, -88(%rbp)                 # 4-byte Spill
	movl	-108(%rbp), %ecx
	movl	%ecx, -84(%rbp)                 # 4-byte Spill
	movq	%rsi, %rcx
	movq	%rsi, -264(%rbp)                # 8-byte Spill
	movl	%ecx, -60(%rbp)                 # 4-byte Spill
	movl	%eax, -92(%rbp)                 # 4-byte Spill
	movq	%rdi, -272(%rbp)                # 8-byte Spill
.LBB94_73:                              # %for.body322
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB94_75 Depth 2
                                        #       Child Loop BB94_78 Depth 3
                                        #         Child Loop BB94_81 Depth 4
                                        #           Child Loop BB94_87 Depth 5
	testl	%edi, %edi
	jle	.LBB94_94
# %bb.74:                               # %for.body333.preheader
                                        #   in Loop: Header=BB94_73 Depth=1
	movq	-168(%rbp), %rax                # 8-byte Reload
                                        # kill: def $eax killed $eax killed $rax
	movl	%eax, -56(%rbp)                 # 4-byte Spill
	jmp	.LBB94_75
.LBB94_92:                              # %for.inc394
                                        #   in Loop: Header=BB94_75 Depth=2
	movl	-56(%rbp), %ecx                 # 4-byte Reload
	incl	%ecx
	movq	-168(%rbp), %rax                # 8-byte Reload
	movq	-272(%rbp), %rdi                # 8-byte Reload
	addl	%edi, %eax
	movl	%ecx, -56(%rbp)                 # 4-byte Spill
	cmpl	%eax, %ecx
	jge	.LBB94_93
.LBB94_75:                              # %for.body333
                                        #   Parent Loop BB94_73 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB94_78 Depth 3
                                        #         Child Loop BB94_81 Depth 4
                                        #           Child Loop BB94_87 Depth 5
	cmpl	$0, -192(%rbp)                  # 4-byte Folded Reload
	jle	.LBB94_92
# %bb.76:                               # %for.body344.preheader
                                        #   in Loop: Header=BB94_75 Depth=2
	cmpl	$0, -184(%rbp)                  # 4-byte Folded Reload
	jle	.LBB94_92
# %bb.77:                               # %for.body344.preheader1
                                        #   in Loop: Header=BB94_75 Depth=2
	movq	-176(%rbp), %rax                # 8-byte Reload
	movl	%eax, %r13d
	movl	%r14d, %r10d
	jmp	.LBB94_78
.LBB94_79:                              #   in Loop: Header=BB94_78 Depth=3
	movl	%r10d, %r14d
.LBB94_91:                              # %for.inc389
                                        #   in Loop: Header=BB94_78 Depth=3
	incl	%r13d
	movq	-176(%rbp), %rax                # 8-byte Reload
	movq	-192(%rbp), %rcx                # 8-byte Reload
	addl	%ecx, %eax
	movl	%r14d, %r10d
	cmpl	%eax, %r13d
	movq	-48(%rbp), %r12                 # 8-byte Reload
	jge	.LBB94_92
.LBB94_78:                              # %for.body344
                                        #   Parent Loop BB94_73 Depth=1
                                        #     Parent Loop BB94_75 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB94_81 Depth 4
                                        #           Child Loop BB94_87 Depth 5
	cmpl	$0, -184(%rbp)                  # 4-byte Folded Reload
	jle	.LBB94_79
# %bb.80:                               # %for.body355.preheader
                                        #   in Loop: Header=BB94_78 Depth=3
	movq	-280(%rbp), %rax                # 8-byte Reload
	movl	%eax, %r12d
	jmp	.LBB94_81
	.p2align	4, 0x90
.LBB94_90:                              # %for.inc384
                                        #   in Loop: Header=BB94_81 Depth=4
	incl	%r12d
	movl	%r14d, %r10d
	cmpl	-88(%rbp), %r12d                # 4-byte Folded Reload
	jge	.LBB94_91
.LBB94_81:                              # %for.body355
                                        #   Parent Loop BB94_73 Depth=1
                                        #     Parent Loop BB94_75 Depth=2
                                        #       Parent Loop BB94_78 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB94_87 Depth 5
	leal	1(%r10), %r14d
	movl	%r12d, -432(%rbp)
	movl	%r13d, -428(%rbp)
	movl	-56(%rbp), %eax                 # 4-byte Reload
	movl	%eax, -424(%rbp)
	movl	-60(%rbp), %eax                 # 4-byte Reload
	movl	%eax, -420(%rbp)
	movl	36(%r15), %r11d
	testl	%r11d, %r11d
	jle	.LBB94_82
# %bb.83:                               # %for.body.lr.ph.i
                                        #   in Loop: Header=BB94_81 Depth=4
	movq	40(%r15), %rsi
	movslq	8(%rsi), %r8
	movslq	(%rsi), %rdx
	movslq	%r12d, %rdi
	subq	%rdx, %rdi
	imulq	%r8, %rdi
	cmpl	$1, %r11d
	jne	.LBB94_85
# %bb.84:                               #   in Loop: Header=BB94_81 Depth=4
	movq	%rdi, %rdx
	jmp	.LBB94_88
	.p2align	4, 0x90
.LBB94_82:                              #   in Loop: Header=BB94_81 Depth=4
	xorl	%edx, %edx
	jmp	.LBB94_88
	.p2align	4, 0x90
.LBB94_85:                              # %for.body.i.for.body.i_crit_edge.preheader
                                        #   in Loop: Header=BB94_81 Depth=4
	movslq	24(%rsi), %r8
	movslq	16(%rsi), %r9
	movslq	%r13d, %rdx
	subq	%r9, %rdx
	imulq	%r8, %rdx
	addq	%rdi, %rdx
	cmpl	$2, %r11d
	je	.LBB94_88
# %bb.86:                               # %for.body.i.for.body.i_crit_edge.for.body.i.for.body.i_crit_edge_crit_edge.preheader
                                        #   in Loop: Header=BB94_81 Depth=4
	addq	$40, %rsi
	movl	$2, %edi
	.p2align	4, 0x90
.LBB94_87:                              # %for.body.i.for.body.i_crit_edge.for.body.i.for.body.i_crit_edge_crit_edge
                                        #   Parent Loop BB94_73 Depth=1
                                        #     Parent Loop BB94_75 Depth=2
                                        #       Parent Loop BB94_78 Depth=3
                                        #         Parent Loop BB94_81 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	movslq	-432(%rbp,%rdi,4), %rax
	movslq	(%rsi), %rbx
	movslq	-8(%rsi), %rcx
	subq	%rcx, %rax
	imulq	%rbx, %rax
	addq	%rax, %rdx
	incq	%rdi
	addq	$16, %rsi
	cmpq	%rdi, %r11
	jne	.LBB94_87
	.p2align	4, 0x90
.LBB94_88:                              # %_ZNK15halide_buffer_t10address_ofEPKi.exit
                                        #   in Loop: Header=BB94_81 Depth=4
	movzbl	33(%r15), %esi
	addq	$7, %rsi
	shrq	$3, %rsi
	imulq	%rdx, %rsi
	addq	16(%r15), %rsi
	movq	-72(%rbp), %rbx                 # 8-byte Reload
	imull	%ebx, %r10d
	movslq	%r10d, %rax
	leaq	(%rax,%rbp), %rdi
	addq	$-4528, %rdi                    # imm = 0xEE50
	movq	%rbx, %rdx
	callq	memcpy@PLT
	cmpl	-92(%rbp), %r14d                # 4-byte Folded Reload
	jne	.LBB94_90
# %bb.89:                               # %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit746
                                        #   in Loop: Header=BB94_81 Depth=4
	movl	$1, %edx
	leaq	-4528(%rbp), %rdi
	movq	-288(%rbp), %rsi                # 8-byte Reload
	movq	-48(%rbp), %rcx                 # 8-byte Reload
	callq	fwrite@PLT
	xorl	%r14d, %r14d
	testq	%rax, %rax
	jne	.LBB94_90
	jmp	.LBB94_102
.LBB94_93:                              #   in Loop: Header=BB94_73 Depth=1
	movl	-84(%rbp), %eax                 # 4-byte Reload
	movl	%eax, %r8d
.LBB94_94:                              # %for.inc399
                                        #   in Loop: Header=BB94_73 Depth=1
	movl	-60(%rbp), %edx                 # 4-byte Reload
	incl	%edx
	movq	-264(%rbp), %rax                # 8-byte Reload
	leal	(%r8,%rax), %ecx
	movl	%edx, -60(%rbp)                 # 4-byte Spill
	cmpl	%ecx, %edx
	jl	.LBB94_73
# %bb.95:                               # %for.end403
	testl	%r14d, %r14d
	jle	.LBB94_98
# %bb.96:                               # %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit753
	imull	%ebx, %r14d
	movslq	%r14d, %rsi
	leaq	-4528(%rbp), %rdi
	movl	$1, %edx
	movq	%r12, %rcx
	callq	fwrite@PLT
	testq	%rax, %rax
	je	.LBB94_97
.LBB94_98:                              # %if.end412
	movq	$0, -432(%rbp)
	movq	-80(%rbp), %rax                 # 8-byte Reload
	testl	%eax, %eax
	je	.LBB94_101
# %bb.99:                               # %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit760
	movl	%eax, %esi
	leaq	-432(%rbp), %rdi
	movl	$1, %edx
	movq	%r12, %rcx
	callq	fwrite@PLT
	testq	%rax, %rax
	je	.LBB94_100
.LBB94_101:                             # %if.end423
	xorl	%ebx, %ebx
	jmp	.LBB94_104
.LBB94_102:                             # %cleanup425.loopexit
	movl	$-13, %ebx
	jmp	.LBB94_103
.LBB94_23:
	movl	$-4, %ebx
	jmp	.LBB94_103
.LBB94_38:
	movq	%rdx, %r14
.LBB94_40:                              # %while.end183
	leaq	-4528(%rbp), %rcx
	movq	%rcx, %rdx
	cmpq	$-1, %r14
	je	.LBB94_44
# %bb.41:                               # %while.body187.preheader
	leaq	-4528(%rbp), %rdx
	movq	%r14, %rsi
.LBB94_42:                              # %while.body187
                                        # =>This Inner Loop Header: Depth=1
	movzbl	2(%rax,%rsi), %ebx
	incq	%rsi
	movb	%bl, (%rdx)
	incq	%rdx
	cmpq	$-1, %rsi
	jne	.LBB94_42
# %bb.43:                               # %while.cond191.preheader
	leaq	-4272(%rbp), %rax
	cmpq	%rax, %rdx
	jae	.LBB94_46
.LBB94_44:                              # %while.body194.preheader
	subq	%rdx, %rcx
	addq	$256, %rcx                      # imm = 0x100
	xorl	%eax, %eax
.LBB94_45:                              # %while.body194
                                        # =>This Inner Loop Header: Depth=1
	movb	$0, (%rdx,%rax)
	incq	%rax
	cmpq	%rax, %rcx
	jne	.LBB94_45
.LBB94_46:                              # %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit686
	vmovups	.L__const.halide_debug_to_file.header+96(%rip), %ymm0
	vmovups	%ymm0, -336(%rbp)
	vmovups	.L__const.halide_debug_to_file.header+64(%rip), %ymm0
	vmovups	%ymm0, -368(%rbp)
	vmovups	.L__const.halide_debug_to_file.header+32(%rip), %ymm0
	vmovups	%ymm0, -400(%rbp)
	vmovups	.L__const.halide_debug_to_file.header(%rip), %ymm0
	vmovups	%ymm0, -432(%rbp)
	movb	$0, -304(%rbp)
	leaq	-432(%rbp), %rdi
	movl	$1, %r12d
	movl	$128, %esi
	movl	$1, %edx
	movq	-48(%rbp), %rcx                 # 8-byte Reload
	vzeroupper
	callq	fwrite@PLT
	movl	36(%r15), %r8d
	testl	%r8d, %r8d
	jle	.LBB94_56
# %bb.47:                               # %for.body.lr.ph.i.i
	movq	40(%r15), %rcx
	movq	%r8, %rdx
	shlq	$4, %rdx
	xorl	%esi, %esi
	xorl	%r12d, %r12d
	jmp	.LBB94_48
.LBB94_50:                              # %if.end.i.i
                                        #   in Loop: Header=BB94_48 Depth=1
	addq	$16, %rsi
	cmpq	%rsi, %rdx
	je	.LBB94_51
.LBB94_48:                              # %for.body.i.i
                                        # =>This Inner Loop Header: Depth=1
	movl	8(%rcx,%rsi), %edi
	testl	%edi, %edi
	jle	.LBB94_50
# %bb.49:                               # %if.then.i.i
                                        #   in Loop: Header=BB94_48 Depth=1
	movslq	4(%rcx,%rsi), %rax
	decq	%rax
	imulq	%rdi, %rax
	addq	%rax, %r12
	jmp	.LBB94_50
.LBB94_51:                              # %for.body.i12.i.preheader
	xorl	%esi, %esi
	xorl	%edi, %edi
	jmp	.LBB94_52
.LBB94_54:                              # %if.end.i22.i
                                        #   in Loop: Header=BB94_52 Depth=1
	addq	$16, %rsi
	cmpq	%rsi, %rdx
	je	.LBB94_55
.LBB94_52:                              # %for.body.i12.i
                                        # =>This Inner Loop Header: Depth=1
	movslq	8(%rcx,%rsi), %rax
	testq	%rax, %rax
	jns	.LBB94_54
# %bb.53:                               # %if.then.i18.i
                                        #   in Loop: Header=BB94_52 Depth=1
	movslq	4(%rcx,%rsi), %rbx
	decq	%rbx
	imulq	%rax, %rbx
	addq	%rbx, %rdi
	jmp	.LBB94_54
.LBB94_55:                              # %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit
	subq	%rdi, %r12
	incq	%r12
.LBB94_56:                              # %_ZNK15halide_buffer_t13size_in_bytesEv.exit
	movzbl	33(%r15), %ebx
	addq	$7, %rbx
	shrq	$3, %rbx
	imulq	%r12, %rbx
	movl	%ebx, %edx
	negl	%edx
	andl	$7, %edx
	leaq	(%rdx,%rbx), %rax
	shrq	$32, %rax
	jne	.LBB94_57
# %bb.58:                               # %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit693
	movl	$6, %r12d
	subl	%r14d, %r12d
	andl	$-8, %r12d
	cmpl	$3, %r8d
	movl	$2, %eax
	cmovgel	%r8d, %eax
	movl	$14, -256(%rbp)
	leal	4(,%rax,4), %r13d
                                        # kill: def $eax killed $eax killed $rax
	shll	$2, %eax
	andl	$-8, %r13d
	leal	(%r12,%r13), %ecx
	addl	%ebx, %ecx
	movq	%rdx, -80(%rbp)                 # 8-byte Spill
	addl	%edx, %ecx
	addl	$40, %ecx
	movl	%ecx, -252(%rbp)
	movabsq	$34359738374, %rcx              # imm = 0x800000006
	movq	%rcx, -248(%rbp)
	movslq	-56(%rbp), %rdx                 # 4-byte Folded Reload
	movq	_ZN6Halide7Runtime8Internal31pixel_type_to_matlab_class_codeE@GOTPCREL(%rip), %rcx
	movq	%rdx, -56(%rbp)                 # 8-byte Spill
	movzbl	(%rcx,%rdx), %ecx
	movl	%ecx, -240(%rbp)
	movabsq	$21474836481, %rcx              # imm = 0x500000001
	movq	%rcx, -236(%rbp)
	movl	%eax, -228(%rbp)
	leaq	-256(%rbp), %rdi
	movl	$32, %esi
	movl	$1, %edx
	movq	-48(%rbp), %rcx                 # 8-byte Reload
	callq	fwrite@PLT
	testq	%rax, %rax
	je	.LBB94_59
# %bb.60:                               # %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit700
	movl	-156(%rbp), %eax
	movl	-140(%rbp), %ecx
	movl	%eax, -224(%rbp)
	movl	%ecx, -220(%rbp)
	movl	-124(%rbp), %eax
	movl	%eax, -216(%rbp)
	movl	-108(%rbp), %eax
	movl	%eax, -212(%rbp)
	movslq	%r13d, %rsi
	leaq	-224(%rbp), %rdi
	movl	$1, %edx
	movq	-48(%rbp), %r13                 # 8-byte Reload
	movq	%r13, %rcx
	callq	fwrite@PLT
	testq	%rax, %rax
	je	.LBB94_61
# %bb.62:                               # %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit707
	notl	%r14d
	movl	$1, -208(%rbp)
	movl	%r14d, -204(%rbp)
	leaq	-208(%rbp), %rdi
	movl	$8, %esi
	movl	$1, %edx
	movq	%r13, %rcx
	callq	fwrite@PLT
	testq	%rax, %rax
	je	.LBB94_63
# %bb.64:                               # %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit714
	movl	%r12d, %esi
	leaq	-4528(%rbp), %rdi
	movl	$1, %edx
	movq	%r13, %rcx
	callq	fwrite@PLT
	testq	%rax, %rax
	movq	%r13, %r12
	je	.LBB94_65
# %bb.66:                               # %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit721
	movq	_ZN6Halide7Runtime8Internal30pixel_type_to_matlab_type_codeE@GOTPCREL(%rip), %rax
	movq	-56(%rbp), %rcx                 # 8-byte Reload
	movzbl	(%rax,%rcx), %eax
	movl	%eax, -200(%rbp)
	movl	%ebx, -196(%rbp)
	leaq	-200(%rbp), %rdi
	movl	$8, %esi
	movl	$1, %edx
	movq	%r12, %rcx
	callq	fwrite@PLT
	testq	%rax, %rax
	je	.LBB94_67
# %bb.70:                               # %cleanup278
	movq	-72(%rbp), %rbx                 # 8-byte Reload
	movq	-80(%rbp), %rcx                 # 8-byte Reload
	jmp	.LBB94_71
.LBB94_57:                              # %cleanup278.thread
	leaq	.L.str.6.40(%rip), %rsi
	movq	%r13, %rdi
	callq	halide_error@PLT
	movl	$-6, %ebx
	jmp	.LBB94_103
.LBB94_28:                              # %select.unfold
	movl	$-5, %ebx
	jmp	.LBB94_104
.LBB94_69:
	movl	$-12, %ebx
	jmp	.LBB94_104
.LBB94_100:
	movl	$-16, %ebx
	jmp	.LBB94_104
.LBB94_59:                              # %cleanup278.thread789
	movl	$-7, %ebx
.LBB94_103:                             # %cleanup433
	movq	-48(%rbp), %r12                 # 8-byte Reload
.LBB94_104:                             # %cleanup433
	movq	%r12, %rdi
	callq	fclose@PLT
	jmp	.LBB94_105
.LBB94_61:                              # %cleanup278.thread793
	movl	$-8, %ebx
	movq	%r13, %r12
	jmp	.LBB94_104
.LBB94_63:
	movl	$-9, %ebx
	movq	%r13, %r12
	jmp	.LBB94_104
.LBB94_65:
	movl	$-10, %ebx
	jmp	.LBB94_104
.LBB94_67:
	movl	$-11, %ebx
	jmp	.LBB94_104
.LBB94_97:
	movl	$-14, %ebx
	jmp	.LBB94_104
.Lfunc_end94:
	.size	halide_debug_to_file, .Lfunc_end94-halide_debug_to_file
                                        # -- End function
	.section	.text.halide_cache_cleanup,"ax",@progbits
	.weak	halide_cache_cleanup            # -- Begin function halide_cache_cleanup
	.p2align	4, 0x90
	.type	halide_cache_cleanup,@function
halide_cache_cleanup:                   # @halide_cache_cleanup
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	popq	%rbp
	jmp	halide_memoization_cache_cleanup@PLT # TAILCALL
.Lfunc_end95:
	.size	halide_cache_cleanup, .Lfunc_end95-halide_cache_cleanup
                                        # -- End function
	.section	.text.halide_memoization_cache_cleanup,"ax",@progbits
	.weak	halide_memoization_cache_cleanup # -- Begin function halide_memoization_cache_cleanup
	.p2align	4, 0x90
	.type	halide_memoization_cache_cleanup,@function
halide_memoization_cache_cleanup:       # @halide_memoization_cache_cleanup
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	movq	_ZN6Halide7Runtime8Internal13cache_entriesE@GOTPCREL(%rip), %r14
	movl	$2048, %r15d                    # imm = 0x800
	addq	_ZN6Halide7Runtime8Internal13cache_entriesE@GOTPCREL(%rip), %r15
	jmp	.LBB96_1
	.p2align	4, 0x90
.LBB96_3:                               # %while.end
                                        #   in Loop: Header=BB96_1 Depth=1
	addq	$8, %r14
	cmpq	%r15, %r14
	je	.LBB96_4
.LBB96_1:                               # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB96_2 Depth 2
	movq	(%r14), %rbx
	movq	$0, (%r14)
	testq	%rbx, %rbx
	je	.LBB96_3
	.p2align	4, 0x90
.LBB96_2:                               # %while.body
                                        #   Parent Loop BB96_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%rbx), %r12
	movq	%rbx, %rdi
	callq	_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv@PLT
	xorl	%edi, %edi
	movq	%rbx, %rsi
	callq	halide_free@PLT
	movq	%r12, %rbx
	testq	%r12, %r12
	jne	.LBB96_2
	jmp	.LBB96_3
.LBB96_4:                               # %for.cond.cleanup
	movq	_ZN6Halide7Runtime8Internal18current_cache_sizeE@GOTPCREL(%rip), %rax
	movq	$0, (%rax)
	movq	_ZN6Halide7Runtime8Internal18most_recently_usedE@GOTPCREL(%rip), %rax
	movq	$0, (%rax)
	movq	_ZN6Halide7Runtime8Internal19least_recently_usedE@GOTPCREL(%rip), %rax
	movq	$0, (%rax)
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end96:
	.size	halide_memoization_cache_cleanup, .Lfunc_end96-halide_memoization_cache_cleanup
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal10CacheEntry7destroyEv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv # -- Begin function _ZN6Halide7Runtime8Internal10CacheEntry7destroyEv
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv,@function
_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv: # @_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	movq	%rdi, %r14
	cmpl	$0, 56(%rdi)
	je	.LBB97_3
# %bb.1:                                # %for.body.lr.ph
	xorl	%ebx, %ebx
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB97_2:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movq	72(%r14), %rsi
	addq	%rbx, %rsi
	xorl	%edi, %edi
	callq	halide_device_free@PLT
	movq	72(%r14), %rax
	movq	16(%rax,%rbx), %rdi
	callq	_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh@PLT
	xorl	%edi, %edi
	movq	%rax, %rsi
	callq	halide_free@PLT
	incq	%r15
	movl	56(%r14), %eax
	addq	$56, %rbx
	cmpq	%rax, %r15
	jb	.LBB97_2
.LBB97_3:                               # %for.cond.cleanup
	movq	24(%r14), %rsi
	xorl	%edi, %edi
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	halide_free@PLT                 # TAILCALL
.Lfunc_end97:
	.size	_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv, .Lfunc_end97-_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh # -- Begin function _ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh,@function
_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh: # @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	leaq	-64(%rdi), %rax
	popq	%rbp
	retq
.Lfunc_end98:
	.size	_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh, .Lfunc_end98-_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx # -- Begin function _ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx,@function
_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx: # @_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movq	%rcx, %r12
	movq	%rdx, %rbx
	movl	%esi, %r15d
	movq	%rdi, %r14
	testl	%esi, %esi
	js	.LBB99_4
	.p2align	4, 0x90
.LBB99_1:                               # %land.rhs
                                        # =>This Inner Loop Header: Depth=1
	movl	%r15d, %eax
	cmpq	$1, 24(%r14,%rax,8)
	jne	.LBB99_5
# %bb.2:                                # %while.body
                                        #   in Loop: Header=BB99_1 Depth=1
	leal	-1(%r15), %eax
	testl	%r15d, %r15d
	movl	%eax, %r15d
	jg	.LBB99_1
	jmp	.LBB99_3
.LBB99_4:                               # %while.end
	cmpl	$-1, %r15d
	je	.LBB99_3
.LBB99_5:                               # %for.cond.preheader
	movslq	%r15d, %rax
	cmpq	$0, 24(%r14,%rax,8)
	je	.LBB99_8
# %bb.6:                                # %for.body.lr.ph
	decl	%r15d
	xorl	%r13d, %r13d
	movq	%rax, -48(%rbp)                 # 8-byte Spill
	.p2align	4, 0x90
.LBB99_7:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movq	%r14, %rdi
	movl	%r15d, %esi
	movq	%rbx, %rdx
	movq	%r12, %rcx
	callq	_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx@PLT
	movq	-48(%rbp), %rax                 # 8-byte Reload
	addq	152(%r14,%rax,8), %rbx
	addq	280(%r14,%rax,8), %r12
	incq	%r13
	cmpq	24(%r14,%rax,8), %r13
	jb	.LBB99_7
.LBB99_8:                               # %if.end
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB99_3:                               # %if.then
	addq	(%r14), %rbx
	addq	8(%r14), %r12
	movq	408(%r14), %rdx
	movq	%r12, %rdi
	movq	%rbx, %rsi
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	memcpy@PLT                      # TAILCALL
.Lfunc_end99:
	.size	_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx, .Lfunc_end99-_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv # -- Begin function _ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv,@function
_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv: # @_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	(%rdi), %rax
	cmpq	8(%rdi), %rax
	jne	.LBB100_2
# %bb.1:                                # %if.end
	popq	%rbp
	retq
.LBB100_2:                              # %if.then
	movq	16(%rdi), %rdx
	movl	$15, %esi
	xorl	%ecx, %ecx
	popq	%rbp
	jmp	_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx@PLT # TAILCALL
.Lfunc_end100:
	.size	_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv, .Lfunc_end100-_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function _ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b
.LCPI101_0:
	.quad	1                               # 0x1
	.section	.text._ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b,@function
_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b: # @_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$728, %rsp                      # imm = 0x2D8
	movq	%rdi, %r14
	testl	%edx, %edx
	je	.LBB101_2
# %bb.1:                                # %cond.true
	movq	16(%rsi), %rax
	movq	%rax, -760(%rbp)
	testb	%r8b, %r8b
	jne	.LBB101_4
.LBB101_5:                              # %cond.false6
	movq	(%rcx), %rax
	jmp	.LBB101_6
.LBB101_2:                              # %cond.false
	movq	(%rsi), %rax
	movq	%rax, -760(%rbp)
	testb	%r8b, %r8b
	je	.LBB101_5
.LBB101_4:                              # %cond.true4
	movq	16(%rcx), %rax
.LBB101_6:                              # %cond.end8
	movq	%rax, -752(%rbp)
	movzbl	33(%rsi), %r8d
	leaq	7(%r8), %r11
	shrq	$3, %r11
	movq	%r11, -352(%rbp)
	vbroadcastsd	.LCPI101_0(%rip), %ymm0 # ymm0 = [1,1,1,1]
	vmovups	%ymm0, -736(%rbp)
	vxorps	%xmm1, %xmm1, %xmm1
	vmovups	%ymm1, -608(%rbp)
	vmovups	%ymm1, -480(%rbp)
	vmovups	%ymm0, -704(%rbp)
	vmovups	%ymm1, -576(%rbp)
	vmovups	%ymm1, -448(%rbp)
	vmovups	%ymm0, -672(%rbp)
	vmovups	%ymm1, -544(%rbp)
	vmovups	%ymm1, -416(%rbp)
	vmovups	%ymm0, -640(%rbp)
	vmovups	%ymm1, -512(%rbp)
	vmovups	%ymm1, -384(%rbp)
	movl	36(%rsi), %r9d
	testl	%r9d, %r9d
	jle	.LBB101_7
# %bb.12:                               # %for.body19.lr.ph
	movq	40(%rsi), %r12
	movq	40(%rcx), %r10
	movq	%r9, %r15
	shlq	$4, %r15
	xorl	%edi, %edi
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB101_13:                             # %for.body19
                                        # =>This Inner Loop Header: Depth=1
	movslq	8(%r12,%rdi), %r13
	movslq	(%r10,%rdi), %rdx
	movslq	(%r12,%rdi), %rax
	subq	%rax, %rdx
	imulq	%r13, %rdx
	addq	%rdx, %rbx
	addq	$16, %rdi
	cmpq	%rdi, %r15
	jne	.LBB101_13
# %bb.8:                                # %for.cond.cleanup18
	imulq	%r11, %rbx
	movq	%rbx, -744(%rbp)
	cmpl	36(%rcx), %r9d
	je	.LBB101_9
	jmp	.LBB101_11
.LBB101_7:
	xorl	%ebx, %ebx
	imulq	%r11, %rbx
	movq	%rbx, -744(%rbp)
	cmpl	36(%rcx), %r9d
	jne	.LBB101_11
.LBB101_9:                              # %lor.lhs.false
	movzbl	33(%rcx), %eax
	addl	$7, %eax
	shrl	$3, %eax
	cmpl	%eax, %r11d
	jne	.LBB101_11
# %bb.10:                               # %lor.lhs.false
	cmpl	$17, %r9d
	jge	.LBB101_11
# %bb.14:                               # %if.end
	testb	%r8b, %r8b
	je	.LBB101_11
# %bb.15:                               # %for.cond54.preheader
	testl	%r9d, %r9d
	jle	.LBB101_27
# %bb.16:                               # %for.body58.lr.ph
	movq	40(%rcx), %r10
	movq	40(%rsi), %r8
	xorl	%ecx, %ecx
	jmp	.LBB101_17
	.p2align	4, 0x90
.LBB101_33:                             # %for.cond.cleanup94
                                        #   in Loop: Header=BB101_17 Depth=1
	movslq	4(%r10,%r15), %rax
	movq	%rax, -736(%rbp,%r13,8)
	movq	%rbx, -480(%rbp,%r13,8)
	movq	%r12, -608(%rbp,%r13,8)
	incq	%rcx
	cmpq	%r9, %rcx
	je	.LBB101_23
.LBB101_17:                             # %for.body58
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB101_20 Depth 2
                                        #     Child Loop BB101_32 Depth 2
	movq	%rcx, %r15
	shlq	$4, %r15
	movslq	8(%r10,%r15), %rbx
	imulq	%r11, %rbx
	movl	$0, %edi
	testq	%rcx, %rcx
	je	.LBB101_30
# %bb.18:                               # %for.body81.lr.ph
                                        #   in Loop: Header=BB101_17 Depth=1
	testq	%rbx, %rbx
	je	.LBB101_29
# %bb.19:                               # %for.body81.preheader
                                        #   in Loop: Header=BB101_17 Depth=1
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB101_20:                             # %for.body81
                                        #   Parent Loop BB101_17 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpq	-480(%rbp,%rdi,8), %rbx
	jb	.LBB101_30
# %bb.21:                               # %for.inc89
                                        #   in Loop: Header=BB101_20 Depth=2
	incq	%rdi
	cmpq	%rdi, %rcx
	jne	.LBB101_20
# %bb.22:                               #   in Loop: Header=BB101_17 Depth=1
	movq	%rcx, %rdi
	jmp	.LBB101_30
	.p2align	4, 0x90
.LBB101_29:                             # %for.body81.us.preheader
                                        #   in Loop: Header=BB101_17 Depth=1
	movl	%ecx, %edi
.LBB101_30:                             # %for.end91
                                        #   in Loop: Header=BB101_17 Depth=1
	movslq	8(%r8,%r15), %r12
	imulq	%r11, %r12
	movl	%edi, %r13d
	cmpq	%r13, %rcx
	jbe	.LBB101_33
# %bb.31:                               # %for.body95.preheader
                                        #   in Loop: Header=BB101_17 Depth=1
	movslq	%r13d, %rax
	movq	%rcx, %rsi
	.p2align	4, 0x90
.LBB101_32:                             # %for.body95
                                        #   Parent Loop BB101_17 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	-744(%rbp,%rsi,8), %rdx
	movq	-616(%rbp,%rsi,8), %rdi
	movq	%rdx, -736(%rbp,%rsi,8)
	movq	-488(%rbp,%rsi,8), %rdx
	movq	%rdx, -480(%rbp,%rsi,8)
	movq	%rdi, -608(%rbp,%rsi,8)
	leaq	-1(%rsi), %rdx
	movq	%rdx, %rsi
	cmpq	%rax, %rdx
	jg	.LBB101_32
	jmp	.LBB101_33
.LBB101_11:                             # %if.then
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%ymm0, 384(%r14)
	vmovups	%ymm0, 352(%r14)
	vmovups	%ymm0, 320(%r14)
	vmovups	%ymm0, 288(%r14)
	vmovups	%ymm0, 256(%r14)
	vmovups	%ymm0, 224(%r14)
	vmovups	%ymm0, 192(%r14)
	vmovups	%ymm0, 160(%r14)
	vmovups	%ymm0, 128(%r14)
	vmovups	%ymm0, 96(%r14)
	vmovups	%ymm0, 64(%r14)
	vmovups	%ymm0, 32(%r14)
	vmovups	%ymm0, (%r14)
.LBB101_28:                             # %while.end
	movq	%r14, %rax
	addq	$728, %rsp                      # imm = 0x2D8
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	vzeroupper
	retq
.LBB101_23:                             # %while.cond.preheader
	movq	-352(%rbp), %rbx
	cmpq	-608(%rbp), %rbx
	jne	.LBB101_27
# %bb.24:                               # %land.rhs.lr.ph
	movq	-480(%rbp), %rax
	movq	-736(%rbp), %rcx
	movq	%rcx, -328(%rbp)                # 8-byte Spill
	movq	-728(%rbp), %rcx
	movq	%rcx, -312(%rbp)                # 8-byte Spill
	movq	-600(%rbp), %rcx
	movq	%rcx, -320(%rbp)                # 8-byte Spill
	movq	-472(%rbp), %rcx
	movq	%rcx, -296(%rbp)                # 8-byte Spill
	movq	-720(%rbp), %rcx
	movq	%rcx, -288(%rbp)                # 8-byte Spill
	movq	-592(%rbp), %rcx
	movq	%rcx, -304(%rbp)                # 8-byte Spill
	movq	-464(%rbp), %rcx
	movq	%rcx, -280(%rbp)                # 8-byte Spill
	movq	-712(%rbp), %rcx
	movq	%rcx, -272(%rbp)                # 8-byte Spill
	movq	-584(%rbp), %rcx
	movq	%rcx, -48(%rbp)                 # 8-byte Spill
	movq	-456(%rbp), %rcx
	movq	%rcx, -264(%rbp)                # 8-byte Spill
	movq	-704(%rbp), %rcx
	movq	%rcx, -256(%rbp)                # 8-byte Spill
	movq	-576(%rbp), %r15
	movq	-448(%rbp), %rdx
	movq	%rdx, -248(%rbp)                # 8-byte Spill
	movq	-696(%rbp), %rdx
	movq	%rdx, -240(%rbp)                # 8-byte Spill
	movq	-568(%rbp), %r11
	movq	-440(%rbp), %rdx
	movq	%rdx, -232(%rbp)                # 8-byte Spill
	movq	-688(%rbp), %rdx
	movq	%rdx, -224(%rbp)                # 8-byte Spill
	movq	-560(%rbp), %r13
	movq	-432(%rbp), %rdx
	movq	%rdx, -216(%rbp)                # 8-byte Spill
	movq	-680(%rbp), %rdx
	movq	%rdx, -208(%rbp)                # 8-byte Spill
	movq	-552(%rbp), %r12
	movq	-424(%rbp), %rdx
	movq	%rdx, -200(%rbp)                # 8-byte Spill
	movq	-672(%rbp), %rdx
	movq	%rdx, -192(%rbp)                # 8-byte Spill
	movq	-544(%rbp), %rsi
	movq	-416(%rbp), %rdx
	movq	%rdx, -184(%rbp)                # 8-byte Spill
	movq	-664(%rbp), %rdx
	movq	%rdx, -176(%rbp)                # 8-byte Spill
	movq	-536(%rbp), %rdi
	movq	-408(%rbp), %rdx
	movq	%rdx, -168(%rbp)                # 8-byte Spill
	movq	-656(%rbp), %rdx
	movq	%rdx, -160(%rbp)                # 8-byte Spill
	movq	-528(%rbp), %r10
	movq	-400(%rbp), %rdx
	movq	%rdx, -144(%rbp)                # 8-byte Spill
	movq	-648(%rbp), %rdx
	movq	%rdx, -136(%rbp)                # 8-byte Spill
	movq	-520(%rbp), %rdx
	movq	%rdx, -152(%rbp)                # 8-byte Spill
	movq	-392(%rbp), %rdx
	movq	%rdx, -120(%rbp)                # 8-byte Spill
	movq	-640(%rbp), %rdx
	movq	%rdx, -112(%rbp)                # 8-byte Spill
	movq	-512(%rbp), %rdx
	movq	%rdx, -128(%rbp)                # 8-byte Spill
	movq	-384(%rbp), %rdx
	movq	%rdx, -96(%rbp)                 # 8-byte Spill
	movq	-632(%rbp), %rdx
	movq	%rdx, -88(%rbp)                 # 8-byte Spill
	movq	-504(%rbp), %rdx
	movq	%rdx, -104(%rbp)                # 8-byte Spill
	movq	-376(%rbp), %rdx
	movq	%rdx, -72(%rbp)                 # 8-byte Spill
	movq	-624(%rbp), %rdx
	movq	%rdx, -64(%rbp)                 # 8-byte Spill
	movq	-496(%rbp), %rdx
	movq	%rdx, -80(%rbp)                 # 8-byte Spill
	movq	-368(%rbp), %rdx
	movq	%rdx, -56(%rbp)                 # 8-byte Spill
	movq	-616(%rbp), %rdx
	movq	%rdx, -344(%rbp)                # 8-byte Spill
	movq	-488(%rbp), %rdx
	movq	-360(%rbp), %rcx
	movq	%rcx, -336(%rbp)                # 8-byte Spill
	.p2align	4, 0x90
.LBB101_25:                             # %land.rhs
                                        # =>This Inner Loop Header: Depth=1
	movq	%rdx, -768(%rbp)                # 8-byte Spill
	movq	%rbx, %rdx
	movq	-312(%rbp), %r9                 # 8-byte Reload
	movq	-296(%rbp), %r8                 # 8-byte Reload
	movq	-288(%rbp), %rbx                # 8-byte Reload
	movq	%rbx, -312(%rbp)                # 8-byte Spill
	movq	-280(%rbp), %rbx                # 8-byte Reload
	movq	%rbx, -296(%rbp)                # 8-byte Spill
	movq	-272(%rbp), %rbx                # 8-byte Reload
	movq	%rbx, -288(%rbp)                # 8-byte Spill
	movq	-264(%rbp), %rbx                # 8-byte Reload
	movq	%rbx, -280(%rbp)                # 8-byte Spill
	movq	-256(%rbp), %rbx                # 8-byte Reload
	movq	%rbx, -272(%rbp)                # 8-byte Spill
	movq	-248(%rbp), %rbx                # 8-byte Reload
	movq	%rbx, -264(%rbp)                # 8-byte Spill
	movq	-240(%rbp), %rbx                # 8-byte Reload
	movq	%rbx, -256(%rbp)                # 8-byte Spill
	movq	-232(%rbp), %rbx                # 8-byte Reload
	movq	%rbx, -248(%rbp)                # 8-byte Spill
	movq	-224(%rbp), %rbx                # 8-byte Reload
	movq	%rbx, -240(%rbp)                # 8-byte Spill
	movq	-216(%rbp), %rbx                # 8-byte Reload
	movq	%rbx, -232(%rbp)                # 8-byte Spill
	movq	-208(%rbp), %rbx                # 8-byte Reload
	movq	%rbx, -224(%rbp)                # 8-byte Spill
	movq	-200(%rbp), %rbx                # 8-byte Reload
	movq	%rbx, -216(%rbp)                # 8-byte Spill
	movq	-192(%rbp), %rbx                # 8-byte Reload
	movq	%rbx, -208(%rbp)                # 8-byte Spill
	movq	-184(%rbp), %rbx                # 8-byte Reload
	movq	%rbx, -200(%rbp)                # 8-byte Spill
	movq	-176(%rbp), %rbx                # 8-byte Reload
	movq	%rbx, -192(%rbp)                # 8-byte Spill
	movq	-168(%rbp), %rbx                # 8-byte Reload
	movq	%rbx, -184(%rbp)                # 8-byte Spill
	movq	-160(%rbp), %rbx                # 8-byte Reload
	movq	%rbx, -176(%rbp)                # 8-byte Spill
	movq	-144(%rbp), %rbx                # 8-byte Reload
	movq	%rbx, -168(%rbp)                # 8-byte Spill
	movq	-136(%rbp), %rbx                # 8-byte Reload
	movq	%rbx, -160(%rbp)                # 8-byte Spill
	movq	-120(%rbp), %rbx                # 8-byte Reload
	movq	%rbx, -144(%rbp)                # 8-byte Spill
	movq	-112(%rbp), %rbx                # 8-byte Reload
	movq	%rbx, -136(%rbp)                # 8-byte Spill
	movq	-96(%rbp), %rbx                 # 8-byte Reload
	movq	%rbx, -120(%rbp)                # 8-byte Spill
	movq	-88(%rbp), %rbx                 # 8-byte Reload
	movq	%rbx, -112(%rbp)                # 8-byte Spill
	movq	-72(%rbp), %rbx                 # 8-byte Reload
	movq	%rbx, -96(%rbp)                 # 8-byte Spill
	movq	-64(%rbp), %rbx                 # 8-byte Reload
	movq	%rbx, -88(%rbp)                 # 8-byte Spill
	movq	-56(%rbp), %rbx                 # 8-byte Reload
	movq	%rbx, -72(%rbp)                 # 8-byte Spill
	movq	-344(%rbp), %rbx                # 8-byte Reload
	movq	%rbx, -64(%rbp)                 # 8-byte Spill
	movq	-336(%rbp), %rbx                # 8-byte Reload
	movq	%rbx, -56(%rbp)                 # 8-byte Spill
	cmpq	%rax, %rdx
	movq	-320(%rbp), %rbx                # 8-byte Reload
	movq	-304(%rbp), %rdx                # 8-byte Reload
	movq	%rdx, -320(%rbp)                # 8-byte Spill
	movq	-48(%rbp), %rdx                 # 8-byte Reload
	movq	%rdx, -304(%rbp)                # 8-byte Spill
	movq	%r15, -48(%rbp)                 # 8-byte Spill
	movq	%r11, %r15
	movq	%r13, %r11
	movq	%r12, %r13
	movq	%rsi, %r12
	movq	%rdi, %rsi
	movq	%r10, %rdi
	movq	-152(%rbp), %r10                # 8-byte Reload
	movq	-128(%rbp), %rdx                # 8-byte Reload
	movq	%rdx, -152(%rbp)                # 8-byte Spill
	movq	-104(%rbp), %rdx                # 8-byte Reload
	movq	%rdx, -128(%rbp)                # 8-byte Spill
	movq	-80(%rbp), %rdx                 # 8-byte Reload
	movq	%rdx, -104(%rbp)                # 8-byte Spill
	movq	-768(%rbp), %rcx                # 8-byte Reload
	movq	%rcx, -80(%rbp)                 # 8-byte Spill
	jne	.LBB101_27
# %bb.26:                               # %while.body
                                        #   in Loop: Header=BB101_25 Depth=1
	imulq	-328(%rbp), %rax                # 8-byte Folded Reload
	movq	%rax, -352(%rbp)
	movq	%r9, -736(%rbp)
	movq	%rbx, -608(%rbp)
	movq	%r8, -480(%rbp)
	movq	-312(%rbp), %rdx                # 8-byte Reload
	movq	%rdx, -728(%rbp)
	movq	-320(%rbp), %rdx                # 8-byte Reload
	movq	%rdx, -600(%rbp)
	movq	-296(%rbp), %rdx                # 8-byte Reload
	movq	%rdx, -472(%rbp)
	movq	-288(%rbp), %rdx                # 8-byte Reload
	movq	%rdx, -720(%rbp)
	movq	-304(%rbp), %rdx                # 8-byte Reload
	movq	%rdx, -592(%rbp)
	movq	-280(%rbp), %rdx                # 8-byte Reload
	movq	%rdx, -464(%rbp)
	movq	-272(%rbp), %rdx                # 8-byte Reload
	movq	%rdx, -712(%rbp)
	movq	-48(%rbp), %rcx                 # 8-byte Reload
	movq	%rcx, -584(%rbp)
	movq	-264(%rbp), %rdx                # 8-byte Reload
	movq	%rdx, -456(%rbp)
	movq	-256(%rbp), %rdx                # 8-byte Reload
	movq	%rdx, -704(%rbp)
	movq	%r15, -576(%rbp)
	movq	-248(%rbp), %rdx                # 8-byte Reload
	movq	%rdx, -448(%rbp)
	movq	-240(%rbp), %rdx                # 8-byte Reload
	movq	%rdx, -696(%rbp)
	movq	%r11, -568(%rbp)
	movq	-232(%rbp), %rdx                # 8-byte Reload
	movq	%rdx, -440(%rbp)
	movq	-224(%rbp), %rdx                # 8-byte Reload
	movq	%rdx, -688(%rbp)
	movq	%r13, -560(%rbp)
	movq	-216(%rbp), %rdx                # 8-byte Reload
	movq	%rdx, -432(%rbp)
	movq	-208(%rbp), %rdx                # 8-byte Reload
	movq	%rdx, -680(%rbp)
	movq	%r12, -552(%rbp)
	movq	-200(%rbp), %rdx                # 8-byte Reload
	movq	%rdx, -424(%rbp)
	movq	-192(%rbp), %rdx                # 8-byte Reload
	movq	%rdx, -672(%rbp)
	movq	%rsi, -544(%rbp)
	movq	-184(%rbp), %rdx                # 8-byte Reload
	movq	%rdx, -416(%rbp)
	movq	-176(%rbp), %rdx                # 8-byte Reload
	movq	%rdx, -664(%rbp)
	movq	%rdi, -536(%rbp)
	movq	-168(%rbp), %rdx                # 8-byte Reload
	movq	%rdx, -408(%rbp)
	movq	-160(%rbp), %rdx                # 8-byte Reload
	movq	%rdx, -656(%rbp)
	movq	%r10, -528(%rbp)
	movq	-144(%rbp), %rdx                # 8-byte Reload
	movq	%rdx, -400(%rbp)
	movq	-136(%rbp), %rdx                # 8-byte Reload
	movq	%rdx, -648(%rbp)
	movq	-152(%rbp), %rdx                # 8-byte Reload
	movq	%rdx, -520(%rbp)
	movq	-120(%rbp), %rdx                # 8-byte Reload
	movq	%rdx, -392(%rbp)
	movq	-112(%rbp), %rdx                # 8-byte Reload
	movq	%rdx, -640(%rbp)
	movq	-128(%rbp), %rdx                # 8-byte Reload
	movq	%rdx, -512(%rbp)
	movq	-96(%rbp), %rdx                 # 8-byte Reload
	movq	%rdx, -384(%rbp)
	movq	-88(%rbp), %rdx                 # 8-byte Reload
	movq	%rdx, -632(%rbp)
	movq	-104(%rbp), %rdx                # 8-byte Reload
	movq	%rdx, -504(%rbp)
	movq	-72(%rbp), %rdx                 # 8-byte Reload
	movq	%rdx, -376(%rbp)
	movq	-64(%rbp), %rdx                 # 8-byte Reload
	movq	%rdx, -624(%rbp)
	movq	-80(%rbp), %rdx                 # 8-byte Reload
	movq	%rdx, -496(%rbp)
	movq	-56(%rbp), %rdx                 # 8-byte Reload
	movq	%rdx, -368(%rbp)
	movq	$1, -616(%rbp)
	movq	$0, -488(%rbp)
	movq	$0, -360(%rbp)
	movl	$1, %edx
	movq	%rdx, -344(%rbp)                # 8-byte Spill
	movl	$0, %ecx
	movq	%rcx, -336(%rbp)                # 8-byte Spill
	movl	$0, %edx
	movq	%r9, -328(%rbp)                 # 8-byte Spill
	cmpq	%rbx, %rax
	movq	%r8, %rax
	je	.LBB101_25
.LBB101_27:                             # %while.end
	leaq	-760(%rbp), %rsi
	movl	$416, %edx                      # imm = 0x1A0
	movq	%r14, %rdi
	vzeroupper
	callq	memcpy@PLT
	jmp	.LBB101_28
.Lfunc_end101:
	.size	_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b, .Lfunc_end101-_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m # -- Begin function _ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m,@function
_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m: # @_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	callq	memcmp@PLT
	testl	%eax, %eax
	sete	%al
	popq	%rbp
	retq
.Lfunc_end102:
	.size	_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m, .Lfunc_end102-_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t # -- Begin function _ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t,@function
_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t: # @_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movl	36(%rdi), %r8d
	movb	$1, %al
	testl	%r8d, %r8d
	jle	.LBB103_8
# %bb.1:                                # %for.body.lr.ph
	movq	40(%rdi), %rdx
	shlq	$4, %r8
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB103_3:                              # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movl	(%rdx,%rdi), %ecx
	cmpl	(%rsi,%rdi), %ecx
	jne	.LBB103_7
# %bb.4:                                # %land.lhs.true.i.i
                                        #   in Loop: Header=BB103_3 Depth=1
	movl	4(%rdx,%rdi), %ecx
	cmpl	4(%rsi,%rdi), %ecx
	jne	.LBB103_7
# %bb.5:                                # %land.lhs.true5.i.i
                                        #   in Loop: Header=BB103_3 Depth=1
	movl	8(%rdx,%rdi), %ecx
	cmpl	8(%rsi,%rdi), %ecx
	jne	.LBB103_7
# %bb.6:                                # %_ZNK18halide_dimension_tneERKS_.exit
                                        #   in Loop: Header=BB103_3 Depth=1
	movl	12(%rdx,%rdi), %ecx
	cmpl	12(%rsi,%rdi), %ecx
	jne	.LBB103_7
# %bb.2:                                # %for.cond
                                        #   in Loop: Header=BB103_3 Depth=1
	addq	$16, %rdi
	cmpq	%rdi, %r8
	jne	.LBB103_3
.LBB103_8:                              # %cleanup
                                        # kill: def $al killed $al killed $eax
	popq	%rbp
	retq
.LBB103_7:
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	popq	%rbp
	retq
.Lfunc_end103:
	.size	_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t, .Lfunc_end103-_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal10CacheEntry4initEPKhmjPK15halide_buffer_tiPPS5_by,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal10CacheEntry4initEPKhmjPK15halide_buffer_tiPPS5_by # -- Begin function _ZN6Halide7Runtime8Internal10CacheEntry4initEPKhmjPK15halide_buffer_tiPPS5_by
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal10CacheEntry4initEPKhmjPK15halide_buffer_tiPPS5_by,@function
_ZN6Halide7Runtime8Internal10CacheEntry4initEPKhmjPK15halide_buffer_tiPPS5_by: # @_ZN6Halide7Runtime8Internal10CacheEntry4initEPKhmjPK15halide_buffer_tiPPS5_by
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movl	%r9d, %r12d
	movq	%r8, %r14
	movq	%rsi, %rbx
	movq	%rdi, %r15
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%xmm0, (%rdi)
	movq	$0, 16(%rdi)
	movq	%rdx, 32(%rdi)
	movl	%ecx, 48(%rdi)
	movl	$0, 52(%rdi)
	movl	%r9d, 56(%rdi)
	movslq	36(%r8), %rax
	movl	%eax, 60(%rdi)
	movl	%r9d, %ecx
	imulq	$56, %rcx, %r13
	incl	%r12d
	imulq	%rax, %r12
	shlq	$4, %r12
	addq	%r13, %r12
	leaq	(%rdx,%r12), %rsi
	xorl	%edi, %edi
	callq	halide_malloc@PLT
	movq	%rax, 24(%r15)
	testq	%rax, %rax
	je	.LBB104_14
# %bb.1:                                # %if.end
	movq	%rax, 72(%r15)
	addq	%rax, %r13
	movq	%r13, 64(%r15)
	addq	%rax, %r12
	movq	%r12, 40(%r15)
	movq	32(%r15), %rcx
	testq	%rcx, %rcx
	je	.LBB104_6
# %bb.2:                                # %for.body.preheader
	movb	(%rbx), %dl
	movb	%dl, (%r12)
	cmpq	$1, %rcx
	je	.LBB104_6
# %bb.3:                                # %for.body.for.body_crit_edge.preheader
	movb	1(%rbx), %cl
	movb	%cl, 1(%r12)
	cmpq	$3, 32(%r15)
	jb	.LBB104_6
# %bb.4:                                # %for.body.for.body_crit_edge.for.body.for.body_crit_edge_crit_edge.preheader
	movl	$2, %ecx
	.p2align	4, 0x90
.LBB104_5:                              # %for.body.for.body_crit_edge.for.body.for.body_crit_edge_crit_edge
                                        # =>This Inner Loop Header: Depth=1
	movq	40(%r15), %rsi
	movzbl	(%rbx,%rcx), %edx
	movb	%dl, (%rsi,%rcx)
	incq	%rcx
	cmpq	32(%r15), %rcx
	jb	.LBB104_5
.LBB104_6:                              # %for.cond23.preheader
	cmpl	$0, 60(%r15)
	jle	.LBB104_9
# %bb.7:                                # %for.body27.lr.ph
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB104_8:                              # %for.body27
                                        # =>This Inner Loop Header: Depth=1
	movq	40(%r14), %rsi
	movq	64(%r15), %rdi
	vmovups	(%rsi,%rcx), %xmm0
	vmovups	%xmm0, (%rdi,%rcx)
	incq	%rdx
	movslq	60(%r15), %rsi
	addq	$16, %rcx
	cmpq	%rsi, %rdx
	jl	.LBB104_8
.LBB104_9:                              # %for.cond36.preheader
	movq	32(%rbp), %r8
	movb	24(%rbp), %r9b
	cmpl	$0, 56(%r15)
	je	.LBB104_13
# %bb.10:                               # %for.body40.preheader
	movq	16(%rbp), %r11
	xorl	%r10d, %r10d
	jmp	.LBB104_11
	.p2align	4, 0x90
.LBB104_12:                             # %for.cond36.loopexit
                                        #   in Loop: Header=BB104_11 Depth=1
	movl	56(%r15), %ecx
	cmpq	%rcx, %r10
	jae	.LBB104_13
.LBB104_11:                             # %for.body40
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB104_17 Depth 2
	movq	%r10, %rdi
	movq	(%r11,%r10,8), %rcx
	movq	72(%r15), %rsi
	imulq	$56, %r10, %r12
	vmovups	(%rcx), %ymm0
	vmovups	24(%rcx), %ymm1
	vmovups	%ymm1, 24(%rsi,%r12)
	vmovups	%ymm0, (%rsi,%r12)
	incq	%r10
	movl	60(%r15), %r14d
	movl	%r10d, %ecx
	imull	%r14d, %ecx
	shlq	$4, %rcx
	addq	64(%r15), %rcx
	movq	72(%r15), %rsi
	movq	%rcx, 40(%rsi,%r12)
	testl	%r14d, %r14d
	jle	.LBB104_12
# %bb.15:                               # %for.body59.preheader
                                        #   in Loop: Header=BB104_11 Depth=1
	movq	(%r11,%rdi,8), %rsi
	movq	40(%rsi), %rsi
	vmovups	(%rsi), %xmm0
	vmovups	%xmm0, (%rcx)
	cmpl	$2, 60(%r15)
	jl	.LBB104_12
# %bb.16:                               # %for.body59.for.body59_crit_edge.preheader
                                        #   in Loop: Header=BB104_11 Depth=1
	movl	$1, %ecx
	movl	$16, %esi
	.p2align	4, 0x90
.LBB104_17:                             # %for.body59.for.body59_crit_edge
                                        #   Parent Loop BB104_11 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	72(%r15), %rbx
	movq	40(%rbx,%r12), %rbx
	movq	(%r11,%rdi,8), %rdx
	movq	40(%rdx), %rdx
	vmovups	(%rdx,%rsi), %xmm0
	vmovups	%xmm0, (%rbx,%rsi)
	incq	%rcx
	movslq	60(%r15), %rdx
	addq	$16, %rsi
	cmpq	%rdx, %rcx
	jl	.LBB104_17
	jmp	.LBB104_12
.LBB104_13:                             # %for.cond.cleanup39
	movb	%r9b, 88(%r15)
	movq	%r8, 80(%r15)
.LBB104_14:                             # %cleanup
	testq	%rax, %rax
	setne	%al
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	vzeroupper
	retq
.Lfunc_end104:
	.size	_ZN6Halide7Runtime8Internal10CacheEntry4initEPKhmjPK15halide_buffer_tiPPS5_by, .Lfunc_end104-_ZN6Halide7Runtime8Internal10CacheEntry4initEPKhmjPK15halide_buffer_tiPPS5_by
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal8djb_hashEPKhm,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal8djb_hashEPKhm # -- Begin function _ZN6Halide7Runtime8Internal8djb_hashEPKhm
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal8djb_hashEPKhm,@function
_ZN6Halide7Runtime8Internal8djb_hashEPKhm: # @_ZN6Halide7Runtime8Internal8djb_hashEPKhm
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$5381, %eax                     # imm = 0x1505
	testq	%rsi, %rsi
	je	.LBB105_3
# %bb.1:                                # %for.body.preheader
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB105_2:                              # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movl	%eax, %edx
	shll	$5, %edx
	addl	%eax, %edx
	movzbl	(%rdi,%rcx), %eax
	addl	%edx, %eax
	incq	%rcx
	cmpq	%rcx, %rsi
	jne	.LBB105_2
.LBB105_3:                              # %for.cond.cleanup
	popq	%rbp
	retq
.Lfunc_end105:
	.size	_ZN6Halide7Runtime8Internal8djb_hashEPKhm, .Lfunc_end105-_ZN6Halide7Runtime8Internal8djb_hashEPKhm
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal11prune_cacheEv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal11prune_cacheEv # -- Begin function _ZN6Halide7Runtime8Internal11prune_cacheEv
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal11prune_cacheEv,@function
_ZN6Halide7Runtime8Internal11prune_cacheEv: # @_ZN6Halide7Runtime8Internal11prune_cacheEv
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movq	_ZN6Halide7Runtime8Internal18current_cache_sizeE@GOTPCREL(%rip), %r15
	movq	(%r15), %rax
	movq	_ZN6Halide7Runtime8Internal14max_cache_sizeE@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	cmpq	%rcx, %rax
	jle	.LBB106_25
# %bb.1:                                # %entry
	movq	_ZN6Halide7Runtime8Internal19least_recently_usedE@GOTPCREL(%rip), %rdx
	movq	(%rdx), %r14
	testq	%r14, %r14
	je	.LBB106_25
	.p2align	4, 0x90
.LBB106_2:                              # %while.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB106_5 Depth 2
                                        #     Child Loop BB106_19 Depth 2
                                        #       Child Loop BB106_27 Depth 3
                                        #       Child Loop BB106_31 Depth 3
	movq	8(%r14), %r12
	cmpl	$0, 52(%r14)
	jne	.LBB106_23
# %bb.3:                                # %if.then
                                        #   in Loop: Header=BB106_2 Depth=1
	movzbl	48(%r14), %ecx
	movq	_ZN6Halide7Runtime8Internal13cache_entriesE@GOTPCREL(%rip), %rax
	movq	(%rax,%rcx,8), %rax
	cmpq	%r14, %rax
	je	.LBB106_4
	.p2align	4, 0x90
.LBB106_5:                              # %while.cond9
                                        #   Parent Loop BB106_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.LBB106_7
# %bb.6:                                # %land.rhs11
                                        #   in Loop: Header=BB106_5 Depth=2
	movq	(%rbx), %rax
	cmpq	%r14, %rax
	jne	.LBB106_5
	jmp	.LBB106_8
.LBB106_4:                              # %if.then6
                                        #   in Loop: Header=BB106_2 Depth=1
	movq	(%r14), %rax
	movq	_ZN6Halide7Runtime8Internal13cache_entriesE@GOTPCREL(%rip), %rdx
	movq	%rax, (%rdx,%rcx,8)
	movq	_ZN6Halide7Runtime8Internal19least_recently_usedE@GOTPCREL(%rip), %rax
	cmpq	%r14, (%rax)
	jne	.LBB106_11
	jmp	.LBB106_10
.LBB106_7:                              # %if.then18
                                        #   in Loop: Header=BB106_2 Depth=1
	xorl	%edi, %edi
	leaq	.L.str.2.42(%rip), %rsi
	callq	halide_print@PLT
	callq	abort@PLT
.LBB106_8:                              # %do.end
                                        #   in Loop: Header=BB106_2 Depth=1
	movq	(%r14), %rax
	movq	%rax, (%rbx)
	movq	_ZN6Halide7Runtime8Internal19least_recently_usedE@GOTPCREL(%rip), %rax
	cmpq	%r14, (%rax)
	jne	.LBB106_11
.LBB106_10:                             # %if.then23
                                        #   in Loop: Header=BB106_2 Depth=1
	movq	_ZN6Halide7Runtime8Internal19least_recently_usedE@GOTPCREL(%rip), %rax
	movq	%r12, (%rax)
.LBB106_11:                             # %if.end24
                                        #   in Loop: Header=BB106_2 Depth=1
	testq	%r12, %r12
	je	.LBB106_13
# %bb.12:                               # %if.then26
                                        #   in Loop: Header=BB106_2 Depth=1
	movq	16(%r14), %rax
	movq	%rax, 16(%r12)
.LBB106_13:                             # %if.end28
                                        #   in Loop: Header=BB106_2 Depth=1
	movq	16(%r14), %rax
	movq	_ZN6Halide7Runtime8Internal18most_recently_usedE@GOTPCREL(%rip), %rcx
	cmpq	%r14, (%rcx)
	je	.LBB106_14
# %bb.15:                               # %if.end32
                                        #   in Loop: Header=BB106_2 Depth=1
	testq	%rax, %rax
	je	.LBB106_17
.LBB106_16:                             # %if.then35
                                        #   in Loop: Header=BB106_2 Depth=1
	movq	%r12, 16(%r14)
.LBB106_17:                             # %if.end37
                                        #   in Loop: Header=BB106_2 Depth=1
	movl	56(%r14), %r8d
	testq	%r8, %r8
	je	.LBB106_22
# %bb.18:                               # %for.body.lr.ph
                                        #   in Loop: Header=BB106_2 Depth=1
	movq	(%r15), %r11
	movq	72(%r14), %r9
	xorl	%r15d, %r15d
	jmp	.LBB106_19
	.p2align	4, 0x90
.LBB106_34:                             # %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit
                                        #   in Loop: Header=BB106_19 Depth=2
	notq	%rdx
	addq	%rdx, %rdi
.LBB106_35:                             # %_ZNK15halide_buffer_t13size_in_bytesEv.exit
                                        #   in Loop: Header=BB106_19 Depth=2
	movzbl	33(%r9,%r10), %eax
	addq	$7, %rax
	shrq	$3, %rax
	imulq	%rdi, %rax
	addq	%rax, %r11
	incq	%r15
	cmpq	%r8, %r15
	je	.LBB106_21
.LBB106_19:                             # %for.body
                                        #   Parent Loop BB106_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB106_27 Depth 3
                                        #       Child Loop BB106_31 Depth 3
	imulq	$56, %r15, %r10
	movl	36(%r9,%r10), %ebx
	testl	%ebx, %ebx
	jle	.LBB106_20
# %bb.26:                               # %for.body.lr.ph.i.i
                                        #   in Loop: Header=BB106_19 Depth=2
	movq	40(%r9,%r10), %rax
	shlq	$4, %rbx
	xorl	%edi, %edi
	xorl	%edx, %edx
	jmp	.LBB106_27
	.p2align	4, 0x90
.LBB106_29:                             # %if.end.i.i
                                        #   in Loop: Header=BB106_27 Depth=3
	addq	$16, %rdi
	cmpq	%rdi, %rbx
	je	.LBB106_30
.LBB106_27:                             # %for.body.i.i
                                        #   Parent Loop BB106_2 Depth=1
                                        #     Parent Loop BB106_19 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	8(%rax,%rdi), %ecx
	testl	%ecx, %ecx
	jle	.LBB106_29
# %bb.28:                               # %if.then.i.i
                                        #   in Loop: Header=BB106_27 Depth=3
	movslq	4(%rax,%rdi), %rsi
	decq	%rsi
	imulq	%rcx, %rsi
	addq	%rsi, %rdx
	jmp	.LBB106_29
	.p2align	4, 0x90
.LBB106_30:                             # %for.body.i12.i.preheader
                                        #   in Loop: Header=BB106_19 Depth=2
	xorl	%ecx, %ecx
	xorl	%edi, %edi
	jmp	.LBB106_31
	.p2align	4, 0x90
.LBB106_33:                             # %if.end.i22.i
                                        #   in Loop: Header=BB106_31 Depth=3
	addq	$16, %rcx
	cmpq	%rcx, %rbx
	je	.LBB106_34
.LBB106_31:                             # %for.body.i12.i
                                        #   Parent Loop BB106_2 Depth=1
                                        #     Parent Loop BB106_19 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movslq	8(%rax,%rcx), %r13
	testq	%r13, %r13
	jns	.LBB106_33
# %bb.32:                               # %if.then.i18.i
                                        #   in Loop: Header=BB106_31 Depth=3
	movslq	4(%rax,%rcx), %rsi
	decq	%rsi
	imulq	%r13, %rsi
	addq	%rsi, %rdi
	jmp	.LBB106_33
	.p2align	4, 0x90
.LBB106_20:                             #   in Loop: Header=BB106_19 Depth=2
	movq	$-1, %rdi
	jmp	.LBB106_35
	.p2align	4, 0x90
.LBB106_21:                             # %for.cond.for.cond.cleanup_crit_edge
                                        #   in Loop: Header=BB106_2 Depth=1
	movq	_ZN6Halide7Runtime8Internal18current_cache_sizeE@GOTPCREL(%rip), %r15
	movq	%r11, (%r15)
.LBB106_22:                             # %for.cond.cleanup
                                        #   in Loop: Header=BB106_2 Depth=1
	movq	%r14, %rdi
	callq	_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv@PLT
	xorl	%edi, %edi
	movq	%r14, %rsi
	callq	halide_free@PLT
	movq	(%r15), %rax
	movq	_ZN6Halide7Runtime8Internal14max_cache_sizeE@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
.LBB106_23:                             # %if.end41
                                        #   in Loop: Header=BB106_2 Depth=1
	cmpq	%rcx, %rax
	jle	.LBB106_25
# %bb.24:                               # %if.end41
                                        #   in Loop: Header=BB106_2 Depth=1
	movq	%r12, %r14
	testq	%r12, %r12
	jne	.LBB106_2
	jmp	.LBB106_25
.LBB106_14:                             # %if.then30
                                        #   in Loop: Header=BB106_2 Depth=1
	movq	_ZN6Halide7Runtime8Internal18most_recently_usedE@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	testq	%rax, %rax
	jne	.LBB106_16
	jmp	.LBB106_17
.LBB106_25:                             # %while.end42
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end106:
	.size	_ZN6Halide7Runtime8Internal11prune_cacheEv, .Lfunc_end106-_ZN6Halide7Runtime8Internal11prune_cacheEv
                                        # -- End function
	.section	.text.halide_memoization_cache_set_size,"ax",@progbits
	.weak	halide_memoization_cache_set_size # -- Begin function halide_memoization_cache_set_size
	.p2align	4, 0x90
	.type	halide_memoization_cache_set_size,@function
halide_memoization_cache_set_size:      # @halide_memoization_cache_set_size
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	testq	%rdi, %rdi
	movl	$1048576, %ebx                  # imm = 0x100000
	cmovneq	%rdi, %rbx
	movq	_ZN6Halide7Runtime8Internal16memoization_lockE@GOTPCREL(%rip), %r14
	movq	%r14, %rdi
	callq	halide_mutex_lock@PLT
	movq	_ZN6Halide7Runtime8Internal14max_cache_sizeE@GOTPCREL(%rip), %rax
	movq	%rbx, (%rax)
	callq	_ZN6Halide7Runtime8Internal11prune_cacheEv@PLT
	movq	%r14, %rdi
	popq	%rbx
	popq	%r14
	popq	%rbp
	jmp	halide_mutex_unlock@PLT         # TAILCALL
.Lfunc_end107:
	.size	halide_memoization_cache_set_size, .Lfunc_end107-halide_memoization_cache_set_size
                                        # -- End function
	.section	.text.halide_memoization_cache_lookup,"ax",@progbits
	.weak	halide_memoization_cache_lookup # -- Begin function halide_memoization_cache_lookup
	.p2align	4, 0x90
	.type	halide_memoization_cache_lookup,@function
halide_memoization_cache_lookup:        # @halide_memoization_cache_lookup
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$40, %rsp
	movq	%r9, -72(%rbp)                  # 8-byte Spill
	movl	%r8d, %r13d
	movq	%rcx, -80(%rbp)                 # 8-byte Spill
	movq	%rsi, %rax
	movq	%rdi, -56(%rbp)                 # 8-byte Spill
	movslq	%edx, %rsi
	movq	%rax, -64(%rbp)                 # 8-byte Spill
	movq	%rax, %rdi
	movq	%rsi, %r14
	callq	_ZN6Halide7Runtime8Internal8djb_hashEPKhm@PLT
	movl	%eax, -48(%rbp)                 # 4-byte Spill
	movzbl	%al, %ebx
	movq	_ZN6Halide7Runtime8Internal16memoization_lockE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_lock@PLT
	movq	_ZN6Halide7Runtime8Internal13cache_entriesE@GOTPCREL(%rip), %rax
	movq	(%rax,%rbx,8), %r12
	testq	%r12, %r12
	je	.LBB108_13
# %bb.1:                                # %while.body.lr.ph
	testl	%r13d, %r13d
	jle	.LBB108_31
# %bb.2:                                # %while.body.us.preheader
	movslq	%r13d, %r15
	jmp	.LBB108_3
	.p2align	4, 0x90
.LBB108_30:                             # %if.end73
                                        #   in Loop: Header=BB108_31 Depth=1
	movq	(%r12), %r12
	testq	%r12, %r12
	je	.LBB108_13
.LBB108_31:                             # %while.body
                                        # =>This Inner Loop Header: Depth=1
	movl	-48(%rbp), %eax                 # 4-byte Reload
	cmpl	%eax, 48(%r12)
	jne	.LBB108_30
# %bb.32:                               # %land.lhs.true
                                        #   in Loop: Header=BB108_31 Depth=1
	cmpq	%r14, 32(%r12)
	jne	.LBB108_30
# %bb.33:                               # %land.lhs.true7
                                        #   in Loop: Header=BB108_31 Depth=1
	movq	40(%r12), %rdi
	movq	-64(%rbp), %rsi                 # 8-byte Reload
	movq	%r14, %rdx
	callq	_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m@PLT
	testb	%al, %al
	je	.LBB108_30
# %bb.34:                               # %land.lhs.true10
                                        #   in Loop: Header=BB108_31 Depth=1
	movq	64(%r12), %rsi
	movq	-80(%rbp), %rdi                 # 8-byte Reload
	callq	_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t@PLT
	testb	%al, %al
	je	.LBB108_30
# %bb.35:                               # %land.lhs.true13
                                        #   in Loop: Header=BB108_31 Depth=1
	cmpl	%r13d, 56(%r12)
	jne	.LBB108_30
# %bb.36:
	movl	%r13d, -44(%rbp)                # 4-byte Spill
.LBB108_37:                             # %if.then23
	movq	_ZN6Halide7Runtime8Internal18most_recently_usedE@GOTPCREL(%rip), %rbx
	cmpq	(%rbx), %r12
	movq	-72(%rbp), %r15                 # 8-byte Reload
	je	.LBB108_50
# %bb.38:                               # %do.body
	cmpq	$0, 8(%r12)
	jne	.LBB108_40
# %bb.39:                               # %if.then27
	leaq	.L.str.3.43(%rip), %rsi
	movq	-56(%rbp), %rdi                 # 8-byte Reload
	callq	halide_print@PLT
	callq	abort@PLT
.LBB108_40:                             # %do.end
	movq	16(%r12), %rax
	testq	%rax, %rax
	je	.LBB108_42
# %bb.41:                               # %if.then29
	movq	8(%r12), %rcx
	movq	%rcx, 8(%rax)
	movq	8(%r12), %rax
	jmp	.LBB108_45
.LBB108_11:                             # %for.cond.cleanup.us
                                        #   in Loop: Header=BB108_3 Depth=1
	testb	%al, %al
	movl	-44(%rbp), %r13d                # 4-byte Reload
	jne	.LBB108_37
	.p2align	4, 0x90
.LBB108_12:                             # %if.end73.us
                                        #   in Loop: Header=BB108_3 Depth=1
	movq	(%r12), %r12
	testq	%r12, %r12
	je	.LBB108_13
.LBB108_3:                              # %while.body.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB108_9 Depth 2
	movl	-48(%rbp), %eax                 # 4-byte Reload
	cmpl	%eax, 48(%r12)
	jne	.LBB108_12
# %bb.4:                                # %land.lhs.true.us
                                        #   in Loop: Header=BB108_3 Depth=1
	cmpq	%r14, 32(%r12)
	jne	.LBB108_12
# %bb.5:                                # %land.lhs.true7.us
                                        #   in Loop: Header=BB108_3 Depth=1
	movq	40(%r12), %rdi
	movq	-64(%rbp), %rsi                 # 8-byte Reload
	movq	%r14, %rdx
	callq	_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m@PLT
	testb	%al, %al
	je	.LBB108_12
# %bb.6:                                # %land.lhs.true10.us
                                        #   in Loop: Header=BB108_3 Depth=1
	movq	64(%r12), %rsi
	movq	-80(%rbp), %rdi                 # 8-byte Reload
	callq	_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t@PLT
	testb	%al, %al
	je	.LBB108_12
# %bb.7:                                # %land.lhs.true13.us
                                        #   in Loop: Header=BB108_3 Depth=1
	cmpl	%r13d, 56(%r12)
	jne	.LBB108_12
# %bb.8:                                # %for.cond.preheader.us
                                        #   in Loop: Header=BB108_3 Depth=1
	movl	%r13d, -44(%rbp)                # 4-byte Spill
	movl	$1, %r13d
	movl	$5, %ebx
	.p2align	4, 0x90
.LBB108_9:                              # %for.body.us
                                        #   Parent Loop BB108_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	-72(%rbp), %rax                 # 8-byte Reload
	movq	-8(%rax,%r13,8), %rdi
	movq	72(%r12), %rax
	movq	(%rax,%rbx,8), %rsi
	callq	_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t@PLT
	testb	%al, %al
	je	.LBB108_11
# %bb.10:                               # %for.body.us
                                        #   in Loop: Header=BB108_9 Depth=2
	leaq	1(%r13), %rcx
	addq	$7, %rbx
	cmpq	%r15, %r13
	movq	%rcx, %r13
	jl	.LBB108_9
	jmp	.LBB108_11
.LBB108_13:                             # %for.cond75.preheader
	movl	$1, %ebx
	testl	%r13d, %r13d
	jle	.LBB108_56
# %bb.14:                               # %for.body78.preheader
	movl	%r13d, %eax
	movq	%rax, -64(%rbp)                 # 8-byte Spill
	movl	$1, %r12d
	movl	$4294967295, %r14d              # imm = 0xFFFFFFFF
	xorl	%r13d, %r13d
	.p2align	4, 0x90
.LBB108_15:                             # %for.body78
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB108_17 Depth 2
                                        #     Child Loop BB108_21 Depth 2
	movq	-72(%rbp), %rax                 # 8-byte Reload
	movq	(%rax,%r13,8), %r15
	movl	36(%r15), %ecx
	movl	$1, %r8d
	testl	%ecx, %ecx
	jle	.LBB108_25
# %bb.16:                               # %for.body.lr.ph.i.i
                                        #   in Loop: Header=BB108_15 Depth=1
	movq	40(%r15), %rdx
	shlq	$4, %rcx
	xorl	%esi, %esi
	xorl	%r8d, %r8d
	jmp	.LBB108_17
	.p2align	4, 0x90
.LBB108_19:                             # %if.end.i.i
                                        #   in Loop: Header=BB108_17 Depth=2
	addq	$16, %rsi
	cmpq	%rsi, %rcx
	je	.LBB108_20
.LBB108_17:                             # %for.body.i.i
                                        #   Parent Loop BB108_15 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	8(%rdx,%rsi), %edi
	testl	%edi, %edi
	jle	.LBB108_19
# %bb.18:                               # %if.then.i.i
                                        #   in Loop: Header=BB108_17 Depth=2
	movslq	4(%rdx,%rsi), %rbx
	decq	%rbx
	imulq	%rdi, %rbx
	addq	%rbx, %r8
	jmp	.LBB108_19
	.p2align	4, 0x90
.LBB108_20:                             # %for.body.i12.i.preheader
                                        #   in Loop: Header=BB108_15 Depth=1
	xorl	%edi, %edi
	xorl	%esi, %esi
	jmp	.LBB108_21
	.p2align	4, 0x90
.LBB108_23:                             # %if.end.i22.i
                                        #   in Loop: Header=BB108_21 Depth=2
	addq	$16, %rdi
	cmpq	%rdi, %rcx
	je	.LBB108_24
.LBB108_21:                             # %for.body.i12.i
                                        #   Parent Loop BB108_15 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	8(%rdx,%rdi), %rbx
	testq	%rbx, %rbx
	jns	.LBB108_23
# %bb.22:                               # %if.then.i18.i
                                        #   in Loop: Header=BB108_21 Depth=2
	movslq	4(%rdx,%rdi), %rax
	decq	%rax
	imulq	%rbx, %rax
	addq	%rax, %rsi
	jmp	.LBB108_23
	.p2align	4, 0x90
.LBB108_24:                             # %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit
                                        #   in Loop: Header=BB108_15 Depth=1
	subq	%rsi, %r8
	incq	%r8
.LBB108_25:                             # %_ZNK15halide_buffer_t13size_in_bytesEv.exit
                                        #   in Loop: Header=BB108_15 Depth=1
	movzbl	33(%r15), %esi
	addq	$7, %rsi
	shrq	$3, %rsi
	imulq	%r8, %rsi
	addq	$64, %rsi
	movq	-56(%rbp), %rdi                 # 8-byte Reload
	callq	halide_malloc@PLT
	movq	%rax, 16(%r15)
	testq	%rax, %rax
	je	.LBB108_26
# %bb.54:                               # %for.inc114
                                        #   in Loop: Header=BB108_15 Depth=1
	addq	$64, %rax
	movq	%rax, 16(%r15)
	movq	%rax, %rdi
	callq	_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh@PLT
	movl	-48(%rbp), %ecx                 # 4-byte Reload
	movl	%ecx, 8(%rax)
	movq	$0, (%rax)
	incq	%r13
	incq	%r12
	incq	%r14
	cmpq	-64(%rbp), %r13                 # 8-byte Folded Reload
	jne	.LBB108_15
# %bb.55:
	movl	$1, %ebx
	jmp	.LBB108_56
.LBB108_26:                             # %for.cond89.preheader
	movl	$-1, %ebx
	testq	%r13, %r13
	je	.LBB108_56
# %bb.27:                               # %for.body92.preheader
	movq	-72(%rbp), %r15                 # 8-byte Reload
	movq	-56(%rbp), %r13                 # 8-byte Reload
	.p2align	4, 0x90
.LBB108_28:                             # %for.body92
                                        # =>This Inner Loop Header: Depth=1
	movl	%r14d, %ebx
	movq	(%r15,%rbx,8), %rax
	movq	16(%rax), %rdi
	callq	_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh@PLT
	movq	%r13, %rdi
	movq	%rax, %rsi
	callq	halide_free@PLT
	movq	(%r15,%rbx,8), %rax
	movq	$0, 16(%rax)
	decq	%r12
	decq	%r14
	cmpq	$1, %r12
	jg	.LBB108_28
# %bb.29:
	movl	$-1, %ebx
.LBB108_56:                             # %cleanup119
	movq	_ZN6Halide7Runtime8Internal16memoization_lockE@GOTPCREL(%rip), %rdi
	vzeroupper
	callq	halide_mutex_unlock@PLT
	movl	%ebx, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB108_42:                             # %do.body33
	movq	_ZN6Halide7Runtime8Internal19least_recently_usedE@GOTPCREL(%rip), %r14
	cmpq	%r12, (%r14)
	je	.LBB108_44
# %bb.43:                               # %if.then35
	leaq	.L.str.4.44(%rip), %rsi
	movq	-56(%rbp), %rdi                 # 8-byte Reload
	callq	halide_print@PLT
	callq	abort@PLT
.LBB108_44:                             # %do.end38
	movq	8(%r12), %rax
	movq	%rax, (%r14)
.LBB108_45:                             # %do.body41
	testq	%rax, %rax
	jne	.LBB108_47
# %bb.46:                               # %if.then44
	leaq	.L.str.5.45(%rip), %rsi
	movq	-56(%rbp), %rdi                 # 8-byte Reload
	callq	halide_print@PLT
	callq	abort@PLT
	movq	8(%r12), %rax
.LBB108_47:                             # %do.end47
	movq	16(%r12), %rcx
	movq	%rcx, 16(%rax)
	movq	$0, 8(%r12)
	movq	(%rbx), %rax
	movq	%rax, 16(%r12)
	testq	%rax, %rax
	je	.LBB108_49
# %bb.48:                               # %if.then54
	movq	%r12, 8(%rax)
.LBB108_49:                             # %if.end56
	movq	%r12, (%rbx)
.LBB108_50:                             # %if.end57
	movl	-44(%rbp), %edi                 # 4-byte Reload
	testl	%edi, %edi
	jle	.LBB108_53
# %bb.51:                               # %for.body62.lr.ph
	movl	%edi, %ecx
	leaq	(,%rcx,8), %rax
	subq	%rcx, %rax
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB108_52:                             # %for.body62
                                        # =>This Inner Loop Header: Depth=1
	movq	(%r15), %rdx
	movq	72(%r12), %rsi
	vmovups	(%rsi,%rcx,8), %ymm0
	vmovups	24(%rsi,%rcx,8), %ymm1
	vmovups	%ymm1, 24(%rdx)
	vmovups	%ymm0, (%rdx)
	addq	$7, %rcx
	addq	$8, %r15
	cmpq	%rcx, %rax
	jne	.LBB108_52
.LBB108_53:                             # %cleanup119.loopexit223
	addl	%edi, 52(%r12)
	xorl	%ebx, %ebx
	jmp	.LBB108_56
.Lfunc_end108:
	.size	halide_memoization_cache_lookup, .Lfunc_end108-halide_memoization_cache_lookup
                                        # -- End function
	.section	.text.halide_memoization_cache_store,"ax",@progbits
	.weak	halide_memoization_cache_store  # -- Begin function halide_memoization_cache_store
	.p2align	4, 0x90
	.type	halide_memoization_cache_store,@function
halide_memoization_cache_store:         # @halide_memoization_cache_store
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$72, %rsp
	movq	%r9, %r13
	movl	%r8d, %r12d
	movq	%rcx, -72(%rbp)                 # 8-byte Spill
	movl	%edx, %r15d
	movq	%rsi, -80(%rbp)                 # 8-byte Spill
	movq	%rdi, -88(%rbp)                 # 8-byte Spill
	movq	(%r9), %rax
	movq	16(%rax), %rdi
	callq	_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh@PLT
	movl	8(%rax), %r14d
	movzbl	%r14b, %ebx
	movq	_ZN6Halide7Runtime8Internal16memoization_lockE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_lock@PLT
	movq	%r14, %rcx
	movq	_ZN6Halide7Runtime8Internal13cache_entriesE@GOTPCREL(%rip), %rax
	movq	%rbx, -104(%rbp)                # 8-byte Spill
	movq	(%rax,%rbx,8), %r14
	movslq	%r15d, %rax
	movq	%rax, -64(%rbp)                 # 8-byte Spill
	testq	%r14, %r14
	movq	%rcx, -56(%rbp)                 # 8-byte Spill
	movl	%r12d, -44(%rbp)                # 4-byte Spill
	je	.LBB109_13
# %bb.1:                                # %while.body.lr.ph
	testl	%r12d, %r12d
	jle	.LBB109_15
# %bb.2:                                # %while.body.us.preheader
	movslq	%r12d, %rax
	movq	%rax, -112(%rbp)                # 8-byte Spill
	jmp	.LBB109_3
	.p2align	4, 0x90
.LBB109_20:                             # %if.end59
                                        #   in Loop: Header=BB109_15 Depth=1
	movq	(%r14), %r14
	testq	%r14, %r14
	je	.LBB109_13
.LBB109_15:                             # %while.body
                                        # =>This Inner Loop Header: Depth=1
	cmpl	%ecx, 48(%r14)
	jne	.LBB109_20
# %bb.16:                               # %land.lhs.true
                                        #   in Loop: Header=BB109_15 Depth=1
	movq	-64(%rbp), %rax                 # 8-byte Reload
	cmpq	%rax, 32(%r14)
	jne	.LBB109_20
# %bb.17:                               # %land.lhs.true12
                                        #   in Loop: Header=BB109_15 Depth=1
	movq	40(%r14), %rdi
	movq	-80(%rbp), %rsi                 # 8-byte Reload
	movq	-64(%rbp), %rdx                 # 8-byte Reload
	callq	_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m@PLT
	movq	-56(%rbp), %rcx                 # 8-byte Reload
	testb	%al, %al
	je	.LBB109_20
# %bb.18:                               # %land.lhs.true15
                                        #   in Loop: Header=BB109_15 Depth=1
	movq	64(%r14), %rsi
	movq	-72(%rbp), %rdi                 # 8-byte Reload
	callq	_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t@PLT
	movq	-56(%rbp), %rcx                 # 8-byte Reload
	testb	%al, %al
	je	.LBB109_20
# %bb.19:                               # %land.lhs.true18
                                        #   in Loop: Header=BB109_15 Depth=1
	cmpl	%r12d, 56(%r14)
	jne	.LBB109_20
	jmp	.LBB109_52
.LBB109_11:                             # %for.cond.cleanup.us
                                        #   in Loop: Header=BB109_3 Depth=1
	testb	%al, %al
	movq	-96(%rbp), %r13                 # 8-byte Reload
	movl	-44(%rbp), %r12d                # 4-byte Reload
	movq	-56(%rbp), %rcx                 # 8-byte Reload
	jne	.LBB109_21
	.p2align	4, 0x90
.LBB109_12:                             # %if.end59.us
                                        #   in Loop: Header=BB109_3 Depth=1
	movq	(%r14), %r14
	testq	%r14, %r14
	je	.LBB109_13
.LBB109_3:                              # %while.body.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB109_9 Depth 2
	cmpl	%ecx, 48(%r14)
	jne	.LBB109_12
# %bb.4:                                # %land.lhs.true.us
                                        #   in Loop: Header=BB109_3 Depth=1
	movq	-64(%rbp), %rax                 # 8-byte Reload
	cmpq	%rax, 32(%r14)
	jne	.LBB109_12
# %bb.5:                                # %land.lhs.true12.us
                                        #   in Loop: Header=BB109_3 Depth=1
	movq	40(%r14), %rdi
	movq	-80(%rbp), %rsi                 # 8-byte Reload
	movq	-64(%rbp), %rdx                 # 8-byte Reload
	callq	_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m@PLT
	movq	-56(%rbp), %rcx                 # 8-byte Reload
	testb	%al, %al
	je	.LBB109_12
# %bb.6:                                # %land.lhs.true15.us
                                        #   in Loop: Header=BB109_3 Depth=1
	movq	64(%r14), %rsi
	movq	-72(%rbp), %rdi                 # 8-byte Reload
	callq	_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t@PLT
	movq	-56(%rbp), %rcx                 # 8-byte Reload
	testb	%al, %al
	je	.LBB109_12
# %bb.7:                                # %land.lhs.true18.us
                                        #   in Loop: Header=BB109_3 Depth=1
	cmpl	%r12d, 56(%r14)
	jne	.LBB109_12
# %bb.8:                                # %for.cond.preheader.us
                                        #   in Loop: Header=BB109_3 Depth=1
	movq	%r13, -96(%rbp)                 # 8-byte Spill
	movq	72(%r14), %rcx
	movb	$1, %r15b
	movl	$1, %r13d
	xorl	%r12d, %r12d
	.p2align	4, 0x90
.LBB109_9:                              # %for.body.us
                                        #   Parent Loop BB109_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	-96(%rbp), %rax                 # 8-byte Reload
	movq	-8(%rax,%r13,8), %rbx
	movq	40(%rcx,%r12), %rsi
	movq	%rbx, %rdi
	callq	_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t@PLT
	movq	72(%r14), %rcx
	movq	16(%rcx,%r12), %rdx
	cmpq	16(%rbx), %rdx
	movzbl	%r15b, %r15d
	movl	$0, %edx
	cmovel	%edx, %r15d
	testb	%al, %al
	je	.LBB109_11
# %bb.10:                               # %for.body.us
                                        #   in Loop: Header=BB109_9 Depth=2
	leaq	1(%r13), %rdx
	addq	$56, %r12
	cmpq	-112(%rbp), %r13                # 8-byte Folded Reload
	movq	%rdx, %r13
	jl	.LBB109_9
	jmp	.LBB109_11
.LBB109_13:                             # %for.cond61.preheader
	testl	%r12d, %r12d
	jle	.LBB109_14
# %bb.25:                               # %for.body64.preheader
	movl	%r12d, %r8d
	xorl	%r10d, %r10d
	xorl	%r12d, %r12d
	jmp	.LBB109_26
	.p2align	4, 0x90
.LBB109_36:                             # %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit
                                        #   in Loop: Header=BB109_26 Depth=1
	subq	%rdx, %r11
	incq	%r11
.LBB109_37:                             # %_ZNK15halide_buffer_t13size_in_bytesEv.exit
                                        #   in Loop: Header=BB109_26 Depth=1
	movzbl	33(%r9), %eax
	addq	$7, %rax
	shrq	$3, %rax
	imulq	%r11, %rax
	addq	%rax, %r12
	incq	%r10
	cmpq	%r8, %r10
	je	.LBB109_38
.LBB109_26:                             # %for.body64
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB109_29 Depth 2
                                        #     Child Loop BB109_33 Depth 2
	movq	(%r13,%r10,8), %r9
	movl	36(%r9), %edi
	testl	%edi, %edi
	jle	.LBB109_27
# %bb.28:                               # %for.body.lr.ph.i.i
                                        #   in Loop: Header=BB109_26 Depth=1
	movq	40(%r9), %rax
	shlq	$4, %rdi
	xorl	%edx, %edx
	xorl	%r11d, %r11d
	jmp	.LBB109_29
	.p2align	4, 0x90
.LBB109_31:                             # %if.end.i.i
                                        #   in Loop: Header=BB109_29 Depth=2
	addq	$16, %rdx
	cmpq	%rdx, %rdi
	je	.LBB109_32
.LBB109_29:                             # %for.body.i.i
                                        #   Parent Loop BB109_26 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	8(%rax,%rdx), %ebx
	testl	%ebx, %ebx
	jle	.LBB109_31
# %bb.30:                               # %if.then.i.i
                                        #   in Loop: Header=BB109_29 Depth=2
	movslq	4(%rax,%rdx), %rcx
	decq	%rcx
	imulq	%rbx, %rcx
	addq	%rcx, %r11
	jmp	.LBB109_31
	.p2align	4, 0x90
.LBB109_32:                             # %for.body.i12.i.preheader
                                        #   in Loop: Header=BB109_26 Depth=1
	xorl	%ebx, %ebx
	xorl	%edx, %edx
	jmp	.LBB109_33
	.p2align	4, 0x90
.LBB109_35:                             # %if.end.i22.i
                                        #   in Loop: Header=BB109_33 Depth=2
	addq	$16, %rbx
	cmpq	%rbx, %rdi
	je	.LBB109_36
.LBB109_33:                             # %for.body.i12.i
                                        #   Parent Loop BB109_26 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	8(%rax,%rbx), %rcx
	testq	%rcx, %rcx
	jns	.LBB109_35
# %bb.34:                               # %if.then.i18.i
                                        #   in Loop: Header=BB109_33 Depth=2
	movslq	4(%rax,%rbx), %rsi
	decq	%rsi
	imulq	%rcx, %rsi
	addq	%rsi, %rdx
	jmp	.LBB109_35
	.p2align	4, 0x90
.LBB109_27:                             #   in Loop: Header=BB109_26 Depth=1
	movl	$1, %r11d
	jmp	.LBB109_37
.LBB109_14:
	xorl	%r12d, %r12d
.LBB109_38:                             # %for.cond.cleanup63
	movq	_ZN6Halide7Runtime8Internal18current_cache_sizeE@GOTPCREL(%rip), %r15
	addq	%r12, (%r15)
	callq	_ZN6Halide7Runtime8Internal11prune_cacheEv@PLT
	movl	$96, %esi
	xorl	%edi, %edi
	callq	halide_malloc@PLT
	movq	%rax, %r14
	testq	%rax, %rax
	je	.LBB109_40
# %bb.39:                               # %if.then76
	movb	16(%rbp), %al
	subq	$8, %rsp
	movzbl	%al, %eax
	movq	%r14, %rdi
	movq	-80(%rbp), %rsi                 # 8-byte Reload
	movq	-64(%rbp), %rdx                 # 8-byte Reload
	movq	-56(%rbp), %rcx                 # 8-byte Reload
                                        # kill: def $ecx killed $ecx killed $rcx
	movq	-72(%rbp), %r8                  # 8-byte Reload
	movl	-44(%rbp), %r9d                 # 4-byte Reload
	pushq	24(%rbp)
	pushq	%rax
	pushq	%r13
	callq	_ZN6Halide7Runtime8Internal10CacheEntry4initEPKhmjPK15halide_buffer_tiPPS5_by@PLT
	addq	$32, %rsp
	testb	%al, %al
	je	.LBB109_40
# %bb.45:                               # %if.end101
	movq	-104(%rbp), %rdx                # 8-byte Reload
	movq	_ZN6Halide7Runtime8Internal13cache_entriesE@GOTPCREL(%rip), %rsi
	movq	(%rsi,%rdx,8), %rax
	movq	%rax, (%r14)
	movq	_ZN6Halide7Runtime8Internal18most_recently_usedE@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	movq	%rcx, 16(%r14)
	testq	%rcx, %rcx
	je	.LBB109_47
# %bb.46:                               # %if.then106
	movq	%r14, 8(%rcx)
.LBB109_47:                             # %if.end107
	movq	%r14, (%rax)
	movq	_ZN6Halide7Runtime8Internal19least_recently_usedE@GOTPCREL(%rip), %rax
	cmpq	$0, (%rax)
	movl	-44(%rbp), %ecx                 # 4-byte Reload
	jne	.LBB109_49
# %bb.48:                               # %if.then109
	movq	%r14, (%rax)
.LBB109_49:                             # %if.end110
	movq	%r14, (%rsi,%rdx,8)
	movl	%ecx, 52(%r14)
	testl	%ecx, %ecx
	jle	.LBB109_52
# %bb.50:                               # %for.body117.preheader
	movl	%ecx, %r15d
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB109_51:                             # %for.body117
                                        # =>This Inner Loop Header: Depth=1
	movq	(%r13,%rbx,8), %rax
	movq	16(%rax), %rdi
	callq	_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh@PLT
	movq	%r14, (%rax)
	incq	%rbx
	cmpq	%rbx, %r15
	jne	.LBB109_51
	jmp	.LBB109_52
.LBB109_40:                             # %if.then83
	subq	%r12, (%r15)
	movl	-44(%rbp), %eax                 # 4-byte Reload
	testl	%eax, %eax
	jle	.LBB109_43
# %bb.41:                               # %for.body88.preheader
	movl	%eax, %r15d
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB109_42:                             # %for.body88
                                        # =>This Inner Loop Header: Depth=1
	movq	(%r13,%rbx,8), %rax
	movq	16(%rax), %rdi
	callq	_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh@PLT
	movq	$0, (%rax)
	incq	%rbx
	cmpq	%rbx, %r15
	jne	.LBB109_42
.LBB109_43:                             # %for.cond.cleanup87
	testq	%r14, %r14
	je	.LBB109_52
# %bb.44:                               # %if.then99
	movq	-88(%rbp), %rdi                 # 8-byte Reload
	movq	%r14, %rsi
	callq	halide_free@PLT
.LBB109_52:                             # %cleanup132
	movq	_ZN6Halide7Runtime8Internal16memoization_lockE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_unlock@PLT
	xorl	%eax, %eax
	addq	$72, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB109_21:                             # %do.body
	testb	$1, %r15b
	jne	.LBB109_23
# %bb.22:                               # %if.then42
	leaq	.L.str.9.46(%rip), %rsi
	movq	-88(%rbp), %rdi                 # 8-byte Reload
	callq	halide_print@PLT
	callq	abort@PLT
.LBB109_23:                             # %for.body48.preheader
	movl	%r12d, %r14d
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB109_24:                             # %for.body48
                                        # =>This Inner Loop Header: Depth=1
	movq	(%r13,%rbx,8), %rax
	movq	16(%rax), %rdi
	callq	_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh@PLT
	movq	$0, (%rax)
	incq	%rbx
	cmpq	%rbx, %r14
	jne	.LBB109_24
	jmp	.LBB109_52
.Lfunc_end109:
	.size	halide_memoization_cache_store, .Lfunc_end109-halide_memoization_cache_store
                                        # -- End function
	.section	.text.halide_memoization_cache_release,"ax",@progbits
	.weak	halide_memoization_cache_release # -- Begin function halide_memoization_cache_release
	.p2align	4, 0x90
	.type	halide_memoization_cache_release,@function
halide_memoization_cache_release:       # @halide_memoization_cache_release
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	movq	%rdi, %r14
	movq	%rsi, %rdi
	callq	_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh@PLT
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	je	.LBB110_4
# %bb.1:                                # %if.else
	movq	_ZN6Halide7Runtime8Internal16memoization_lockE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_lock@PLT
	movl	52(%rbx), %eax
	testl	%eax, %eax
	jne	.LBB110_3
# %bb.2:                                # %if.then4
	leaq	.L.str.12.47(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_print@PLT
	callq	abort@PLT
	movl	52(%rbx), %eax
.LBB110_3:                              # %do.end
	decl	%eax
	movl	%eax, 52(%rbx)
	movq	_ZN6Halide7Runtime8Internal16memoization_lockE@GOTPCREL(%rip), %rdi
	popq	%rbx
	popq	%r14
	popq	%rbp
	jmp	halide_mutex_unlock@PLT         # TAILCALL
.LBB110_4:                              # %if.then
	movq	%r14, %rdi
	movq	%rax, %rsi
	popq	%rbx
	popq	%r14
	popq	%rbp
	jmp	halide_free@PLT                 # TAILCALL
.Lfunc_end110:
	.size	halide_memoization_cache_release, .Lfunc_end110-halide_memoization_cache_release
                                        # -- End function
	.section	.text.halide_memoization_cache_evict,"ax",@progbits
	.weak	halide_memoization_cache_evict  # -- Begin function halide_memoization_cache_evict
	.p2align	4, 0x90
	.type	halide_memoization_cache_evict,@function
halide_memoization_cache_evict:         # @halide_memoization_cache_evict
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	movq	%rsi, %r15
	movq	%rdi, -56(%rbp)                 # 8-byte Spill
	movq	_ZN6Halide7Runtime8Internal16memoization_lockE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_lock@PLT
	movq	_ZN6Halide7Runtime8Internal13cache_entriesE@GOTPCREL(%rip), %r14
	movl	$2048, %eax                     # imm = 0x800
	addq	_ZN6Halide7Runtime8Internal13cache_entriesE@GOTPCREL(%rip), %rax
	movq	%rax, -48(%rbp)                 # 8-byte Spill
	jmp	.LBB111_1
	.p2align	4, 0x90
.LBB111_13:                             # %if.end25
                                        #   in Loop: Header=BB111_1 Depth=1
	addq	$8, %r14
	cmpq	-48(%rbp), %r14                 # 8-byte Folded Reload
	je	.LBB111_14
.LBB111_1:                              # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB111_3 Depth 2
	movq	(%r14), %r13
	testq	%r13, %r13
	je	.LBB111_13
# %bb.2:                                # %while.body.preheader
                                        #   in Loop: Header=BB111_1 Depth=1
	movq	%r14, %r12
	jmp	.LBB111_3
.LBB111_10:                             # %if.end
                                        #   in Loop: Header=BB111_3 Depth=2
	movq	_ZN6Halide7Runtime8Internal19least_recently_usedE@GOTPCREL(%rip), %rcx
.LBB111_11:                             # %if.end
                                        #   in Loop: Header=BB111_3 Depth=2
	movq	%rax, (%rcx)
	movq	%rbx, %rdi
	callq	_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv@PLT
	movq	-56(%rbp), %rdi                 # 8-byte Reload
	movq	%rbx, %rsi
	callq	halide_free@PLT
	movq	%r12, %rbx
.LBB111_12:                             # %if.end24
                                        #   in Loop: Header=BB111_3 Depth=2
	movq	%rbx, %r12
	testq	%r13, %r13
	je	.LBB111_13
.LBB111_3:                              # %while.body
                                        #   Parent Loop BB111_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%r13, %rbx
	movq	(%r13), %r13
	cmpb	$0, 88(%rbx)
	je	.LBB111_12
# %bb.4:                                # %land.lhs.true
                                        #   in Loop: Header=BB111_3 Depth=2
	cmpq	%r15, 80(%rbx)
	jne	.LBB111_12
# %bb.5:                                # %if.then7
                                        #   in Loop: Header=BB111_3 Depth=2
	movq	%r13, (%r12)
	movq	8(%rbx), %rax
	movq	16(%rbx), %rcx
	testq	%rax, %rax
	je	.LBB111_7
# %bb.6:                                # %if.then9
                                        #   in Loop: Header=BB111_3 Depth=2
	movq	%rcx, 16(%rax)
	movq	16(%rbx), %rcx
	testq	%rcx, %rcx
	je	.LBB111_10
	jmp	.LBB111_9
.LBB111_7:                              # %if.else
                                        #   in Loop: Header=BB111_3 Depth=2
	movq	_ZN6Halide7Runtime8Internal18most_recently_usedE@GOTPCREL(%rip), %rdx
	movq	%rcx, (%rdx)
	testq	%rcx, %rcx
	je	.LBB111_10
.LBB111_9:                              #   in Loop: Header=BB111_3 Depth=2
	addq	$8, %rcx
	jmp	.LBB111_11
.LBB111_14:                             # %for.cond.cleanup
	movq	_ZN6Halide7Runtime8Internal16memoization_lockE@GOTPCREL(%rip), %rdi
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	halide_mutex_unlock@PLT         # TAILCALL
.Lfunc_end111:
	.size	halide_memoization_cache_evict, .Lfunc_end111-halide_memoization_cache_evict
                                        # -- End function
	.section	.text.halide_string_to_string,"ax",@progbits
	.weak	halide_string_to_string         # -- Begin function halide_string_to_string
	.p2align	4, 0x90
	.type	halide_string_to_string,@function
halide_string_to_string:                # @halide_string_to_string
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	cmpq	%rsi, %rdi
	jae	.LBB112_6
# %bb.1:                                # %if.end
	movq	%rsi, %rax
	testq	%rdx, %rdx
	leaq	.L.str.50(%rip), %rcx
	cmovneq	%rdx, %rcx
	.p2align	4, 0x90
.LBB112_2:                              # %if.end5
                                        # =>This Inner Loop Header: Depth=1
	movzbl	(%rcx), %edx
	movb	%dl, (%rdi)
	testb	%dl, %dl
	je	.LBB112_6
# %bb.3:                                # %if.end8
                                        #   in Loop: Header=BB112_2 Depth=1
	incq	%rdi
	incq	%rcx
	cmpq	%rax, %rdi
	jne	.LBB112_2
# %bb.4:                                # %if.then4
	movb	$0, -1(%rdi)
	popq	%rbp
	retq
.LBB112_6:
	movq	%rdi, %rax
	popq	%rbp
	retq
.Lfunc_end112:
	.size	halide_string_to_string, .Lfunc_end112-halide_string_to_string
                                        # -- End function
	.section	.text.halide_uint64_to_string,"ax",@progbits
	.weak	halide_uint64_to_string         # -- Begin function halide_uint64_to_string
	.p2align	4, 0x90
	.type	halide_uint64_to_string,@function
halide_uint64_to_string:                # @halide_uint64_to_string
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	subq	$32, %rsp
	movb	$0, -17(%rbp)
	leaq	-18(%rbp), %r8
	testq	%rdx, %rdx
	jne	.LBB113_2
# %bb.1:                                # %entry
	testl	%ecx, %ecx
	jle	.LBB113_5
.LBB113_2:                              # %for.body.preheader
	movl	$1, %r10d
	movabsq	$-3689348814741910323, %r9      # imm = 0xCCCCCCCCCCCCCCCD
	.p2align	4, 0x90
.LBB113_3:                              # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movq	%rdx, %r14
	movl	%r10d, %r11d
	mulxq	%r9, %rdx, %rdx
	shrq	$3, %rdx
	leal	(%rdx,%rdx), %eax
	leal	(%rax,%rax,4), %eax
	movl	%r14d, %ebx
	subl	%eax, %ebx
	addb	$48, %bl
	movb	%bl, (%r8)
	decq	%r8
	leal	1(%r11), %r10d
	cmpl	%ecx, %r11d
	jl	.LBB113_3
# %bb.4:                                # %for.body
                                        #   in Loop: Header=BB113_3 Depth=1
	cmpq	$9, %r14
	ja	.LBB113_3
.LBB113_5:                              # %for.cond.cleanup
	incq	%r8
	movq	%r8, %rdx
	callq	halide_string_to_string@PLT
	addq	$32, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end113:
	.size	halide_uint64_to_string, .Lfunc_end113-halide_uint64_to_string
                                        # -- End function
	.section	.text.halide_int64_to_string,"ax",@progbits
	.weak	halide_int64_to_string          # -- Begin function halide_int64_to_string
	.p2align	4, 0x90
	.type	halide_int64_to_string,@function
halide_int64_to_string:                 # @halide_int64_to_string
# %bb.0:                                # %entry
	cmpq	%rsi, %rdi
	jae	.LBB114_3
# %bb.1:                                # %entry
	testq	%rdx, %rdx
	jns	.LBB114_3
# %bb.2:                                # %if.then
	pushq	%rbp
	movq	%rsp, %rbp
	movb	$45, (%rdi)
	incq	%rdi
	negq	%rdx
	popq	%rbp
.LBB114_3:                              # %if.end
	jmp	halide_uint64_to_string@PLT     # TAILCALL
.Lfunc_end114:
	.size	halide_int64_to_string, .Lfunc_end114-halide_int64_to_string
                                        # -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4                               # -- Begin function halide_double_to_string
.LCPI115_0:
	.quad	0x8000000000000000              # double -0
	.quad	0x8000000000000000              # double -0
.LCPI115_6:
	.long	1127219200                      # 0x43300000
	.long	1160773632                      # 0x45300000
	.long	0                               # 0x0
	.long	0                               # 0x0
.LCPI115_7:
	.quad	0x4330000000000000              # double 4503599627370496
	.quad	0x4530000000000000              # double 1.9342813113834067E+25
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI115_1:
	.quad	0x3ff0000000000000              # double 1
.LCPI115_2:
	.quad	0x4024000000000000              # double 10
.LCPI115_3:
	.quad	0x412e848000000000              # double 1.0E+6
.LCPI115_4:
	.quad	0x3fe0000000000000              # double 0.5
.LCPI115_5:
	.quad	0x43e0000000000000              # double 9.2233720368547758E+18
	.section	.text.halide_double_to_string,"ax",@progbits
	.weak	halide_double_to_string
	.p2align	4, 0x90
	.type	halide_double_to_string,@function
halide_double_to_string:                # @halide_double_to_string
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$536, %rsp                      # imm = 0x218
	movl	%edx, %ebx
	movq	%rsi, %r12
	movq	%rdi, %r14
	vmovsd	%xmm0, -48(%rbp)
	movq	$0, -56(%rbp)
	leaq	-56(%rbp), %rdi
	leaq	-48(%rbp), %rsi
	movl	$8, %edx
	callq	memcpy@PLT
	movq	-56(%rbp), %rax
	movb	$52, %cl
	bzhiq	%rcx, %rax, %r15
	movq	%rax, %r13
	shrq	$52, %r13
	andl	$2047, %r13d                    # imm = 0x7FF
	cmpl	$2047, %r13d                    # imm = 0x7FF
	jne	.LBB115_9
# %bb.1:                                # %if.then
	testq	%r15, %r15
	je	.LBB115_6
# %bb.2:                                # %if.then4
	testq	%rax, %rax
	js	.LBB115_3
# %bb.5:                                # %if.else
	leaq	.L.str.2.58(%rip), %rdx
	jmp	.LBB115_4
.LBB115_9:                              # %if.else15
	testl	%r13d, %r13d
	jne	.LBB115_18
# %bb.10:                               # %if.else15
	testq	%r15, %r15
	jne	.LBB115_18
# %bb.11:                               # %if.then18
	testl	%ebx, %ebx
	je	.LBB115_15
# %bb.12:                               # %if.then20
	testq	%rax, %rax
	js	.LBB115_13
# %bb.14:                               # %if.else24
	leaq	.L.str.6.62(%rip), %rdx
	jmp	.LBB115_4
.LBB115_18:                             # %if.end32
	testq	%rax, %rax
	js	.LBB115_19
# %bb.20:                               # %if.end36
	testl	%ebx, %ebx
	je	.LBB115_35
.LBB115_21:                             # %while.condthread-pre-split
	vmovsd	-48(%rbp), %xmm0                # xmm0 = mem[0],zero
	xorl	%ebx, %ebx
	vmovsd	.LCPI115_1(%rip), %xmm1         # xmm1 = mem[0],zero
	vucomisd	%xmm0, %xmm1
	jbe	.LBB115_25
# %bb.22:                               # %while.body.preheader
	xorl	%ebx, %ebx
	vmovsd	.LCPI115_2(%rip), %xmm2         # xmm2 = mem[0],zero
	.p2align	4, 0x90
.LBB115_23:                             # %while.body
                                        # =>This Inner Loop Header: Depth=1
	vmulsd	%xmm2, %xmm0, %xmm0
	decl	%ebx
	vucomisd	%xmm0, %xmm1
	ja	.LBB115_23
# %bb.24:                               # %while.cond.while.cond40thread-pre-split_crit_edge
	vmovsd	%xmm0, -48(%rbp)
.LBB115_25:                             # %while.cond40thread-pre-split
	vucomisd	.LCPI115_2(%rip), %xmm0
	jb	.LBB115_29
# %bb.26:                               # %while.body42.preheader
	vmovsd	.LCPI115_2(%rip), %xmm1         # xmm1 = mem[0],zero
	.p2align	4, 0x90
.LBB115_27:                             # %while.body42
                                        # =>This Inner Loop Header: Depth=1
	vdivsd	%xmm1, %xmm0, %xmm0
	incl	%ebx
	vucomisd	%xmm1, %xmm0
	jae	.LBB115_27
# %bb.28:                               # %while.cond40.while.end43_crit_edge
	vmovsd	%xmm0, -48(%rbp)
.LBB115_29:                             # %while.end43
	vmovsd	.LCPI115_3(%rip), %xmm1         # xmm1 = mem[0],zero
	vfmadd213sd	.LCPI115_4(%rip), %xmm0, %xmm1 # xmm1 = (xmm0 * xmm1) + mem
	vcvttsd2si	%xmm1, %rax
	movq	%rax, %rcx
	vsubsd	.LCPI115_5(%rip), %xmm1, %xmm0
	sarq	$63, %rcx
	vcvttsd2si	%xmm0, %rdx
	andq	%rcx, %rdx
	orq	%rax, %rdx
	movabsq	$4835703278458516699, %rax      # imm = 0x431BDE82D7B634DB
	mulxq	%rax, %rax, %rax
	shrq	$18, %rax
	imulq	$-1000000, %rax, %r15           # imm = 0xFFF0BDC0
	addq	%rdx, %r15
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%rax, %rdx
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.30.141(%rip), %rdx
	movq	%rax, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%r12, %rsi
	movq	%r15, %rdx
	movl	$6, %ecx
	callq	halide_int64_to_string@PLT
	testl	%ebx, %ebx
	js	.LBB115_31
# %bb.30:                               # %if.then53
	leaq	.L.str.11.67(%rip), %rdx
	movq	%rax, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	jmp	.LBB115_32
.LBB115_6:                              # %if.else9
	testq	%rax, %rax
	js	.LBB115_7
# %bb.8:                                # %if.else13
	leaq	.L.str.4.60(%rip), %rdx
	jmp	.LBB115_4
.LBB115_3:                              # %if.then6
	leaq	.L.str.1.57(%rip), %rdx
	jmp	.LBB115_4
.LBB115_15:                             # %if.else26
	testq	%rax, %rax
	js	.LBB115_16
# %bb.17:                               # %if.else30
	leaq	.L.str.8.64(%rip), %rdx
	jmp	.LBB115_4
.LBB115_19:                             # %if.then34
	leaq	.L.str.9.65(%rip), %rdx
	movq	%r14, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %r14
	vmovsd	-48(%rbp), %xmm0                # xmm0 = mem[0],zero
	vxorpd	.LCPI115_0(%rip), %xmm0, %xmm0
	vmovlpd	%xmm0, -48(%rbp)
	testl	%ebx, %ebx
	jne	.LBB115_21
.LBB115_35:                             # %if.else61
	testl	%r13d, %r13d
	je	.LBB115_36
# %bb.37:                               # %if.end65
	movq	%r14, -64(%rbp)                 # 8-byte Spill
	movabsq	$4503599627370495, %rax         # imm = 0xFFFFFFFFFFFFF
	incq	%rax
	orq	%rax, %r15
	movl	%r13d, %r14d
	subl	$1075, %r14d                    # imm = 0x433
	jae	.LBB115_40
# %bb.38:                               # %if.end102.thread
	movb	$51, %dl
	subb	%r13b, %dl
	xorl	%eax, %eax
	cmpl	$1023, %r13d                    # imm = 0x3FF
	shrxq	%rdx, %r15, %rcx
	shlxq	%rdx, %rcx, %rdx
	cmovbq	%rax, %rcx
	cmovbq	%rax, %rdx
	subq	%rdx, %r15
	vmovq	%r15, %xmm0
	vmovdqa	.LCPI115_6(%rip), %xmm1         # xmm1 = [1127219200,1160773632,0,0]
	vpunpckldq	%xmm1, %xmm0, %xmm0     # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
	vmovapd	.LCPI115_7(%rip), %xmm2         # xmm2 = [4.503599627370496E+15,1.9342813113834067E+25]
	vsubpd	%xmm2, %xmm0, %xmm0
	vpermilpd	$1, %xmm0, %xmm3        # xmm3 = xmm0[1,0]
	vaddsd	%xmm0, %xmm3, %xmm0
	shlq	$52, %r14
	movabsq	$4696837146684686336, %rdx      # imm = 0x412E848000000000
	addq	%r14, %rdx
	vmovq	%rdx, %xmm3
	vfmadd213sd	.LCPI115_4(%rip), %xmm0, %xmm3 # xmm3 = (xmm0 * xmm3) + mem
	vcvttsd2si	%xmm3, %rdx
	movq	%rdx, %rsi
	sarq	$63, %rsi
	vsubsd	.LCPI115_5(%rip), %xmm3, %xmm0
	vcvttsd2si	%xmm0, %r15
	andq	%rsi, %r15
	orq	%rdx, %r15
	vmovq	%r15, %xmm0
	vpunpckldq	%xmm1, %xmm0, %xmm0     # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
	vsubpd	%xmm2, %xmm0, %xmm0
	vpermilpd	$1, %xmm0, %xmm1        # xmm1 = xmm0[1,0]
	vaddsd	%xmm0, %xmm1, %xmm0
	vucomisd	%xmm0, %xmm3
	setnp	%dl
	sete	%bl
	andb	%dl, %bl
	movl	%r15d, %edx
	andb	%bl, %dl
	movzbl	%dl, %edx
	subq	%rdx, %r15
	xorl	%edx, %edx
	cmpq	$1000000, %r15                  # imm = 0xF4240
	cmoveq	%rax, %r15
	sete	%dl
	addq	%rcx, %rdx
	leaq	-64(%rbp), %rsi
	leaq	-96(%rbp), %rbx
	movq	%rbx, %rdi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	jmp	.LBB115_39
.LBB115_7:                              # %if.then11
	leaq	.L.str.3.59(%rip), %rdx
	jmp	.LBB115_4
.LBB115_13:                             # %if.then22
	leaq	.L.str.5.61(%rip), %rdx
	jmp	.LBB115_4
.LBB115_31:                             # %if.else55
	leaq	.L.str.12.68(%rip), %rdx
	movq	%rax, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	negl	%ebx
.LBB115_32:                             # %if.end58
	movl	%ebx, %edx
	movq	%rax, %rdi
	movq	%r12, %rsi
	movl	$2, %ecx
	jmp	.LBB115_33
.LBB115_16:                             # %if.then28
	leaq	.L.str.7.63(%rip), %rdx
.LBB115_4:                              # %cleanup145
	movq	%r14, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	jmp	.LBB115_34
.LBB115_36:                             # %if.then63
	vxorpd	%xmm0, %xmm0, %xmm0
	movq	%r14, %rdi
	movq	%r12, %rsi
	xorl	%edx, %edx
	callq	halide_double_to_string@PLT
	jmp	.LBB115_34
.LBB115_40:                             # %if.end102
	leaq	-64(%rbp), %rsi
	leaq	-96(%rbp), %rbx
	movq	%rbx, %rdi
	movq	%r15, %rdx
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	xorl	%r15d, %r15d
	testl	%r14d, %r14d
	je	.LBB115_39
# %bb.41:                               # %for.cond109.preheader.preheader
	xorl	%r8d, %r8d
	jmp	.LBB115_42
	.p2align	4, 0x90
.LBB115_47:                             # %if.end135
                                        #   in Loop: Header=BB115_42 Depth=1
	movq	%rdx, %rbx
.LBB115_48:                             # %if.end135
                                        #   in Loop: Header=BB115_42 Depth=1
	incl	%r8d
	cmpl	%r14d, %r8d
	je	.LBB115_39
.LBB115_42:                             # %for.cond109.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB115_44 Depth 2
	movq	%rbx, %rdx
	movq	%rax, %rbx
	cmpq	%rdx, %rax
	je	.LBB115_48
# %bb.43:                               # %for.body113.preheader
                                        #   in Loop: Header=BB115_42 Depth=1
	xorl	%edi, %edi
	movq	%rax, %rsi
	.p2align	4, 0x90
.LBB115_44:                             # %for.body113
                                        #   Parent Loop BB115_42 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzbl	-1(%rsi), %ebx
	addb	$-48, %bl
	movzbl	%bl, %ebx
	addl	%ebx, %ebx
	orl	%edi, %ebx
	leal	-10(%rbx), %ecx
	xorl	%edi, %edi
	cmpb	$10, %bl
	setge	%dil
	movzbl	%cl, %ecx
	cmovll	%ebx, %ecx
	addb	$48, %cl
	movb	%cl, -1(%rsi)
	leaq	-1(%rsi), %rcx
	movq	%rcx, %rsi
	cmpq	%rdx, %rcx
	jne	.LBB115_44
# %bb.45:                               # %for.cond.cleanup112
                                        #   in Loop: Header=BB115_42 Depth=1
	cmpb	$9, %bl
	jle	.LBB115_47
# %bb.46:                               # %if.then133
                                        #   in Loop: Header=BB115_42 Depth=1
	movb	$49, -1(%rdx)
	decq	%rdx
	jmp	.LBB115_47
.LBB115_39:                             # %for.cond.cleanup
	movq	-64(%rbp), %rdi                 # 8-byte Reload
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	halide_string_to_string@PLT
	leaq	.L.str.30.141(%rip), %rdx
	movq	%rax, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%r12, %rsi
	movq	%r15, %rdx
	movl	$6, %ecx
.LBB115_33:                             # %cleanup145
	callq	halide_int64_to_string@PLT
.LBB115_34:                             # %cleanup145
	addq	$536, %rsp                      # imm = 0x218
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end115:
	.size	halide_double_to_string, .Lfunc_end115-halide_double_to_string
                                        # -- End function
	.section	.text.halide_pointer_to_string,"ax",@progbits
	.weak	halide_pointer_to_string        # -- Begin function halide_pointer_to_string
	.p2align	4, 0x90
	.type	halide_pointer_to_string,@function
halide_pointer_to_string:               # @halide_pointer_to_string
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	vxorps	%xmm0, %xmm0, %xmm0
	vmovaps	%xmm0, -32(%rbp)
	movl	$0, -16(%rbp)
	movl	%edx, %eax
	andl	$15, %eax
	leaq	.L.str.13.71(%rip), %r8
	movb	(%rax,%r8), %cl
	leaq	-15(%rbp), %rax
	movb	%cl, -14(%rbp)
	cmpq	$16, %rdx
	jae	.LBB116_2
# %bb.1:
	leaq	-14(%rbp), %rdx
	jmp	.LBB116_22
.LBB116_2:                              # %for.inc
	movl	%edx, %ecx
	shrl	$4, %ecx
	andl	$15, %ecx
	movb	(%rcx,%r8), %cl
	leaq	-16(%rbp), %r9
	movb	%cl, -15(%rbp)
	cmpq	$256, %rdx                      # imm = 0x100
	jb	.LBB116_21
# %bb.3:                                # %for.inc.1
	movl	%edx, %eax
	shrl	$8, %eax
	andl	$15, %eax
	movb	(%rax,%r8), %cl
	leaq	-17(%rbp), %rax
	movb	%cl, -16(%rbp)
	cmpq	$4096, %rdx                     # imm = 0x1000
	jb	.LBB116_4
# %bb.5:                                # %for.inc.2
	movl	%edx, %ecx
	shrl	$12, %ecx
	andl	$15, %ecx
	movb	(%rcx,%r8), %cl
	leaq	-18(%rbp), %r9
	movb	%cl, -17(%rbp)
	cmpq	$65536, %rdx                    # imm = 0x10000
	jb	.LBB116_21
# %bb.6:                                # %for.inc.3
	movl	%edx, %eax
	shrl	$16, %eax
	andl	$15, %eax
	movb	(%rax,%r8), %cl
	leaq	-19(%rbp), %rax
	movb	%cl, -18(%rbp)
	cmpq	$1048576, %rdx                  # imm = 0x100000
	jb	.LBB116_4
# %bb.8:                                # %for.inc.4
	movl	%edx, %ecx
	shrl	$20, %ecx
	andl	$15, %ecx
	movb	(%rcx,%r8), %cl
	leaq	-20(%rbp), %r9
	movb	%cl, -19(%rbp)
	cmpq	$16777216, %rdx                 # imm = 0x1000000
	jb	.LBB116_21
# %bb.9:                                # %for.inc.5
	movl	%edx, %eax
	shrl	$24, %eax
	andl	$15, %eax
	movb	(%rax,%r8), %cl
	leaq	-21(%rbp), %rax
	movb	%cl, -20(%rbp)
	cmpq	$268435456, %rdx                # imm = 0x10000000
	jb	.LBB116_4
# %bb.11:                               # %for.inc.6
	movl	%edx, %ecx
	shrl	$28, %ecx
	movb	(%rcx,%r8), %cl
	leaq	-22(%rbp), %r9
	movb	%cl, -21(%rbp)
	movq	%rdx, %rcx
	shrq	$32, %rcx
	je	.LBB116_21
# %bb.12:                               # %for.inc.7
	andl	$15, %ecx
	movb	(%rcx,%r8), %cl
	leaq	-23(%rbp), %rax
	movb	%cl, -22(%rbp)
	movq	%rdx, %rcx
	shrq	$36, %rcx
	je	.LBB116_4
# %bb.14:                               # %for.inc.8
	andl	$15, %ecx
	movb	(%rcx,%r8), %cl
	leaq	-24(%rbp), %r9
	movb	%cl, -23(%rbp)
	movq	%rdx, %rcx
	shrq	$40, %rcx
	je	.LBB116_21
# %bb.15:                               # %for.inc.9
	andl	$15, %ecx
	movb	(%rcx,%r8), %cl
	leaq	-25(%rbp), %rax
	movb	%cl, -24(%rbp)
	movq	%rdx, %rcx
	shrq	$44, %rcx
	je	.LBB116_4
# %bb.17:                               # %for.inc.10
	andl	$15, %ecx
	movb	(%rcx,%r8), %cl
	leaq	-26(%rbp), %r9
	movb	%cl, -25(%rbp)
	movq	%rdx, %rcx
	shrq	$48, %rcx
	je	.LBB116_21
# %bb.18:                               # %for.inc.11
	andl	$15, %ecx
	movb	(%rcx,%r8), %cl
	leaq	-27(%rbp), %rax
	movb	%cl, -26(%rbp)
	movq	%rdx, %rcx
	shrq	$52, %rcx
	je	.LBB116_4
# %bb.20:                               # %for.inc.12
	andl	$15, %ecx
	movb	(%rcx,%r8), %cl
	leaq	-28(%rbp), %r9
	movb	%cl, -27(%rbp)
	movq	%rdx, %rcx
	shrq	$56, %rcx
	jne	.LBB116_23
.LBB116_21:
	movq	%rax, %rdx
	movq	%r9, %rax
	jmp	.LBB116_22
.LBB116_23:                             # %for.inc.13
	andl	$15, %ecx
	movb	(%rcx,%r8), %cl
	leaq	-29(%rbp), %rax
	movb	%cl, -28(%rbp)
	shrq	$60, %rdx
	jne	.LBB116_25
.LBB116_4:
	movq	%r9, %rdx
.LBB116_22:                             # %cleanup
	movb	$120, (%rax)
	movb	$48, -2(%rdx)
	addq	$-2, %rdx
	callq	halide_string_to_string@PLT
	addq	$32, %rsp
	popq	%rbp
	retq
.LBB116_25:                             # %for.inc.14
	movb	(%rdx,%r8), %cl
	movq	%rax, %rdx
	leaq	-30(%rbp), %rax
	movb	%cl, -29(%rbp)
	jmp	.LBB116_22
.Lfunc_end116:
	.size	halide_pointer_to_string, .Lfunc_end116-halide_pointer_to_string
                                        # -- End function
	.section	.text.halide_type_to_string,"ax",@progbits
	.weak	halide_type_to_string           # -- Begin function halide_type_to_string
	.p2align	4, 0x90
	.type	halide_type_to_string,@function
halide_type_to_string:                  # @halide_type_to_string
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	movq	%rdx, %rbx
	movq	%rsi, %r14
	movsbq	(%rdx), %rax
	cmpq	$3, %rax
	ja	.LBB117_1
# %bb.2:                                # %switch.lookup
	leaq	.Lreltable.halide_type_to_string(%rip), %rcx
	movslq	(%rcx,%rax,4), %rdx
	addq	%rcx, %rdx
	jmp	.LBB117_3
.LBB117_1:
	leaq	.L.str.18.72(%rip), %rdx
.LBB117_3:                              # %sw.epilog
	movq	%r14, %rsi
	callq	halide_string_to_string@PLT
	movzbl	1(%rbx), %edx
	movq	%rax, %rdi
	movq	%r14, %rsi
	movl	$1, %ecx
	callq	halide_uint64_to_string@PLT
	cmpw	$1, 2(%rbx)
	jne	.LBB117_5
# %bb.4:                                # %if.end
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.LBB117_5:                              # %if.then
	leaq	.L.str.19.77(%rip), %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	callq	halide_string_to_string@PLT
	movzwl	2(%rbx), %edx
	movq	%rax, %rdi
	movq	%r14, %rsi
	movl	$1, %ecx
	popq	%rbx
	popq	%r14
	popq	%rbp
	jmp	halide_uint64_to_string@PLT     # TAILCALL
.Lfunc_end117:
	.size	halide_type_to_string, .Lfunc_end117-halide_type_to_string
                                        # -- End function
	.section	.text.halide_buffer_to_string,"ax",@progbits
	.weak	halide_buffer_to_string         # -- Begin function halide_buffer_to_string
	.p2align	4, 0x90
	.type	halide_buffer_to_string,@function
halide_buffer_to_string:                # @halide_buffer_to_string
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movq	%rsi, %rbx
	testq	%rdx, %rdx
	je	.LBB118_1
# %bb.3:                                # %if.end
	movq	%rdx, %r14
	leaq	.L.str.21.79(%rip), %rdx
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	(%r14), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_uint64_to_string@PLT
	leaq	.L.str.55(%rip), %r15
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	halide_string_to_string@PLT
	movq	8(%r14), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_pointer_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	halide_string_to_string@PLT
	movq	16(%r14), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_pointer_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	halide_string_to_string@PLT
	movq	24(%r14), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_uint64_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	halide_string_to_string@PLT
	leaq	32(%r14), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_type_to_string@PLT
	cmpl	$0, 36(%r14)
	jle	.LBB118_6
# %bb.4:                                # %for.body.lr.ph
	xorl	%r15d, %r15d
	leaq	.L.str.55(%rip), %r12
	xorl	%r13d, %r13d
	.p2align	4, 0x90
.LBB118_5:                              # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movq	%rax, %rdi
	movq	%rbx, %rsi
	leaq	.L.str.23.82(%rip), %rdx
	callq	halide_string_to_string@PLT
	movq	40(%r14), %rcx
	movslq	(%rcx,%r15), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r12, %rdx
	callq	halide_string_to_string@PLT
	movq	40(%r14), %rcx
	movslq	4(%rcx,%r15), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r12, %rdx
	callq	halide_string_to_string@PLT
	movq	40(%r14), %rcx
	movslq	8(%rcx,%r15), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	leaq	.L.str.24.83(%rip), %rdx
	callq	halide_string_to_string@PLT
	incq	%r13
	movslq	36(%r14), %rcx
	addq	$16, %r15
	cmpq	%rcx, %r13
	jl	.LBB118_5
.LBB118_6:                              # %for.cond.cleanup
	leaq	.L.str.8.119(%rip), %rdx
	movq	%rax, %rdi
	jmp	.LBB118_2
.LBB118_1:                              # %if.then
	leaq	.L.str.20.78(%rip), %rdx
.LBB118_2:                              # %if.then
	movq	%rbx, %rsi
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	halide_string_to_string@PLT     # TAILCALL
.Lfunc_end118:
	.size	halide_buffer_to_string, .Lfunc_end118-halide_buffer_to_string
                                        # -- End function
	.section	.text.halide_malloc_alignment,"ax",@progbits
	.weak	halide_malloc_alignment         # -- Begin function halide_malloc_alignment
	.p2align	4, 0x90
	.type	halide_malloc_alignment,@function
halide_malloc_alignment:                # @halide_malloc_alignment
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$64, %eax
	popq	%rbp
	retq
.Lfunc_end119:
	.size	halide_malloc_alignment, .Lfunc_end119-halide_malloc_alignment
                                        # -- End function
	.section	.text.halide_reuse_device_allocations,"ax",@progbits
	.weak	halide_reuse_device_allocations # -- Begin function halide_reuse_device_allocations
	.p2align	4, 0x90
	.type	halide_reuse_device_allocations,@function
halide_reuse_device_allocations:        # @halide_reuse_device_allocations
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	movq	_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE@GOTPCREL(%rip), %rax
	movb	%sil, (%rax)
	xorl	%r15d, %r15d
	testl	%esi, %esi
	jne	.LBB120_4
# %bb.1:                                # %if.then
	movq	%rdi, %r14
	movq	_ZN6Halide7Runtime8Internal21allocation_pools_lockE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_lock@PLT
	movq	_ZN6Halide7Runtime8Internal23device_allocation_poolsE@GOTPCREL(%rip), %rax
	movq	(%rax), %rbx
	xorl	%r15d, %r15d
	testq	%rbx, %rbx
	je	.LBB120_3
	.p2align	4, 0x90
.LBB120_5:                              # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movq	%r14, %rdi
	callq	*(%rbx)
	testl	%eax, %eax
	cmovnel	%eax, %r15d
	movq	8(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.LBB120_5
.LBB120_3:                              # %for.cond.cleanup
	movq	_ZN6Halide7Runtime8Internal21allocation_pools_lockE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_unlock@PLT
.LBB120_4:                              # %if.end5
	movl	%r15d, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end120:
	.size	halide_reuse_device_allocations, .Lfunc_end120-halide_reuse_device_allocations
                                        # -- End function
	.section	.text.halide_can_reuse_device_allocations,"ax",@progbits
	.weak	halide_can_reuse_device_allocations # -- Begin function halide_can_reuse_device_allocations
	.p2align	4, 0x90
	.type	halide_can_reuse_device_allocations,@function
halide_can_reuse_device_allocations:    # @halide_can_reuse_device_allocations
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE@GOTPCREL(%rip), %rax
	movb	(%rax), %al
	popq	%rbp
	retq
.Lfunc_end121:
	.size	halide_can_reuse_device_allocations, .Lfunc_end121-halide_can_reuse_device_allocations
                                        # -- End function
	.section	.text.halide_register_device_allocation_pool,"ax",@progbits
	.weak	halide_register_device_allocation_pool # -- Begin function halide_register_device_allocation_pool
	.p2align	4, 0x90
	.type	halide_register_device_allocation_pool,@function
halide_register_device_allocation_pool: # @halide_register_device_allocation_pool
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	movq	%rdi, %rbx
	movq	_ZN6Halide7Runtime8Internal21allocation_pools_lockE@GOTPCREL(%rip), %r14
	movq	%r14, %rdi
	callq	halide_mutex_lock@PLT
	movq	_ZN6Halide7Runtime8Internal23device_allocation_poolsE@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	movq	%rcx, 8(%rbx)
	movq	%rbx, (%rax)
	movq	%r14, %rdi
	popq	%rbx
	popq	%r14
	popq	%rbp
	jmp	halide_mutex_unlock@PLT         # TAILCALL
.Lfunc_end122:
	.size	halide_register_device_allocation_pool, .Lfunc_end122-halide_register_device_allocation_pool
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t # -- Begin function _ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t,@function
_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t: # @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	movq	24(%rsi), %rax
	xorl	%ebx, %ebx
	testb	$2, %al
	je	.LBB123_6
# %bb.1:                                # %if.end
	movl	$-14, %ebx
	testb	$1, %al
	jne	.LBB123_6
# %bb.2:                                # %if.end9
	movq	%rsi, %r14
	movq	8(%rsi), %rax
	testq	%rax, %rax
	je	.LBB123_3
# %bb.4:                                # %if.end15
	movq	%rdi, %r15
	movq	120(%rax), %rax
	movq	%r14, %rsi
	callq	*48(%rax)
	testl	%eax, %eax
	jne	.LBB123_6
# %bb.5:                                # %if.end23
	andb	$-3, 24(%r14)
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	halide_msan_annotate_buffer_is_initialized@PLT
	xorl	%ebx, %ebx
	jmp	.LBB123_6
.LBB123_3:
	movl	$-19, %ebx
.LBB123_6:                              # %return
	movl	%ebx, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end123:
	.size	_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t, .Lfunc_end123-_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t
                                        # -- End function
	.section	.text.halide_device_release,"ax",@progbits
	.weak	halide_device_release           # -- Begin function halide_device_release
	.p2align	4, 0x90
	.type	halide_device_release,@function
halide_device_release:                  # @halide_device_release
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	120(%rsi), %rax
	popq	%rbp
	jmpq	*40(%rax)                       # TAILCALL
.Lfunc_end124:
	.size	halide_device_release, .Lfunc_end124-halide_device_release
                                        # -- End function
	.section	.text.halide_copy_to_host,"ax",@progbits
	.weak	halide_copy_to_host             # -- Begin function halide_copy_to_host
	.p2align	4, 0x90
	.type	halide_copy_to_host,@function
halide_copy_to_host:                    # @halide_copy_to_host
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	movq	%rsi, %r15
	movq	%rdi, %r14
	movq	_ZN6Halide7Runtime8Internal17device_copy_mutexE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_lock@PLT
	testq	%r15, %r15
	je	.LBB125_1
# %bb.2:                                # %if.end.i
	movq	(%r15), %rax
	movq	8(%r15), %rcx
	testq	%rax, %rax
	je	.LBB125_5
# %bb.3:                                # %if.end.i
	testq	%rcx, %rcx
	jne	.LBB125_5
# %bb.4:                                # %if.then8.i
	movq	%r14, %rdi
	callq	halide_error_no_device_interface@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB125_12
	jmp	.LBB125_11
.LBB125_1:                              # %if.then.i
	leaq	.L.str.6.88(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error_buffer_is_null@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB125_12
	jmp	.LBB125_11
.LBB125_5:                              # %if.end10.i
	testq	%rcx, %rcx
	je	.LBB125_8
# %bb.6:                                # %if.end10.i
	testq	%rax, %rax
	jne	.LBB125_8
# %bb.7:                                # %if.then14.i
	movq	%r14, %rdi
	callq	halide_error_device_interface_no_device@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB125_12
	jmp	.LBB125_11
.LBB125_8:                              # %if.end16.i
	movl	24(%r15), %eax
	notl	%eax
	testb	$3, %al
	jne	.LBB125_11
# %bb.9:                                # %if.then24.i
	movq	%r14, %rdi
	callq	halide_error_host_and_device_dirty@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB125_12
.LBB125_11:                             # %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t@PLT
	movl	%eax, %ebx
.LBB125_12:                             # %cleanup
	movq	_ZN6Halide7Runtime8Internal17device_copy_mutexE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_unlock@PLT
	movl	%ebx, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end125:
	.size	halide_copy_to_host, .Lfunc_end125-halide_copy_to_host
                                        # -- End function
	.section	.text.copy_to_device_already_locked,"ax",@progbits
	.weak	copy_to_device_already_locked   # -- Begin function copy_to_device_already_locked
	.p2align	4, 0x90
	.type	copy_to_device_already_locked,@function
copy_to_device_already_locked:          # @copy_to_device_already_locked
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	movq	%rdx, %r15
	movq	%rsi, %r12
	movq	%rdi, %r14
	testq	%rsi, %rsi
	je	.LBB126_1
# %bb.2:                                # %if.end.i
	movq	(%r12), %rax
	movq	8(%r12), %rcx
	testq	%rax, %rax
	je	.LBB126_5
# %bb.3:                                # %if.end.i
	testq	%rcx, %rcx
	jne	.LBB126_5
# %bb.4:                                # %if.then8.i
	movq	%r14, %rdi
	callq	halide_error_no_device_interface@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB126_21
	jmp	.LBB126_11
.LBB126_1:                              # %if.then.i
	leaq	.L.str.7.89(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error_buffer_is_null@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB126_21
	jmp	.LBB126_11
.LBB126_5:                              # %if.end10.i
	testq	%rcx, %rcx
	je	.LBB126_8
# %bb.6:                                # %if.end10.i
	testq	%rax, %rax
	jne	.LBB126_8
# %bb.7:                                # %if.then14.i
	movq	%r14, %rdi
	callq	halide_error_device_interface_no_device@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB126_21
	jmp	.LBB126_11
.LBB126_8:                              # %if.end16.i
	movl	24(%r12), %eax
	notl	%eax
	testb	$3, %al
	jne	.LBB126_11
# %bb.9:                                # %if.then24.i
	movq	%r14, %rdi
	callq	halide_error_host_and_device_dirty@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB126_21
.LBB126_11:                             # %if.end
	testq	%r15, %r15
	jne	.LBB126_13
# %bb.12:                               # %if.then2
	movq	8(%r12), %r15
	testq	%r15, %r15
	je	.LBB126_22
.LBB126_13:                             # %if.end11
	cmpq	$0, (%r12)
	je	.LBB126_16
# %bb.14:                               # %land.lhs.true
	cmpq	%r15, 8(%r12)
	je	.LBB126_17
# %bb.15:                               # %if.then14
	leaq	.L.str.9.90(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error@PLT
	movl	$-42, %ebx
	jmp	.LBB126_21
.LBB126_16:                             # %if.then18
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%r15, %rdx
	callq	halide_device_malloc@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB126_21
.LBB126_17:                             # %if.end27
	movq	24(%r12), %rax
	xorl	%ebx, %ebx
	testb	$1, %al
	je	.LBB126_21
# %bb.18:                               # %if.then29
	movl	$-15, %ebx
	testb	$2, %al
	jne	.LBB126_21
# %bb.19:                               # %if.else
	movq	120(%r15), %rax
	movq	%r14, %rdi
	movq	%r12, %rsi
	callq	*56(%rax)
	testl	%eax, %eax
	jne	.LBB126_21
# %bb.20:                               # %if.then46
	andb	$-2, 24(%r12)
	xorl	%ebx, %ebx
.LBB126_21:                             # %cleanup
	movl	%ebx, %eax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB126_22:                             # %if.then7
	movq	%r14, %rdi
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	halide_error_no_device_interface@PLT # TAILCALL
.Lfunc_end126:
	.size	copy_to_device_already_locked, .Lfunc_end126-copy_to_device_already_locked
                                        # -- End function
	.section	.text.halide_device_malloc,"ax",@progbits
	.weak	halide_device_malloc            # -- Begin function halide_device_malloc
	.p2align	4, 0x90
	.type	halide_device_malloc,@function
halide_device_malloc:                   # @halide_device_malloc
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	movq	%rdx, %r14
	movq	%rsi, %rbx
	movq	%rdi, %r15
	testq	%rsi, %rsi
	je	.LBB127_1
# %bb.2:                                # %if.end.i
	movq	(%rbx), %rcx
	movq	8(%rbx), %rax
	testq	%rcx, %rcx
	je	.LBB127_5
# %bb.3:                                # %if.end.i
	testq	%rax, %rax
	jne	.LBB127_5
# %bb.4:                                # %if.then8.i
	movq	%r15, %rdi
	callq	halide_error_no_device_interface@PLT
	testl	%eax, %eax
	jne	.LBB127_16
	jmp	.LBB127_11
.LBB127_1:                              # %if.then.i
	leaq	.L.str.17.91(%rip), %rsi
	movq	%r15, %rdi
	callq	halide_error_buffer_is_null@PLT
	testl	%eax, %eax
	jne	.LBB127_16
	jmp	.LBB127_11
.LBB127_5:                              # %if.end10.i
	testq	%rax, %rax
	je	.LBB127_8
# %bb.6:                                # %if.end10.i
	testq	%rcx, %rcx
	jne	.LBB127_8
# %bb.7:                                # %if.then14.i
	movq	%r15, %rdi
	callq	halide_error_device_interface_no_device@PLT
	testl	%eax, %eax
	jne	.LBB127_16
	jmp	.LBB127_11
.LBB127_8:                              # %if.end16.i
	movl	24(%rbx), %ecx
	notl	%ecx
	testb	$3, %cl
	jne	.LBB127_12
# %bb.9:                                # %if.then24.i
	movq	%r15, %rdi
	callq	halide_error_host_and_device_dirty@PLT
	testl	%eax, %eax
	jne	.LBB127_16
.LBB127_11:                             # %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	movq	8(%rbx), %rax
.LBB127_12:                             # %if.end
	testq	%rax, %rax
	je	.LBB127_15
# %bb.13:                               # %if.end
	cmpq	%r14, %rax
	je	.LBB127_15
# %bb.14:                               # %if.then6
	leaq	.L.str.20.92(%rip), %rsi
	movq	%r15, %rdi
	callq	halide_error@PLT
	movl	$-42, %eax
	jmp	.LBB127_16
.LBB127_15:                             # %if.end7
	movq	120(%r14), %rax
	callq	*(%rax)
	movq	120(%r14), %rax
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	*16(%rax)
	movl	%eax, %ebx
	movq	120(%r14), %rax
	callq	*8(%rax)
	xorl	%eax, %eax
	testl	%ebx, %ebx
	sete	%al
	shll	$4, %eax
	addl	$-16, %eax
.LBB127_16:                             # %cleanup12
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end127:
	.size	halide_device_malloc, .Lfunc_end127-halide_device_malloc
                                        # -- End function
	.section	.text.halide_copy_to_device,"ax",@progbits
	.weak	halide_copy_to_device           # -- Begin function halide_copy_to_device
	.p2align	4, 0x90
	.type	halide_copy_to_device,@function
halide_copy_to_device:                  # @halide_copy_to_device
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	movq	%rdx, %r14
	movq	%rsi, %r15
	movq	%rdi, %rbx
	movq	_ZN6Halide7Runtime8Internal17device_copy_mutexE@GOTPCREL(%rip), %r12
	movq	%r12, %rdi
	callq	halide_mutex_lock@PLT
	movq	%rbx, %rdi
	movq	%r15, %rsi
	movq	%r14, %rdx
	callq	copy_to_device_already_locked@PLT
	movl	%eax, %ebx
	movq	%r12, %rdi
	callq	halide_mutex_unlock@PLT
	movl	%ebx, %eax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end128:
	.size	halide_copy_to_device, .Lfunc_end128-halide_copy_to_device
                                        # -- End function
	.section	.text.halide_device_sync,"ax",@progbits
	.weak	halide_device_sync              # -- Begin function halide_device_sync
	.p2align	4, 0x90
	.type	halide_device_sync,@function
halide_device_sync:                     # @halide_device_sync
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	movq	%rsi, %rbx
	movq	%rdi, %r14
	testq	%rsi, %rsi
	je	.LBB129_1
# %bb.2:                                # %if.end.i
	movq	(%rbx), %rcx
	movq	8(%rbx), %rax
	testq	%rcx, %rcx
	je	.LBB129_5
# %bb.3:                                # %if.end.i
	testq	%rax, %rax
	jne	.LBB129_5
# %bb.4:                                # %if.then8.i
	movq	%r14, %rdi
	callq	halide_error_no_device_interface@PLT
	testl	%eax, %eax
	jne	.LBB129_14
	jmp	.LBB129_11
.LBB129_1:                              # %if.then.i
	leaq	.L.str.16.93(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error_buffer_is_null@PLT
	testl	%eax, %eax
	jne	.LBB129_14
	jmp	.LBB129_11
.LBB129_5:                              # %if.end10.i
	testq	%rax, %rax
	je	.LBB129_8
# %bb.6:                                # %if.end10.i
	testq	%rcx, %rcx
	jne	.LBB129_8
# %bb.7:                                # %if.then14.i
	movq	%r14, %rdi
	callq	halide_error_device_interface_no_device@PLT
	testl	%eax, %eax
	je	.LBB129_11
.LBB129_14:                             # %cleanup8
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.LBB129_8:                              # %if.end16.i
	movl	24(%rbx), %ecx
	notl	%ecx
	testb	$3, %cl
	jne	.LBB129_12
# %bb.9:                                # %if.then24.i
	movq	%r14, %rdi
	callq	halide_error_host_and_device_dirty@PLT
	testl	%eax, %eax
	jne	.LBB129_14
.LBB129_11:                             # %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	movq	8(%rbx), %rax
.LBB129_12:                             # %if.end
	testq	%rax, %rax
	je	.LBB129_15
# %bb.13:                               # %if.end5
	movq	120(%rax), %rax
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	*32(%rax)
	movl	%eax, %ecx
	testl	%eax, %eax
	movl	$-17, %eax
	cmovel	%ecx, %eax
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.LBB129_15:                             # %if.then3
	movq	%r14, %rdi
	popq	%rbx
	popq	%r14
	popq	%rbp
	jmp	halide_error_no_device_interface@PLT # TAILCALL
.Lfunc_end129:
	.size	halide_device_sync, .Lfunc_end129-halide_device_sync
                                        # -- End function
	.section	.text.halide_device_free,"ax",@progbits
	.weak	halide_device_free              # -- Begin function halide_device_free
	.p2align	4, 0x90
	.type	halide_device_free,@function
halide_device_free:                     # @halide_device_free
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	movq	%rsi, %r12
	movq	%rdi, %r14
	testq	%rsi, %rsi
	je	.LBB130_1
# %bb.2:                                # %if.end.i
	movq	(%r12), %rax
	movq	8(%r12), %rbx
	testq	%rax, %rax
	je	.LBB130_5
# %bb.3:                                # %if.end.i
	testq	%rbx, %rbx
	jne	.LBB130_5
# %bb.4:                                # %if.then8.i
	movq	%r14, %rdi
	callq	halide_error_no_device_interface@PLT
	testl	%eax, %eax
	jne	.LBB130_17
	jmp	.LBB130_11
.LBB130_1:                              # %if.then.i
	leaq	.L.str.21.96(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error_buffer_is_null@PLT
	testl	%eax, %eax
	jne	.LBB130_17
	jmp	.LBB130_11
.LBB130_5:                              # %if.end10.i
	testq	%rbx, %rbx
	je	.LBB130_8
# %bb.6:                                # %if.end10.i
	testq	%rax, %rax
	jne	.LBB130_8
# %bb.7:                                # %if.then14.i
	movq	%r14, %rdi
	callq	halide_error_device_interface_no_device@PLT
	testl	%eax, %eax
	jne	.LBB130_17
	jmp	.LBB130_11
.LBB130_8:                              # %if.end16.i
	movl	24(%r12), %eax
	notl	%eax
	testb	$3, %al
	jne	.LBB130_12
# %bb.9:                                # %if.then24.i
	movq	%r14, %rdi
	callq	halide_error_host_and_device_dirty@PLT
	testl	%eax, %eax
	jne	.LBB130_17
.LBB130_11:                             # %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	movq	8(%r12), %rbx
.LBB130_12:                             # %if.end
	testq	%rbx, %rbx
	je	.LBB130_16
# %bb.13:                               # %if.then3
	movq	120(%rbx), %rax
	callq	*(%rax)
	movq	120(%rbx), %rax
	movq	%r14, %rdi
	movq	%r12, %rsi
	callq	*24(%rax)
	movl	%eax, %r15d
	movq	120(%rbx), %rax
	callq	*8(%rax)
	cmpq	$0, (%r12)
	je	.LBB130_15
# %bb.14:                               # %if.then8
	leaq	.L.str.22.97(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_print@PLT
	callq	abort@PLT
.LBB130_15:                             # %do.end
	testl	%r15d, %r15d
	movl	$-18, %eax
	cmovel	%r15d, %eax
	jmp	.LBB130_17
.LBB130_16:                             # %if.end11
	andb	$-3, 24(%r12)
	xorl	%eax, %eax
.LBB130_17:                             # %cleanup12
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end130:
	.size	halide_device_free, .Lfunc_end130-halide_device_free
                                        # -- End function
	.section	.text.halide_device_free_as_destructor,"ax",@progbits
	.weak	halide_device_free_as_destructor # -- Begin function halide_device_free_as_destructor
	.p2align	4, 0x90
	.type	halide_device_free_as_destructor,@function
halide_device_free_as_destructor:       # @halide_device_free_as_destructor
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	popq	%rbp
	jmp	halide_device_free@PLT          # TAILCALL
.Lfunc_end131:
	.size	halide_device_free_as_destructor, .Lfunc_end131-halide_device_free_as_destructor
                                        # -- End function
	.section	.text.halide_device_and_host_malloc,"ax",@progbits
	.weak	halide_device_and_host_malloc   # -- Begin function halide_device_and_host_malloc
	.p2align	4, 0x90
	.type	halide_device_and_host_malloc,@function
halide_device_and_host_malloc:          # @halide_device_and_host_malloc
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	movq	%rdx, %r14
	movq	%rsi, %r12
	movq	%rdi, %r15
	testq	%rsi, %rsi
	je	.LBB132_1
# %bb.2:                                # %if.end.i
	movq	(%r12), %rcx
	movq	8(%r12), %rax
	testq	%rcx, %rcx
	je	.LBB132_5
# %bb.3:                                # %if.end.i
	testq	%rax, %rax
	jne	.LBB132_5
# %bb.4:                                # %if.then8.i
	movq	%r15, %rdi
	callq	halide_error_no_device_interface@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB132_18
	jmp	.LBB132_11
.LBB132_1:                              # %if.then.i
	leaq	.L.str.23.98(%rip), %rsi
	movq	%r15, %rdi
	callq	halide_error_buffer_is_null@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB132_18
	jmp	.LBB132_11
.LBB132_5:                              # %if.end10.i
	testq	%rax, %rax
	je	.LBB132_8
# %bb.6:                                # %if.end10.i
	testq	%rcx, %rcx
	jne	.LBB132_8
# %bb.7:                                # %if.then14.i
	movq	%r15, %rdi
	callq	halide_error_device_interface_no_device@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB132_18
	jmp	.LBB132_11
.LBB132_8:                              # %if.end16.i
	movl	24(%r12), %ecx
	notl	%ecx
	testb	$3, %cl
	jne	.LBB132_12
# %bb.9:                                # %if.then24.i
	movq	%r15, %rdi
	callq	halide_error_host_and_device_dirty@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB132_18
.LBB132_11:                             # %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	movq	8(%r12), %rax
.LBB132_12:                             # %if.end
	testq	%rax, %rax
	je	.LBB132_15
# %bb.13:                               # %if.end
	cmpq	%r14, %rax
	je	.LBB132_15
# %bb.14:
	movl	$-42, %ebx
	leaq	.L.str.25.99(%rip), %rsi
	jmp	.LBB132_17
.LBB132_15:                             # %if.end7
	movq	120(%r14), %rax
	callq	*(%rax)
	movq	120(%r14), %rax
	movq	%r15, %rdi
	movq	%r12, %rsi
	callq	*64(%rax)
	movl	%eax, %ebx
	movq	120(%r14), %rax
	callq	*8(%rax)
	testl	%ebx, %ebx
	je	.LBB132_19
# %bb.16:
	movl	$-16, %ebx
	leaq	.L.str.26.100(%rip), %rsi
.LBB132_17:                             # %cleanup14.sink.split
	movq	%r15, %rdi
	callq	halide_error@PLT
.LBB132_18:                             # %cleanup14
	movl	%ebx, %eax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB132_19:
	xorl	%ebx, %ebx
	jmp	.LBB132_18
.Lfunc_end132:
	.size	halide_device_and_host_malloc, .Lfunc_end132-halide_device_and_host_malloc
                                        # -- End function
	.section	.text.halide_device_and_host_free,"ax",@progbits
	.weak	halide_device_and_host_free     # -- Begin function halide_device_and_host_free
	.p2align	4, 0x90
	.type	halide_device_and_host_free,@function
halide_device_and_host_free:            # @halide_device_and_host_free
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	movq	%rsi, %r12
	movq	%rdi, %r14
	testq	%rsi, %rsi
	je	.LBB133_1
# %bb.2:                                # %if.end.i
	movq	(%r12), %rax
	movq	8(%r12), %rbx
	testq	%rax, %rax
	je	.LBB133_5
# %bb.3:                                # %if.end.i
	testq	%rbx, %rbx
	jne	.LBB133_5
# %bb.4:                                # %if.then8.i
	movq	%r14, %rdi
	callq	halide_error_no_device_interface@PLT
	testl	%eax, %eax
	jne	.LBB133_19
	jmp	.LBB133_11
.LBB133_1:                              # %if.then.i
	leaq	.L.str.27.101(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error_buffer_is_null@PLT
	testl	%eax, %eax
	jne	.LBB133_19
	jmp	.LBB133_11
.LBB133_5:                              # %if.end10.i
	testq	%rbx, %rbx
	je	.LBB133_8
# %bb.6:                                # %if.end10.i
	testq	%rax, %rax
	jne	.LBB133_8
# %bb.7:                                # %if.then14.i
	movq	%r14, %rdi
	callq	halide_error_device_interface_no_device@PLT
	testl	%eax, %eax
	jne	.LBB133_19
	jmp	.LBB133_11
.LBB133_8:                              # %if.end16.i
	movl	24(%r12), %eax
	notl	%eax
	testb	$3, %al
	jne	.LBB133_12
# %bb.9:                                # %if.then24.i
	movq	%r14, %rdi
	callq	halide_error_host_and_device_dirty@PLT
	testl	%eax, %eax
	jne	.LBB133_19
.LBB133_11:                             # %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	movq	8(%r12), %rbx
.LBB133_12:                             # %if.end
	testq	%rbx, %rbx
	je	.LBB133_16
# %bb.13:                               # %if.then3
	movq	120(%rbx), %rax
	callq	*(%rax)
	movq	120(%rbx), %rax
	movq	%r14, %rdi
	movq	%r12, %rsi
	callq	*72(%rax)
	movl	%eax, %r15d
	movq	120(%rbx), %rax
	callq	*8(%rax)
	cmpq	$0, (%r12)
	je	.LBB133_15
# %bb.14:                               # %if.then8
	leaq	.L.str.28.102(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_print@PLT
	callq	abort@PLT
.LBB133_15:                             # %do.end
	testl	%r15d, %r15d
	movl	$-18, %eax
	cmovel	%r15d, %eax
	jmp	.LBB133_19
.LBB133_16:                             # %if.else11
	movq	16(%r12), %rsi
	testq	%rsi, %rsi
	je	.LBB133_18
# %bb.17:                               # %if.then13
	movq	%r14, %rdi
	callq	halide_free@PLT
	movq	$0, 16(%r12)
.LBB133_18:                             # %if.end17
	andb	$-3, 24(%r12)
	xorl	%eax, %eax
.LBB133_19:                             # %cleanup18
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end133:
	.size	halide_device_and_host_free, .Lfunc_end133-halide_device_and_host_free
                                        # -- End function
	.section	.text.halide_default_device_and_host_malloc,"ax",@progbits
	.weak	halide_default_device_and_host_malloc # -- Begin function halide_default_device_and_host_malloc
	.p2align	4, 0x90
	.type	halide_default_device_and_host_malloc,@function
halide_default_device_and_host_malloc:  # @halide_default_device_and_host_malloc
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	movq	%rdx, %r15
	movq	%rsi, %r12
	movq	%rdi, %r14
	testq	%rsi, %rsi
	je	.LBB134_1
# %bb.2:                                # %if.end.i
	movq	(%r12), %rax
	movq	8(%r12), %rcx
	testq	%rax, %rax
	je	.LBB134_5
# %bb.3:                                # %if.end.i
	testq	%rcx, %rcx
	jne	.LBB134_5
# %bb.4:                                # %if.then8.i
	movq	%r14, %rdi
	callq	halide_error_no_device_interface@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB134_27
	jmp	.LBB134_11
.LBB134_1:                              # %if.then.i
	leaq	.L.str.29.103(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error_buffer_is_null@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB134_27
	jmp	.LBB134_11
.LBB134_5:                              # %if.end10.i
	testq	%rcx, %rcx
	je	.LBB134_8
# %bb.6:                                # %if.end10.i
	testq	%rax, %rax
	jne	.LBB134_8
# %bb.7:                                # %if.then14.i
	movq	%r14, %rdi
	callq	halide_error_device_interface_no_device@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB134_27
	jmp	.LBB134_11
.LBB134_8:                              # %if.end16.i
	movl	24(%r12), %eax
	notl	%eax
	testb	$3, %al
	jne	.LBB134_11
# %bb.9:                                # %if.then24.i
	movq	%r14, %rdi
	callq	halide_error_host_and_device_dirty@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB134_27
.LBB134_11:                             # %if.end
	movl	36(%r12), %ecx
	testl	%ecx, %ecx
	jle	.LBB134_12
# %bb.13:                               # %for.body.lr.ph.i.i
	movq	40(%r12), %rdx
	shlq	$4, %rcx
	xorl	%esi, %esi
	xorl	%r8d, %r8d
	jmp	.LBB134_14
	.p2align	4, 0x90
.LBB134_16:                             # %if.end.i.i
                                        #   in Loop: Header=BB134_14 Depth=1
	addq	$16, %rsi
	cmpq	%rsi, %rcx
	je	.LBB134_17
.LBB134_14:                             # %for.body.i.i
                                        # =>This Inner Loop Header: Depth=1
	movl	8(%rdx,%rsi), %edi
	testl	%edi, %edi
	jle	.LBB134_16
# %bb.15:                               # %if.then.i.i
                                        #   in Loop: Header=BB134_14 Depth=1
	movslq	4(%rdx,%rsi), %rbx
	decq	%rbx
	imulq	%rdi, %rbx
	addq	%rbx, %r8
	jmp	.LBB134_16
.LBB134_17:                             # %for.body.i12.i.preheader
	xorl	%esi, %esi
	xorl	%edi, %edi
	jmp	.LBB134_18
	.p2align	4, 0x90
.LBB134_20:                             # %if.end.i22.i
                                        #   in Loop: Header=BB134_18 Depth=1
	addq	$16, %rsi
	cmpq	%rsi, %rcx
	je	.LBB134_21
.LBB134_18:                             # %for.body.i12.i
                                        # =>This Inner Loop Header: Depth=1
	movslq	8(%rdx,%rsi), %rbx
	testq	%rbx, %rbx
	jns	.LBB134_20
# %bb.19:                               # %if.then.i18.i
                                        #   in Loop: Header=BB134_18 Depth=1
	movslq	4(%rdx,%rsi), %rax
	decq	%rax
	imulq	%rbx, %rax
	addq	%rax, %rdi
	jmp	.LBB134_20
.LBB134_21:                             # %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit
	subq	%rdi, %r8
	incq	%r8
	jmp	.LBB134_22
.LBB134_12:
	movl	$1, %r8d
.LBB134_22:                             # %_ZNK15halide_buffer_t13size_in_bytesEv.exit
	movzbl	33(%r12), %esi
	addq	$7, %rsi
	shrq	$3, %rsi
	imulq	%r8, %rsi
	movq	%r14, %rdi
	callq	halide_malloc@PLT
	movq	%rax, 16(%r12)
	testq	%rax, %rax
	je	.LBB134_23
# %bb.24:                               # %if.end6
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%r15, %rdx
	callq	halide_device_malloc@PLT
	testl	%eax, %eax
	je	.LBB134_25
# %bb.26:                               # %if.then9
	movl	%eax, %ebx
	movq	16(%r12), %rsi
	movq	%r14, %rdi
	callq	halide_free@PLT
	movq	$0, 16(%r12)
	jmp	.LBB134_27
.LBB134_23:
	movl	$-1, %ebx
	jmp	.LBB134_27
.LBB134_25:
	xorl	%ebx, %ebx
.LBB134_27:                             # %cleanup13
	movl	%ebx, %eax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end134:
	.size	halide_default_device_and_host_malloc, .Lfunc_end134-halide_default_device_and_host_malloc
                                        # -- End function
	.section	.text.halide_default_device_and_host_free,"ax",@progbits
	.weak	halide_default_device_and_host_free # -- Begin function halide_default_device_and_host_free
	.p2align	4, 0x90
	.type	halide_default_device_and_host_free,@function
halide_default_device_and_host_free:    # @halide_default_device_and_host_free
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	movq	%rsi, %r15
	movq	%rdi, %r14
	testq	%rsi, %rsi
	je	.LBB135_1
# %bb.2:                                # %if.end.i
	movq	(%r15), %rax
	movq	8(%r15), %rcx
	testq	%rax, %rax
	je	.LBB135_5
# %bb.3:                                # %if.end.i
	testq	%rcx, %rcx
	jne	.LBB135_5
# %bb.4:                                # %if.then8.i
	movq	%r14, %rdi
	callq	halide_error_no_device_interface@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB135_14
	jmp	.LBB135_11
.LBB135_1:                              # %if.then.i
	leaq	.L.str.30.104(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error_buffer_is_null@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB135_14
	jmp	.LBB135_11
.LBB135_5:                              # %if.end10.i
	testq	%rcx, %rcx
	je	.LBB135_8
# %bb.6:                                # %if.end10.i
	testq	%rax, %rax
	jne	.LBB135_8
# %bb.7:                                # %if.then14.i
	movq	%r14, %rdi
	callq	halide_error_device_interface_no_device@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB135_14
	jmp	.LBB135_11
.LBB135_8:                              # %if.end16.i
	movl	24(%r15), %eax
	notl	%eax
	testb	$3, %al
	jne	.LBB135_11
# %bb.9:                                # %if.then24.i
	movq	%r14, %rdi
	callq	halide_error_host_and_device_dirty@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB135_14
.LBB135_11:                             # %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	halide_device_free@PLT
	movl	%eax, %ebx
	movq	16(%r15), %rsi
	testq	%rsi, %rsi
	je	.LBB135_13
# %bb.12:                               # %if.then2
	movq	%r14, %rdi
	callq	halide_free@PLT
	movq	$0, 16(%r15)
.LBB135_13:                             # %if.end5
	andb	$-4, 24(%r15)
.LBB135_14:                             # %cleanup
	movl	%ebx, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end135:
	.size	halide_default_device_and_host_free, .Lfunc_end135-halide_default_device_and_host_free
                                        # -- End function
	.section	.text.halide_device_wrap_native,"ax",@progbits
	.weak	halide_device_wrap_native       # -- Begin function halide_device_wrap_native
	.p2align	4, 0x90
	.type	halide_device_wrap_native,@function
halide_device_wrap_native:              # @halide_device_wrap_native
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	movq	%rcx, %r15
	movq	%rdx, %r14
	movq	%rsi, %rbx
	movq	%rdi, %r12
	testq	%rsi, %rsi
	je	.LBB136_1
# %bb.2:                                # %if.end.i
	movq	(%rbx), %rcx
	movq	8(%rbx), %rax
	testq	%rcx, %rcx
	je	.LBB136_5
# %bb.3:                                # %if.end.i
	testq	%rax, %rax
	jne	.LBB136_5
# %bb.4:                                # %if.then8.i
	movq	%r12, %rdi
	callq	halide_error_no_device_interface@PLT
	testl	%eax, %eax
	jne	.LBB136_16
	jmp	.LBB136_11
.LBB136_1:                              # %if.then.i
	leaq	.L.str.31.105(%rip), %rsi
	movq	%r12, %rdi
	callq	halide_error_buffer_is_null@PLT
	testl	%eax, %eax
	jne	.LBB136_16
	jmp	.LBB136_11
.LBB136_5:                              # %if.end10.i
	testq	%rax, %rax
	je	.LBB136_8
# %bb.6:                                # %if.end10.i
	testq	%rcx, %rcx
	jne	.LBB136_8
# %bb.7:                                # %if.then14.i
	movq	%r12, %rdi
	callq	halide_error_device_interface_no_device@PLT
	testl	%eax, %eax
	jne	.LBB136_16
	jmp	.LBB136_11
.LBB136_8:                              # %if.end16.i
	movl	24(%rbx), %ecx
	notl	%ecx
	testb	$3, %cl
	jne	.LBB136_12
# %bb.9:                                # %if.then24.i
	movq	%r12, %rdi
	callq	halide_error_host_and_device_dirty@PLT
	testl	%eax, %eax
	jne	.LBB136_16
.LBB136_11:                             # %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	movq	8(%rbx), %rax
.LBB136_12:                             # %if.end
	testq	%rax, %rax
	je	.LBB136_15
# %bb.13:                               # %if.end
	cmpq	%r15, %rax
	je	.LBB136_15
# %bb.14:                               # %if.then4
	leaq	.L.str.32.106(%rip), %rsi
	movq	%r12, %rdi
	callq	halide_error@PLT
	movl	$-42, %eax
	jmp	.LBB136_16
.LBB136_15:                             # %if.end5
	movq	120(%r15), %rax
	callq	*(%rax)
	movq	%r15, 8(%rbx)
	movq	120(%r15), %rax
	movq	%r12, %rdi
	movq	%rbx, %rsi
	movq	%r14, %rdx
	callq	*112(%rax)
	movl	%eax, %ebx
	movq	120(%r15), %rax
	callq	*8(%rax)
	xorl	%eax, %eax
	testl	%ebx, %ebx
	sete	%al
	shll	$4, %eax
	addl	$-16, %eax
.LBB136_16:                             # %cleanup12
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end136:
	.size	halide_device_wrap_native, .Lfunc_end136-halide_device_wrap_native
                                        # -- End function
	.section	.text.halide_device_detach_native,"ax",@progbits
	.weak	halide_device_detach_native     # -- Begin function halide_device_detach_native
	.p2align	4, 0x90
	.type	halide_device_detach_native,@function
halide_device_detach_native:            # @halide_device_detach_native
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	movq	%rsi, %r12
	movq	%rdi, %r14
	testq	%rsi, %rsi
	je	.LBB137_1
# %bb.2:                                # %if.end.i
	movq	(%r12), %rax
	movq	8(%r12), %rbx
	testq	%rax, %rax
	je	.LBB137_5
# %bb.3:                                # %if.end.i
	testq	%rbx, %rbx
	jne	.LBB137_5
# %bb.4:                                # %if.then8.i
	movq	%r14, %rdi
	callq	halide_error_no_device_interface@PLT
	testl	%eax, %eax
	jne	.LBB137_17
	jmp	.LBB137_11
.LBB137_1:                              # %if.then.i
	leaq	.L.str.33.107(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error_buffer_is_null@PLT
	testl	%eax, %eax
	jne	.LBB137_17
	jmp	.LBB137_11
.LBB137_5:                              # %if.end10.i
	testq	%rbx, %rbx
	je	.LBB137_8
# %bb.6:                                # %if.end10.i
	testq	%rax, %rax
	jne	.LBB137_8
# %bb.7:                                # %if.then14.i
	movq	%r14, %rdi
	callq	halide_error_device_interface_no_device@PLT
	testl	%eax, %eax
	jne	.LBB137_17
	jmp	.LBB137_11
.LBB137_8:                              # %if.end16.i
	movl	24(%r12), %eax
	notl	%eax
	testb	$3, %al
	jne	.LBB137_12
# %bb.9:                                # %if.then24.i
	movq	%r14, %rdi
	callq	halide_error_host_and_device_dirty@PLT
	testl	%eax, %eax
	jne	.LBB137_17
.LBB137_11:                             # %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	movq	8(%r12), %rbx
.LBB137_12:                             # %if.end
	testq	%rbx, %rbx
	je	.LBB137_13
# %bb.14:                               # %if.then3
	movq	120(%rbx), %rax
	callq	*(%rax)
	movq	120(%rbx), %rax
	movq	%r14, %rdi
	movq	%r12, %rsi
	callq	*120(%rax)
	movl	%eax, %r15d
	movq	120(%rbx), %rax
	callq	*8(%rax)
	cmpq	$0, (%r12)
	je	.LBB137_16
# %bb.15:                               # %if.then8
	leaq	.L.str.34.108(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_print@PLT
	callq	abort@PLT
.LBB137_16:                             # %do.end
	testl	%r15d, %r15d
	movl	$-33, %eax
	cmovel	%r15d, %eax
	jmp	.LBB137_17
.LBB137_13:
	xorl	%eax, %eax
.LBB137_17:                             # %cleanup
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end137:
	.size	halide_device_detach_native, .Lfunc_end137-halide_device_detach_native
                                        # -- End function
	.section	.text.halide_default_device_wrap_native,"ax",@progbits
	.weak	halide_default_device_wrap_native # -- Begin function halide_default_device_wrap_native
	.p2align	4, 0x90
	.type	halide_default_device_wrap_native,@function
halide_default_device_wrap_native:      # @halide_default_device_wrap_native
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	movl	$-32, %eax
	cmpq	$0, (%rsi)
	je	.LBB138_1
# %bb.2:                                # %return
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.LBB138_1:                              # %if.end
	movq	%rdx, %r14
	movq	%rsi, %rbx
	movq	8(%rsi), %rax
	movq	120(%rax), %rax
	callq	*(%rax)
	movq	%r14, (%rbx)
	xorl	%eax, %eax
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end138:
	.size	halide_default_device_wrap_native, .Lfunc_end138-halide_default_device_wrap_native
                                        # -- End function
	.section	.text.halide_default_device_detach_native,"ax",@progbits
	.weak	halide_default_device_detach_native # -- Begin function halide_default_device_detach_native
	.p2align	4, 0x90
	.type	halide_default_device_detach_native,@function
halide_default_device_detach_native:    # @halide_default_device_detach_native
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	movq	%rsi, %r14
	testq	%rsi, %rsi
	je	.LBB139_1
# %bb.2:                                # %if.end.i
	movq	(%r14), %rax
	movq	8(%r14), %rcx
	testq	%rax, %rax
	je	.LBB139_5
# %bb.3:                                # %if.end.i
	testq	%rcx, %rcx
	jne	.LBB139_5
# %bb.4:                                # %if.then8.i
	callq	halide_error_no_device_interface@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB139_14
	jmp	.LBB139_11
.LBB139_1:                              # %if.then.i
	leaq	.L.str.35(%rip), %rsi
	callq	halide_error_buffer_is_null@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB139_14
	jmp	.LBB139_11
.LBB139_5:                              # %if.end10.i
	testq	%rcx, %rcx
	je	.LBB139_8
# %bb.6:                                # %if.end10.i
	testq	%rax, %rax
	jne	.LBB139_8
# %bb.7:                                # %if.then14.i
	callq	halide_error_device_interface_no_device@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB139_14
	jmp	.LBB139_11
.LBB139_8:                              # %if.end16.i
	movl	24(%r14), %ecx
	notl	%ecx
	testb	$3, %cl
	jne	.LBB139_12
# %bb.9:                                # %if.then24.i
	callq	halide_error_host_and_device_dirty@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB139_14
.LBB139_11:                             # %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	movq	(%r14), %rax
.LBB139_12:                             # %if.end
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.LBB139_14
# %bb.13:                               # %if.end3
	movq	8(%r14), %rax
	movq	120(%rax), %rax
	callq	*8(%rax)
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%xmm0, (%r14)
.LBB139_14:                             # %cleanup
	movl	%ebx, %eax
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end139:
	.size	halide_default_device_detach_native, .Lfunc_end139-halide_default_device_detach_native
                                        # -- End function
	.section	.text.halide_device_and_host_free_as_destructor,"ax",@progbits
	.weak	halide_device_and_host_free_as_destructor # -- Begin function halide_device_and_host_free_as_destructor
	.p2align	4, 0x90
	.type	halide_device_and_host_free_as_destructor,@function
halide_device_and_host_free_as_destructor: # @halide_device_and_host_free_as_destructor
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	popq	%rbp
	jmp	halide_device_and_host_free@PLT # TAILCALL
.Lfunc_end140:
	.size	halide_device_and_host_free_as_destructor, .Lfunc_end140-halide_device_and_host_free_as_destructor
                                        # -- End function
	.section	.text.halide_device_host_nop_free,"ax",@progbits
	.weak	halide_device_host_nop_free     # -- Begin function halide_device_host_nop_free
	.p2align	4, 0x90
	.type	halide_device_host_nop_free,@function
halide_device_host_nop_free:            # @halide_device_host_nop_free
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	popq	%rbp
	retq
.Lfunc_end141:
	.size	halide_device_host_nop_free, .Lfunc_end141-halide_device_host_nop_free
                                        # -- End function
	.section	.text.halide_default_buffer_copy,"ax",@progbits
	.weak	halide_default_buffer_copy      # -- Begin function halide_default_buffer_copy
	.p2align	4, 0x90
	.type	halide_default_buffer_copy,@function
halide_default_buffer_copy:             # @halide_default_buffer_copy
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$-39, %eax
	popq	%rbp
	retq
.Lfunc_end142:
	.size	halide_default_buffer_copy, .Lfunc_end142-halide_default_buffer_copy
                                        # -- End function
	.section	.text.halide_buffer_copy_already_locked,"ax",@progbits
	.weak	halide_buffer_copy_already_locked # -- Begin function halide_buffer_copy_already_locked
	.p2align	4, 0x90
	.type	halide_buffer_copy_already_locked,@function
halide_buffer_copy_already_locked:      # @halide_buffer_copy_already_locked
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$456, %rsp                      # imm = 0x1C8
	movq	%rdx, %r13
	movq	%rsi, -56(%rbp)                 # 8-byte Spill
	testq	%rdx, %rdx
	je	.LBB143_5
# %bb.1:                                # %land.lhs.true
	movq	8(%rcx), %rax
	testq	%rax, %rax
	je	.LBB143_4
# %bb.2:                                # %land.lhs.true
	cmpq	%r13, %rax
	je	.LBB143_4
# %bb.3:                                # %if.then
	leaq	.L.str.41(%rip), %rsi
	callq	halide_error@PLT
	movl	$-42, %eax
	jmp	.LBB143_39
.LBB143_4:                              # %land.lhs.true5
	cmpq	$0, (%rcx)
	je	.LBB143_13
.LBB143_5:                              # %if.end13
	movq	-56(%rbp), %rax                 # 8-byte Reload
	cmpq	$0, (%rax)
	movq	16(%rax), %rax
	je	.LBB143_9
# %bb.6:                                # %land.rhs
	testq	%rax, %rax
	je	.LBB143_12
# %bb.7:                                # %land.end.thread268
	movq	-56(%rbp), %rax                 # 8-byte Reload
	movq	24(%rax), %rax
	movl	%eax, %r12d
	andb	$1, %r12b
	testb	$2, %al
	jne	.LBB143_11
.LBB143_8:
	xorl	%esi, %esi
	xorl	%ebx, %ebx
	movq	16(%rcx), %r14
	testq	%r13, %r13
	setne	%r8b
	je	.LBB143_16
	jmp	.LBB143_17
.LBB143_9:                              # %land.end
	testq	%rax, %rax
	je	.LBB143_14
# %bb.10:                               # %land.end.land.rhs26_crit_edge
	movq	-56(%rbp), %rax                 # 8-byte Reload
	movq	24(%rax), %rax
	movb	$1, %r12b
	testb	$2, %al
	je	.LBB143_8
.LBB143_11:                             # %lor.rhs28
	movq	-56(%rbp), %rax                 # 8-byte Reload
	cmpq	$0, 8(%rax)
	setne	%bl
	xorl	%esi, %esi
	movq	16(%rcx), %r14
	testq	%r13, %r13
	setne	%r8b
	je	.LBB143_16
	jmp	.LBB143_17
.LBB143_12:
	movb	$1, %sil
	xorl	%r12d, %r12d
	jmp	.LBB143_15
.LBB143_13:                             # %if.then7
	movq	%rdi, %rbx
	movq	%rcx, %rsi
	movq	%r13, %rdx
	movq	%rcx, %r14
	callq	halide_device_malloc@PLT
	movq	%rbx, %rdi
	movq	%r14, %rcx
	testl	%eax, %eax
	jne	.LBB143_39
	jmp	.LBB143_5
.LBB143_14:
	movb	$1, %sil
	movb	$1, %r12b
.LBB143_15:
	movb	$1, %bl
	movq	16(%rcx), %r14
	testq	%r13, %r13
	setne	%r8b
	jne	.LBB143_17
.LBB143_16:                             # %land.end32
	movl	$-34, %eax
	testq	%r14, %r14
	je	.LBB143_39
.LBB143_17:                             # %if.end41
	testq	%r13, %r13
	sete	%al
	orb	%r12b, %al
	jne	.LBB143_19
# %bb.18:                               # %if.end49
	movq	120(%r13), %rax
	movq	%rdi, %r15
	movl	%esi, -60(%rbp)                 # 4-byte Spill
	movq	-56(%rbp), %rsi                 # 8-byte Reload
	movq	%r13, %rdx
	movq	%rcx, -72(%rbp)                 # 8-byte Spill
	movb	%r8b, -41(%rbp)                 # 1-byte Spill
	callq	*80(%rax)
	movb	-41(%rbp), %r8b                 # 1-byte Reload
	movl	-60(%rbp), %esi                 # 4-byte Reload
	movq	%r15, %rdi
	movq	-72(%rbp), %rcx                 # 8-byte Reload
	cmpl	$-42, %eax
	jne	.LBB143_33
.LBB143_19:                             # %if.then51
	testq	%r14, %r14
	sete	%dl
	movl	$-42, %eax
	testb	%dl, %sil
	jne	.LBB143_39
# %bb.20:                               # %if.end58
	orb	%r8b, %bl
	je	.LBB143_26
# %bb.21:                               # %if.else
	orb	%r12b, %r8b
	je	.LBB143_27
# %bb.22:                               # %if.else81
	testq	%r14, %r14
	sete	%dl
	orb	%dl, %r12b
	je	.LBB143_30
# %bb.23:                               # %if.else98
	testq	%r13, %r13
	je	.LBB143_39
# %bb.24:                               # %if.then100
	movq	%rdi, %rbx
	movq	-56(%rbp), %rsi                 # 8-byte Reload
	movq	%rcx, %r14
	callq	_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t@PLT
	testl	%eax, %eax
	jne	.LBB143_39
# %bb.25:                               # %if.then105
	movq	%r14, %rcx
	movq	120(%r13), %rax
	movq	%rbx, %rdi
	movq	-56(%rbp), %rsi                 # 8-byte Reload
	movq	%r13, %rdx
	callq	*80(%rax)
	jmp	.LBB143_32
.LBB143_26:                             # %if.end117.thread262
	leaq	-488(%rbp), %r14
	movq	%rdi, %r15
	movq	%r14, %rdi
	movq	-56(%rbp), %rsi                 # 8-byte Reload
	movl	$1, %edx
	movq	%rcx, %rbx
	movl	$1, %r8d
	callq	_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b@PLT
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv@PLT
	movq	%rbx, %rcx
	jmp	.LBB143_34
.LBB143_27:                             # %if.then66
	movq	-56(%rbp), %rsi                 # 8-byte Reload
	movq	8(%rsi), %rax
	movq	120(%rax), %rax
	movq	%rdi, %rbx
	xorl	%edx, %edx
	movq	%rcx, %r14
	callq	*80(%rax)
	movq	%r14, %rcx
	cmpl	$-42, %eax
	jne	.LBB143_33
# %bb.28:                               # %if.then74
	movq	%rbx, %rdi
	movq	-56(%rbp), %rsi                 # 8-byte Reload
	callq	_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t@PLT
	testl	%eax, %eax
	jne	.LBB143_39
# %bb.29:                               # %if.then77
	movq	%r14, %rcx
	movq	%rbx, %rdi
	movq	-56(%rbp), %rsi                 # 8-byte Reload
	xorl	%edx, %edx
	callq	halide_buffer_copy_already_locked@PLT
	jmp	.LBB143_32
.LBB143_30:                             # %if.then85
	movq	-56(%rbp), %rsi                 # 8-byte Reload
	movq	8(%rsi), %rax
	movq	120(%rax), %rax
	movq	%rdi, %rbx
	xorl	%edx, %edx
	movq	%rcx, %r14
	callq	*80(%rax)
	testl	%eax, %eax
	jne	.LBB143_39
# %bb.31:                               # %if.then95
	movq	%r14, %rsi
	orb	$1, 24(%r14)
	movq	%rbx, %rdi
	movq	%r13, %rdx
	callq	copy_to_device_already_locked@PLT
.LBB143_32:                             # %if.end117
	movq	%r14, %rcx
.LBB143_33:                             # %if.end117
	testl	%eax, %eax
	jne	.LBB143_39
.LBB143_34:                             # %land.lhs.true126
	xorl	%eax, %eax
	cmpq	-56(%rbp), %rcx                 # 8-byte Folded Reload
	je	.LBB143_39
# %bb.35:                               # %if.then128
	movq	24(%rcx), %rdx
	andq	$-4, %rdx
	testq	%r13, %r13
	je	.LBB143_37
# %bb.36:                               # %if.then130
	orq	$2, %rdx
	jmp	.LBB143_38
.LBB143_37:                             # %if.else133
	orq	$1, %rdx
.LBB143_38:                             # %cleanup143
	movq	%rdx, 24(%rcx)
.LBB143_39:                             # %cleanup143
	addq	$456, %rsp                      # imm = 0x1C8
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end143:
	.size	halide_buffer_copy_already_locked, .Lfunc_end143-halide_buffer_copy_already_locked
                                        # -- End function
	.section	.text.halide_buffer_copy,"ax",@progbits
	.weak	halide_buffer_copy              # -- Begin function halide_buffer_copy
	.p2align	4, 0x90
	.type	halide_buffer_copy,@function
halide_buffer_copy:                     # @halide_buffer_copy
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	movq	%rcx, %r15
	movq	%rdx, %rbx
	movq	%rsi, %r14
	movq	%rdi, %r12
	movq	_ZN6Halide7Runtime8Internal17device_copy_mutexE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_lock@PLT
	testq	%rbx, %rbx
	je	.LBB144_2
# %bb.1:                                # %if.then
	movq	120(%rbx), %rax
	callq	*(%rax)
.LBB144_2:                              # %if.end
	movq	8(%r14), %rax
	testq	%rax, %rax
	je	.LBB144_4
# %bb.3:                                # %if.then12
	movq	120(%rax), %rax
	callq	*(%rax)
.LBB144_4:                              # %if.end16
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	movq	%r15, %rcx
	callq	halide_buffer_copy_already_locked@PLT
	movl	%eax, %r15d
	testq	%rbx, %rbx
	je	.LBB144_6
# %bb.5:                                # %if.then18
	movq	120(%rbx), %rax
	callq	*8(%rax)
.LBB144_6:                              # %if.end20
	movq	8(%r14), %rax
	testq	%rax, %rax
	je	.LBB144_8
# %bb.7:                                # %if.then23
	movq	120(%rax), %rax
	callq	*8(%rax)
.LBB144_8:                              # %if.end27
	movq	_ZN6Halide7Runtime8Internal17device_copy_mutexE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_unlock@PLT
	movl	%r15d, %eax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end144:
	.size	halide_buffer_copy, .Lfunc_end144-halide_buffer_copy
                                        # -- End function
	.section	.text.halide_default_device_crop,"ax",@progbits
	.weak	halide_default_device_crop      # -- Begin function halide_default_device_crop
	.p2align	4, 0x90
	.type	halide_default_device_crop,@function
halide_default_device_crop:             # @halide_default_device_crop
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	leaq	.L.str.58(%rip), %rsi
	callq	halide_error@PLT
	movl	$-40, %eax
	popq	%rbp
	retq
.Lfunc_end145:
	.size	halide_default_device_crop, .Lfunc_end145-halide_default_device_crop
                                        # -- End function
	.section	.text.halide_default_device_slice,"ax",@progbits
	.weak	halide_default_device_slice     # -- Begin function halide_default_device_slice
	.p2align	4, 0x90
	.type	halide_default_device_slice,@function
halide_default_device_slice:            # @halide_default_device_slice
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	leaq	.L.str.59(%rip), %rsi
	callq	halide_error@PLT
	movl	$-40, %eax
	popq	%rbp
	retq
.Lfunc_end146:
	.size	halide_default_device_slice, .Lfunc_end146-halide_default_device_slice
                                        # -- End function
	.section	.text.halide_device_crop,"ax",@progbits
	.weak	halide_device_crop              # -- Begin function halide_device_crop
	.p2align	4, 0x90
	.type	halide_device_crop,@function
halide_device_crop:                     # @halide_device_crop
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	movq	%rdx, %r15
	movq	%rsi, %rbx
	movq	%rdi, %r14
	movq	_ZN6Halide7Runtime8Internal17device_copy_mutexE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_lock@PLT
	cmpq	$0, (%rbx)
	je	.LBB147_1
# %bb.2:                                # %if.end
	cmpq	$0, (%r15)
	je	.LBB147_5
# %bb.3:                                # %if.then3
	leaq	.L.str.60(%rip), %rsi
	jmp	.LBB147_4
.LBB147_1:
	xorl	%ebx, %ebx
	jmp	.LBB147_8
.LBB147_5:                              # %if.end4
	movl	36(%rbx), %eax
	cmpl	36(%r15), %eax
	jne	.LBB147_6
# %bb.7:                                # %if.end7
	movq	8(%rbx), %rax
	movq	120(%rax), %rax
	callq	*(%rax)
	movq	8(%rbx), %rax
	movq	120(%rax), %rax
	movq	%r14, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	*88(%rax)
	movl	%eax, %ebx
	jmp	.LBB147_8
.LBB147_6:                              # %if.then6
	leaq	.L.str.61(%rip), %rsi
.LBB147_4:                              # %cleanup
	movq	%r14, %rdi
	callq	halide_error@PLT
	movl	$-41, %ebx
.LBB147_8:                              # %cleanup
	movq	_ZN6Halide7Runtime8Internal17device_copy_mutexE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_unlock@PLT
	movl	%ebx, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end147:
	.size	halide_device_crop, .Lfunc_end147-halide_device_crop
                                        # -- End function
	.section	.text.halide_device_slice,"ax",@progbits
	.weak	halide_device_slice             # -- Begin function halide_device_slice
	.p2align	4, 0x90
	.type	halide_device_slice,@function
halide_device_slice:                    # @halide_device_slice
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movq	%r8, %r13
	movl	%ecx, %r15d
	movl	%edx, %r12d
	movq	%rsi, %rbx
	movq	%rdi, %r14
	movq	_ZN6Halide7Runtime8Internal17device_copy_mutexE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_lock@PLT
	cmpq	$0, (%rbx)
	je	.LBB148_1
# %bb.2:                                # %if.end
	cmpq	$0, (%r13)
	je	.LBB148_5
# %bb.3:                                # %if.then3
	leaq	.L.str.60(%rip), %rsi
	jmp	.LBB148_4
.LBB148_1:
	xorl	%ebx, %ebx
	jmp	.LBB148_8
.LBB148_5:                              # %if.end4
	movl	36(%r13), %eax
	incl	%eax
	cmpl	%eax, 36(%rbx)
	jne	.LBB148_6
# %bb.7:                                # %if.end7
	movq	8(%rbx), %rax
	movq	120(%rax), %rax
	callq	*(%rax)
	movq	8(%rbx), %rax
	movq	120(%rax), %rax
	movq	%r14, %rdi
	movq	%rbx, %rsi
	movl	%r12d, %edx
	movl	%r15d, %ecx
	movq	%r13, %r8
	callq	*96(%rax)
	movl	%eax, %ebx
	jmp	.LBB148_8
.LBB148_6:                              # %if.then6
	leaq	.L.str.64(%rip), %rsi
.LBB148_4:                              # %cleanup
	movq	%r14, %rdi
	callq	halide_error@PLT
	movl	$-41, %ebx
.LBB148_8:                              # %cleanup
	movq	_ZN6Halide7Runtime8Internal17device_copy_mutexE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_unlock@PLT
	movl	%ebx, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end148:
	.size	halide_device_slice, .Lfunc_end148-halide_device_slice
                                        # -- End function
	.section	.text.halide_default_device_release_crop,"ax",@progbits
	.weak	halide_default_device_release_crop # -- Begin function halide_default_device_release_crop
	.p2align	4, 0x90
	.type	halide_default_device_release_crop,@function
halide_default_device_release_crop:     # @halide_default_device_release_crop
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	cmpq	$0, (%rsi)
	je	.LBB149_1
# %bb.2:                                # %if.end
	leaq	.L.str.58(%rip), %rsi
	callq	halide_error@PLT
	movl	$-40, %eax
	popq	%rbp
	retq
.LBB149_1:
	xorl	%eax, %eax
	popq	%rbp
	retq
.Lfunc_end149:
	.size	halide_default_device_release_crop, .Lfunc_end149-halide_default_device_release_crop
                                        # -- End function
	.section	.text.halide_device_release_crop,"ax",@progbits
	.weak	halide_device_release_crop      # -- Begin function halide_device_release_crop
	.p2align	4, 0x90
	.type	halide_device_release_crop,@function
halide_device_release_crop:             # @halide_device_release_crop
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	cmpq	$0, (%rsi)
	je	.LBB150_2
# %bb.1:                                # %if.then
	movq	%rsi, %rbx
	movq	%rdi, %r14
	movq	_ZN6Halide7Runtime8Internal17device_copy_mutexE@GOTPCREL(%rip), %r15
	movq	%r15, %rdi
	callq	halide_mutex_lock@PLT
	movq	8(%rbx), %r12
	movq	120(%r12), %rax
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	*104(%rax)
	movl	%eax, %r14d
	movq	$0, (%rbx)
	movq	120(%r12), %rax
	callq	*8(%rax)
	movq	$0, 8(%rbx)
	movq	%r15, %rdi
	callq	halide_mutex_unlock@PLT
	movl	%r14d, %eax
	jmp	.LBB150_3
.LBB150_2:                              # %return
	xorl	%eax, %eax
.LBB150_3:                              # %return
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end150:
	.size	halide_device_release_crop, .Lfunc_end150-halide_device_release_crop
                                        # -- End function
	.section	.text.halide_float16_bits_to_float,"ax",@progbits
	.weak	halide_float16_bits_to_float    # -- Begin function halide_float16_bits_to_float
	.p2align	4, 0x90
	.type	halide_float16_bits_to_float,@function
halide_float16_bits_to_float:           # @halide_float16_bits_to_float
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, %ecx
	shrl	$10, %ecx
	andl	$31, %ecx
	movl	%edi, %eax
	andl	$1023, %eax                     # imm = 0x3FF
	je	.LBB151_3
# %bb.1:                                # %entry
	testl	%ecx, %ecx
	jne	.LBB151_3
# %bb.2:                                # %if.then
	xorl	%ecx, %ecx
	lzcntl	%eax, %ecx
	movl	%ecx, %edx
	xorb	$31, %dl
	btrl	%edx, %eax
	movb	$23, %sil
	subb	%dl, %sil
	shlxl	%esi, %eax, %edx
	shll	$23, %ecx
	movl	$1124073472, %eax               # imm = 0x43000000
	subl	%ecx, %eax
	jmp	.LBB151_7
.LBB151_3:                              # %if.else
	shll	$13, %eax
	testl	%ecx, %ecx
	je	.LBB151_4
# %bb.5:                                # %if.else18
	movl	$2139095040, %edx               # imm = 0x7F800000
	cmpl	$31, %ecx
	je	.LBB151_7
# %bb.6:                                # %if.else21
	shll	$23, %ecx
	addl	$939524096, %ecx                # imm = 0x38000000
	movl	%ecx, %edx
	jmp	.LBB151_7
.LBB151_4:
	xorl	%edx, %edx
.LBB151_7:                              # %if.end28
	orl	%edx, %eax
	movswl	%di, %ecx
	andl	$-2147483648, %ecx              # imm = 0x80000000
	orl	%eax, %ecx
	vmovd	%ecx, %xmm0
	popq	%rbp
	retq
.Lfunc_end151:
	.size	halide_float16_bits_to_float, .Lfunc_end151-halide_float16_bits_to_float
                                        # -- End function
	.section	.text.halide_float16_bits_to_double,"ax",@progbits
	.weak	halide_float16_bits_to_double   # -- Begin function halide_float16_bits_to_double
	.p2align	4, 0x90
	.type	halide_float16_bits_to_double,@function
halide_float16_bits_to_double:          # @halide_float16_bits_to_double
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	callq	halide_float16_bits_to_float@PLT
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	popq	%rbp
	retq
.Lfunc_end152:
	.size	halide_float16_bits_to_double, .Lfunc_end152-halide_float16_bits_to_double
                                        # -- End function
	.section	.text.halide_error_bounds_inference_call_failed,"ax",@progbits
	.weak	halide_error_bounds_inference_call_failed # -- Begin function halide_error_bounds_inference_call_failed
	.p2align	4, 0x90
	.type	halide_error_bounds_inference_call_failed,@function
halide_error_bounds_inference_call_failed: # @halide_error_bounds_inference_call_failed
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movl	%edx, %r15d
	movq	%rsi, %r12
	movq	%rdi, %r14
	movl	$1024, %edi                     # imm = 0x400
	callq	malloc@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.LBB153_1
# %bb.2:                                # %if.then6.i
	leaq	1023(%rbx), %r13
	movb	$0, 1023(%rbx)
	leaq	.L.str.111(%rip), %rdx
	movq	%rbx, %rdi
	movq	%r13, %rsi
	jmp	.LBB153_3
.LBB153_1:                              # %entry.split
	leaq	.L.str.111(%rip), %rdx
	xorl	%r13d, %r13d
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB153_3:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%r13, %rsi
	movq	%r12, %rdx
	callq	halide_string_to_string@PLT
	leaq	.L.str.1.112(%rip), %rdx
	movq	%rax, %rdi
	movq	%r13, %rsi
	callq	halide_string_to_string@PLT
	movslq	%r15d, %rdx
	movq	%rax, %rdi
	movq	%r13, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	testq	%rbx, %rbx
	je	.LBB153_4
# %bb.5:                                # %if.else.i
	subq	%rbx, %rax
	incq	%rax
	movq	%r14, %rdi
	movq	%rbx, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%rbx, %rsi
	jmp	.LBB153_6
.LBB153_4:
	leaq	.L.str.29.163(%rip), %rsi
.LBB153_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%rbx, %rdi
	callq	free@PLT
	movl	%r15d, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end153:
	.size	halide_error_bounds_inference_call_failed, .Lfunc_end153-halide_error_bounds_inference_call_failed
                                        # -- End function
	.section	.text.halide_error_extern_stage_failed,"ax",@progbits
	.weak	halide_error_extern_stage_failed # -- Begin function halide_error_extern_stage_failed
	.p2align	4, 0x90
	.type	halide_error_extern_stage_failed,@function
halide_error_extern_stage_failed:       # @halide_error_extern_stage_failed
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movl	%edx, %r15d
	movq	%rsi, %r12
	movq	%rdi, %r14
	movl	$1024, %edi                     # imm = 0x400
	callq	malloc@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.LBB154_1
# %bb.2:                                # %if.then6.i
	leaq	1023(%rbx), %r13
	movb	$0, 1023(%rbx)
	leaq	.L.str.2.113(%rip), %rdx
	movq	%rbx, %rdi
	movq	%r13, %rsi
	jmp	.LBB154_3
.LBB154_1:                              # %entry.split
	leaq	.L.str.2.113(%rip), %rdx
	xorl	%r13d, %r13d
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB154_3:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%r13, %rsi
	movq	%r12, %rdx
	callq	halide_string_to_string@PLT
	leaq	.L.str.1.112(%rip), %rdx
	movq	%rax, %rdi
	movq	%r13, %rsi
	callq	halide_string_to_string@PLT
	movslq	%r15d, %rdx
	movq	%rax, %rdi
	movq	%r13, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	testq	%rbx, %rbx
	je	.LBB154_4
# %bb.5:                                # %if.else.i
	subq	%rbx, %rax
	incq	%rax
	movq	%r14, %rdi
	movq	%rbx, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%rbx, %rsi
	jmp	.LBB154_6
.LBB154_4:
	leaq	.L.str.29.163(%rip), %rsi
.LBB154_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%rbx, %rdi
	callq	free@PLT
	movl	%r15d, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end154:
	.size	halide_error_extern_stage_failed, .Lfunc_end154-halide_error_extern_stage_failed
                                        # -- End function
	.section	.text.halide_error_explicit_bounds_too_small,"ax",@progbits
	.weak	halide_error_explicit_bounds_too_small # -- Begin function halide_error_explicit_bounds_too_small
	.p2align	4, 0x90
	.type	halide_error_explicit_bounds_too_small,@function
halide_error_explicit_bounds_too_small: # @halide_error_explicit_bounds_too_small
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	movl	%r9d, -48(%rbp)                 # 4-byte Spill
	movl	%r8d, -44(%rbp)                 # 4-byte Spill
	movl	%ecx, %r14d
	movq	%rdx, %r13
	movq	%rsi, %r12
	movq	%rdi, -56(%rbp)                 # 8-byte Spill
	movl	$1024, %edi                     # imm = 0x400
	callq	malloc@PLT
	movq	%rax, %r15
	testq	%rax, %rax
	je	.LBB155_1
# %bb.2:                                # %if.then6.i
	leaq	1023(%r15), %rbx
	movb	$0, 1023(%r15)
	leaq	.L.str.3.114(%rip), %rdx
	movq	%r15, %rdi
	movq	%rbx, %rsi
	jmp	.LBB155_3
.LBB155_1:                              # %entry.split
	leaq	.L.str.3.114(%rip), %rdx
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB155_3:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r13, %rdx
	callq	halide_string_to_string@PLT
	leaq	.L.str.4.115(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r12, %rdx
	callq	halide_string_to_string@PLT
	leaq	.L.str.5.116(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movslq	%r14d, %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.6.117(%rip), %r14
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r14, %rdx
	callq	halide_string_to_string@PLT
	movslq	-44(%rbp), %rdx                 # 4-byte Folded Reload
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.7.118(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movslq	-48(%rbp), %rdx                 # 4-byte Folded Reload
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r14, %rdx
	callq	halide_string_to_string@PLT
	movslq	16(%rbp), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.8.119(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	testq	%r15, %r15
	je	.LBB155_4
# %bb.5:                                # %if.else.i
	subq	%r15, %rax
	incq	%rax
	movq	-56(%rbp), %rbx                 # 8-byte Reload
	movq	%rbx, %rdi
	movq	%r15, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r15, %rsi
	jmp	.LBB155_6
.LBB155_4:
	leaq	.L.str.29.163(%rip), %rsi
	movq	-56(%rbp), %rbx                 # 8-byte Reload
.LBB155_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	movq	%rbx, %rdi
	callq	halide_error@PLT
	movq	%r15, %rdi
	callq	free@PLT
	movl	$-2, %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end155:
	.size	halide_error_explicit_bounds_too_small, .Lfunc_end155-halide_error_explicit_bounds_too_small
                                        # -- End function
	.section	.text.halide_error_bad_type,"ax",@progbits
	.weak	halide_error_bad_type           # -- Begin function halide_error_bad_type
	.p2align	4, 0x90
	.type	halide_error_bad_type,@function
halide_error_bad_type:                  # @halide_error_bad_type
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$32, %rsp
	movq	%rsi, %r12
	movq	%rdi, %r14
	movl	%edx, -56(%rbp)
	movl	%ecx, -52(%rbp)
	movl	$0, -48(%rbp)
	movl	$0, -40(%rbp)
	leaq	-48(%rbp), %rdi
	leaq	-52(%rbp), %rsi
	movl	$4, %edx
	callq	memcpy@PLT
	leaq	-40(%rbp), %rdi
	leaq	-56(%rbp), %rsi
	movl	$4, %edx
	callq	memcpy@PLT
	movl	$1024, %edi                     # imm = 0x400
	callq	malloc@PLT
	movq	%rax, %r15
	testq	%rax, %rax
	je	.LBB156_1
# %bb.2:                                # %if.then6.i
	leaq	1023(%r15), %rbx
	movb	$0, 1023(%r15)
	movq	%r15, %rdi
	movq	%rbx, %rsi
	jmp	.LBB156_3
.LBB156_1:                              # %entry.split
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB156_3:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	movq	%r12, %rdx
	callq	halide_string_to_string@PLT
	leaq	.L.str.9.120(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	leaq	-48(%rbp), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_type_to_string@PLT
	leaq	.L.str.10.121(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	leaq	-40(%rbp), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_type_to_string@PLT
	testq	%r15, %r15
	je	.LBB156_4
# %bb.5:                                # %if.else.i
	subq	%r15, %rax
	incq	%rax
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r15, %rsi
	jmp	.LBB156_6
.LBB156_4:
	leaq	.L.str.29.163(%rip), %rsi
.LBB156_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%r15, %rdi
	callq	free@PLT
	movl	$-3, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end156:
	.size	halide_error_bad_type, .Lfunc_end156-halide_error_bad_type
                                        # -- End function
	.section	.text.halide_error_bad_dimensions,"ax",@progbits
	.weak	halide_error_bad_dimensions     # -- Begin function halide_error_bad_dimensions
	.p2align	4, 0x90
	.type	halide_error_bad_dimensions,@function
halide_error_bad_dimensions:            # @halide_error_bad_dimensions
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movl	%ecx, %r13d
	movl	%edx, %r15d
	movq	%rsi, %r14
	movq	%rdi, -48(%rbp)                 # 8-byte Spill
	movl	$1024, %edi                     # imm = 0x400
	callq	malloc@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.LBB157_1
# %bb.2:                                # %if.then6.i
	leaq	1023(%r12), %rbx
	movb	$0, 1023(%r12)
	movq	%r12, %rdi
	movq	%rbx, %rsi
	jmp	.LBB157_3
.LBB157_1:                              # %entry.split
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB157_3:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	movq	%r14, %rdx
	callq	halide_string_to_string@PLT
	leaq	.L.str.11.122(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movslq	%r13d, %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.12.123(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movslq	%r15d, %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.13.124(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	testq	%r12, %r12
	je	.LBB157_4
# %bb.5:                                # %if.else.i
	subq	%r12, %rax
	incq	%rax
	movq	-48(%rbp), %rbx                 # 8-byte Reload
	movq	%rbx, %rdi
	movq	%r12, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r12, %rsi
	jmp	.LBB157_6
.LBB157_4:
	leaq	.L.str.29.163(%rip), %rsi
	movq	-48(%rbp), %rbx                 # 8-byte Reload
.LBB157_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	movq	%rbx, %rdi
	callq	halide_error@PLT
	movq	%r12, %rdi
	callq	free@PLT
	movl	$-43, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end157:
	.size	halide_error_bad_dimensions, .Lfunc_end157-halide_error_bad_dimensions
                                        # -- End function
	.section	.text.halide_error_access_out_of_bounds,"ax",@progbits
	.weak	halide_error_access_out_of_bounds # -- Begin function halide_error_access_out_of_bounds
	.p2align	4, 0x90
	.type	halide_error_access_out_of_bounds,@function
halide_error_access_out_of_bounds:      # @halide_error_access_out_of_bounds
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	movq	%rsi, %r15
	movq	%rdi, -56(%rbp)                 # 8-byte Spill
	cmpl	%r9d, %ecx
	jge	.LBB158_7
# %bb.1:                                # %if.then
	movl	%r9d, %r12d
	movl	%ecx, %r14d
	movl	%edx, -44(%rbp)                 # 4-byte Spill
	movl	$1024, %edi                     # imm = 0x400
	callq	malloc@PLT
	movq	%rax, %r13
	testq	%rax, %rax
	je	.LBB158_2
# %bb.3:                                # %if.then6.i
	leaq	1023(%r13), %rbx
	movb	$0, 1023(%r13)
	movq	%r13, %rdi
	movq	%rbx, %rsi
	jmp	.LBB158_4
.LBB158_7:                              # %if.else
	movl	%r8d, %ebx
	movl	16(%rbp), %r12d
	cmpl	%r12d, %r8d
	jle	.LBB158_14
# %bb.8:                                # %if.then8
	movl	%edx, -44(%rbp)                 # 4-byte Spill
	movl	$1024, %edi                     # imm = 0x400
	callq	malloc@PLT
	movq	%rax, %r13
	testq	%rax, %rax
	je	.LBB158_9
# %bb.10:                               # %if.then6.i59
	leaq	1023(%r13), %r14
	movb	$0, 1023(%r13)
	movq	%r13, %rdi
	movq	%r14, %rsi
	jmp	.LBB158_11
.LBB158_2:                              # %if.then.split
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB158_4:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	movq	%r15, %rdx
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	leaq	.L.str.14.125(%rip), %rdx
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movslq	%r14d, %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.15.126(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movslq	%r12d, %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.16.127(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movslq	-44(%rbp), %rdx                 # 4-byte Folded Reload
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	testq	%r13, %r13
	je	.LBB158_6
.LBB158_12:
	movq	-56(%rbp), %rbx                 # 8-byte Reload
	subq	%r13, %rax
	incq	%rax
	movq	%rbx, %rdi
	movq	%r13, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r13, %r14
	jmp	.LBB158_13
.LBB158_9:                              # %if.then8.split
	xorl	%r14d, %r14d
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB158_11:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit62
	movq	%r15, %rdx
	callq	halide_string_to_string@PLT
	leaq	.L.str.14.125(%rip), %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	callq	halide_string_to_string@PLT
	movslq	%ebx, %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.17.128(%rip), %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	callq	halide_string_to_string@PLT
	movslq	%r12d, %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.16.127(%rip), %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	callq	halide_string_to_string@PLT
	movslq	-44(%rbp), %rdx                 # 4-byte Folded Reload
	movq	%rax, %rdi
	movq	%r14, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	testq	%r13, %r13
	jne	.LBB158_12
.LBB158_6:
	xorl	%r14d, %r14d
	leaq	.L.str.29.163(%rip), %r13
	movq	-56(%rbp), %rbx                 # 8-byte Reload
.LBB158_13:                             # %if.end17.sink.split
	movq	%rbx, %rdi
	movq	%r13, %rsi
	callq	halide_error@PLT
	movq	%r14, %rdi
	callq	free@PLT
.LBB158_14:                             # %if.end17
	movl	$-4, %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end158:
	.size	halide_error_access_out_of_bounds, .Lfunc_end158-halide_error_access_out_of_bounds
                                        # -- End function
	.section	.text.halide_error_buffer_allocation_too_large,"ax",@progbits
	.weak	halide_error_buffer_allocation_too_large # -- Begin function halide_error_buffer_allocation_too_large
	.p2align	4, 0x90
	.type	halide_error_buffer_allocation_too_large,@function
halide_error_buffer_allocation_too_large: # @halide_error_buffer_allocation_too_large
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movq	%rcx, -48(%rbp)                 # 8-byte Spill
	movq	%rdx, %r12
	movq	%rsi, %r15
	movq	%rdi, %r14
	movl	$1024, %edi                     # imm = 0x400
	callq	malloc@PLT
	movq	%rax, %r13
	testq	%rax, %rax
	je	.LBB159_1
# %bb.2:                                # %if.then6.i
	leaq	1023(%r13), %rbx
	movb	$0, 1023(%r13)
	leaq	.L.str.18.129(%rip), %rdx
	movq	%r13, %rdi
	movq	%rbx, %rsi
	jmp	.LBB159_3
.LBB159_1:                              # %entry.split
	leaq	.L.str.18.129(%rip), %rdx
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB159_3:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	halide_string_to_string@PLT
	leaq	.L.str.19.130(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r12, %rdx
	movl	$1, %ecx
	callq	halide_uint64_to_string@PLT
	leaq	.L.str.20.131(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	-48(%rbp), %rdx                 # 8-byte Reload
	movl	$1, %ecx
	callq	halide_uint64_to_string@PLT
	testq	%r13, %r13
	je	.LBB159_4
# %bb.5:                                # %if.else.i
	subq	%r13, %rax
	incq	%rax
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r13, %rsi
	jmp	.LBB159_6
.LBB159_4:
	leaq	.L.str.29.163(%rip), %rsi
.LBB159_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%r13, %rdi
	callq	free@PLT
	movl	$-5, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end159:
	.size	halide_error_buffer_allocation_too_large, .Lfunc_end159-halide_error_buffer_allocation_too_large
                                        # -- End function
	.section	.text.halide_error_buffer_extents_negative,"ax",@progbits
	.weak	halide_error_buffer_extents_negative # -- Begin function halide_error_buffer_extents_negative
	.p2align	4, 0x90
	.type	halide_error_buffer_extents_negative,@function
halide_error_buffer_extents_negative:   # @halide_error_buffer_extents_negative
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movl	%ecx, %r15d
	movl	%edx, %r13d
	movq	%rsi, %r14
	movq	%rdi, -48(%rbp)                 # 8-byte Spill
	movl	$1024, %edi                     # imm = 0x400
	callq	malloc@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.LBB160_1
# %bb.2:                                # %if.then6.i
	leaq	1023(%r12), %rbx
	movb	$0, 1023(%r12)
	leaq	.L.str.21.132(%rip), %rdx
	movq	%r12, %rdi
	movq	%rbx, %rsi
	jmp	.LBB160_3
.LBB160_1:                              # %entry.split
	leaq	.L.str.21.132(%rip), %rdx
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB160_3:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r14, %rdx
	callq	halide_string_to_string@PLT
	leaq	.L.str.22.133(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movslq	%r13d, %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.23.134(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movslq	%r15d, %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.8.119(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	testq	%r12, %r12
	je	.LBB160_4
# %bb.5:                                # %if.else.i
	subq	%r12, %rax
	incq	%rax
	movq	-48(%rbp), %rbx                 # 8-byte Reload
	movq	%rbx, %rdi
	movq	%r12, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r12, %rsi
	jmp	.LBB160_6
.LBB160_4:
	leaq	.L.str.29.163(%rip), %rsi
	movq	-48(%rbp), %rbx                 # 8-byte Reload
.LBB160_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	movq	%rbx, %rdi
	callq	halide_error@PLT
	movq	%r12, %rdi
	callq	free@PLT
	movl	$-28, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end160:
	.size	halide_error_buffer_extents_negative, .Lfunc_end160-halide_error_buffer_extents_negative
                                        # -- End function
	.section	.text.halide_error_buffer_extents_too_large,"ax",@progbits
	.weak	halide_error_buffer_extents_too_large # -- Begin function halide_error_buffer_extents_too_large
	.p2align	4, 0x90
	.type	halide_error_buffer_extents_too_large,@function
halide_error_buffer_extents_too_large:  # @halide_error_buffer_extents_too_large
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movq	%rcx, -48(%rbp)                 # 8-byte Spill
	movq	%rdx, %r12
	movq	%rsi, %r15
	movq	%rdi, %r14
	movl	$1024, %edi                     # imm = 0x400
	callq	malloc@PLT
	movq	%rax, %r13
	testq	%rax, %rax
	je	.LBB161_1
# %bb.2:                                # %if.then6.i
	leaq	1023(%r13), %rbx
	movb	$0, 1023(%r13)
	leaq	.L.str.24.135(%rip), %rdx
	movq	%r13, %rdi
	movq	%rbx, %rsi
	jmp	.LBB161_3
.LBB161_1:                              # %entry.split
	leaq	.L.str.24.135(%rip), %rdx
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB161_3:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	halide_string_to_string@PLT
	leaq	.L.str.19.130(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r12, %rdx
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.20.131(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	-48(%rbp), %rdx                 # 8-byte Reload
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	testq	%r13, %r13
	je	.LBB161_4
# %bb.5:                                # %if.else.i
	subq	%r13, %rax
	incq	%rax
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r13, %rsi
	jmp	.LBB161_6
.LBB161_4:
	leaq	.L.str.29.163(%rip), %rsi
.LBB161_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%r13, %rdi
	callq	free@PLT
	movl	$-6, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end161:
	.size	halide_error_buffer_extents_too_large, .Lfunc_end161-halide_error_buffer_extents_too_large
                                        # -- End function
	.section	.text.halide_error_constraints_make_required_region_smaller,"ax",@progbits
	.weak	halide_error_constraints_make_required_region_smaller # -- Begin function halide_error_constraints_make_required_region_smaller
	.p2align	4, 0x90
	.type	halide_error_constraints_make_required_region_smaller,@function
halide_error_constraints_make_required_region_smaller: # @halide_error_constraints_make_required_region_smaller
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	movl	%r9d, %r13d
                                        # kill: def $r8d killed $r8d def $r8
                                        # kill: def $ecx killed $ecx def $rcx
	movl	%edx, %r14d
	movq	%rsi, %r12
	movq	%rdi, -56(%rbp)                 # 8-byte Spill
	movl	16(%rbp), %eax
	leal	-1(%r13,%rax), %eax
	movl	%eax, -44(%rbp)                 # 4-byte Spill
	movq	%rcx, -64(%rbp)                 # 8-byte Spill
	leal	(%rcx,%r8), %eax
	decl	%eax
	movl	%eax, -48(%rbp)                 # 4-byte Spill
	movl	$1024, %edi                     # imm = 0x400
	callq	malloc@PLT
	movq	%rax, %r15
	testq	%rax, %rax
	je	.LBB162_1
# %bb.2:                                # %if.then6.i
	leaq	1023(%r15), %rbx
	movb	$0, 1023(%r15)
	leaq	.L.str.25.136(%rip), %rdx
	movq	%r15, %rdi
	movq	%rbx, %rsi
	jmp	.LBB162_3
.LBB162_1:                              # %entry.split
	leaq	.L.str.25.136(%rip), %rdx
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB162_3:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r12, %rdx
	callq	halide_string_to_string@PLT
	leaq	.L.str.26.137(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movslq	%r14d, %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.27.138(%rip), %r14
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r14, %rdx
	callq	halide_string_to_string@PLT
	leaq	.L.str.28.139(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movslq	%r13d, %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.6.117(%rip), %r12
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r12, %rdx
	callq	halide_string_to_string@PLT
	movslq	-44(%rbp), %rdx                 # 4-byte Folded Reload
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r14, %rdx
	callq	halide_string_to_string@PLT
	leaq	.L.str.29.140(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movslq	-64(%rbp), %rdx                 # 4-byte Folded Reload
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r12, %rdx
	callq	halide_string_to_string@PLT
	movslq	-48(%rbp), %rdx                 # 4-byte Folded Reload
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.30.141(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	testq	%r15, %r15
	je	.LBB162_4
# %bb.5:                                # %if.else.i
	subq	%r15, %rax
	incq	%rax
	movq	-56(%rbp), %rbx                 # 8-byte Reload
	movq	%rbx, %rdi
	movq	%r15, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r15, %rsi
	jmp	.LBB162_6
.LBB162_4:
	leaq	.L.str.29.163(%rip), %rsi
	movq	-56(%rbp), %rbx                 # 8-byte Reload
.LBB162_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	movq	%rbx, %rdi
	callq	halide_error@PLT
	movq	%r15, %rdi
	callq	free@PLT
	movl	$-7, %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end162:
	.size	halide_error_constraints_make_required_region_smaller, .Lfunc_end162-halide_error_constraints_make_required_region_smaller
                                        # -- End function
	.section	.text.halide_error_constraint_violated,"ax",@progbits
	.weak	halide_error_constraint_violated # -- Begin function halide_error_constraint_violated
	.p2align	4, 0x90
	.type	halide_error_constraint_violated,@function
halide_error_constraint_violated:       # @halide_error_constraint_violated
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	movl	%r8d, -44(%rbp)                 # 4-byte Spill
	movq	%rcx, %r13
	movl	%edx, %r15d
	movq	%rsi, %r14
	movq	%rdi, -56(%rbp)                 # 8-byte Spill
	movl	$1024, %edi                     # imm = 0x400
	callq	malloc@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.LBB163_1
# %bb.2:                                # %if.then6.i
	leaq	1023(%r12), %rbx
	movb	$0, 1023(%r12)
	leaq	.L.str.31.142(%rip), %rdx
	movq	%r12, %rdi
	movq	%rbx, %rsi
	jmp	.LBB163_3
.LBB163_1:                              # %entry.split
	leaq	.L.str.31.142(%rip), %rdx
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB163_3:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r14, %rdx
	callq	halide_string_to_string@PLT
	leaq	.L.str.32.143(%rip), %r14
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r14, %rdx
	callq	halide_string_to_string@PLT
	movslq	%r15d, %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.33.144(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r13, %rdx
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r14, %rdx
	callq	halide_string_to_string@PLT
	movslq	-44(%rbp), %rdx                 # 4-byte Folded Reload
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.8.119(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	testq	%r12, %r12
	je	.LBB163_4
# %bb.5:                                # %if.else.i
	subq	%r12, %rax
	incq	%rax
	movq	-56(%rbp), %rbx                 # 8-byte Reload
	movq	%rbx, %rdi
	movq	%r12, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r12, %rsi
	jmp	.LBB163_6
.LBB163_4:
	leaq	.L.str.29.163(%rip), %rsi
	movq	-56(%rbp), %rbx                 # 8-byte Reload
.LBB163_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	movq	%rbx, %rdi
	callq	halide_error@PLT
	movq	%r12, %rdi
	callq	free@PLT
	movl	$-8, %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end163:
	.size	halide_error_constraint_violated, .Lfunc_end163-halide_error_constraint_violated
                                        # -- End function
	.section	.text.halide_error_param_too_small_i64,"ax",@progbits
	.weak	halide_error_param_too_small_i64 # -- Begin function halide_error_param_too_small_i64
	.p2align	4, 0x90
	.type	halide_error_param_too_small_i64,@function
halide_error_param_too_small_i64:       # @halide_error_param_too_small_i64
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movq	%rcx, -48(%rbp)                 # 8-byte Spill
	movq	%rdx, %r12
	movq	%rsi, %r15
	movq	%rdi, %r14
	movl	$1024, %edi                     # imm = 0x400
	callq	malloc@PLT
	movq	%rax, %r13
	testq	%rax, %rax
	je	.LBB164_1
# %bb.2:                                # %if.then6.i
	leaq	1023(%r13), %rbx
	movb	$0, 1023(%r13)
	leaq	.L.str.34.145(%rip), %rdx
	movq	%r13, %rdi
	movq	%rbx, %rsi
	jmp	.LBB164_3
.LBB164_1:                              # %entry.split
	leaq	.L.str.34.145(%rip), %rdx
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB164_3:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	halide_string_to_string@PLT
	leaq	.L.str.19.130(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r12, %rdx
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.35.146(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	-48(%rbp), %rdx                 # 8-byte Reload
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	testq	%r13, %r13
	je	.LBB164_4
# %bb.5:                                # %if.else.i
	subq	%r13, %rax
	incq	%rax
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r13, %rsi
	jmp	.LBB164_6
.LBB164_4:
	leaq	.L.str.29.163(%rip), %rsi
.LBB164_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%r13, %rdi
	callq	free@PLT
	movl	$-9, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end164:
	.size	halide_error_param_too_small_i64, .Lfunc_end164-halide_error_param_too_small_i64
                                        # -- End function
	.section	.text.halide_error_param_too_small_u64,"ax",@progbits
	.weak	halide_error_param_too_small_u64 # -- Begin function halide_error_param_too_small_u64
	.p2align	4, 0x90
	.type	halide_error_param_too_small_u64,@function
halide_error_param_too_small_u64:       # @halide_error_param_too_small_u64
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movq	%rcx, -48(%rbp)                 # 8-byte Spill
	movq	%rdx, %r12
	movq	%rsi, %r15
	movq	%rdi, %r14
	movl	$1024, %edi                     # imm = 0x400
	callq	malloc@PLT
	movq	%rax, %r13
	testq	%rax, %rax
	je	.LBB165_1
# %bb.2:                                # %if.then6.i
	leaq	1023(%r13), %rbx
	movb	$0, 1023(%r13)
	leaq	.L.str.34.145(%rip), %rdx
	movq	%r13, %rdi
	movq	%rbx, %rsi
	jmp	.LBB165_3
.LBB165_1:                              # %entry.split
	leaq	.L.str.34.145(%rip), %rdx
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB165_3:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	halide_string_to_string@PLT
	leaq	.L.str.19.130(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r12, %rdx
	movl	$1, %ecx
	callq	halide_uint64_to_string@PLT
	leaq	.L.str.35.146(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	-48(%rbp), %rdx                 # 8-byte Reload
	movl	$1, %ecx
	callq	halide_uint64_to_string@PLT
	testq	%r13, %r13
	je	.LBB165_4
# %bb.5:                                # %if.else.i
	subq	%r13, %rax
	incq	%rax
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r13, %rsi
	jmp	.LBB165_6
.LBB165_4:
	leaq	.L.str.29.163(%rip), %rsi
.LBB165_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%r13, %rdi
	callq	free@PLT
	movl	$-9, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end165:
	.size	halide_error_param_too_small_u64, .Lfunc_end165-halide_error_param_too_small_u64
                                        # -- End function
	.section	.text.halide_error_param_too_small_f64,"ax",@progbits
	.weak	halide_error_param_too_small_f64 # -- Begin function halide_error_param_too_small_f64
	.p2align	4, 0x90
	.type	halide_error_param_too_small_f64,@function
halide_error_param_too_small_f64:       # @halide_error_param_too_small_f64
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$16, %rsp
	vmovsd	%xmm1, -48(%rbp)                # 8-byte Spill
	vmovsd	%xmm0, -40(%rbp)                # 8-byte Spill
	movq	%rsi, %r12
	movq	%rdi, %r14
	movl	$1024, %edi                     # imm = 0x400
	callq	malloc@PLT
	movq	%rax, %r15
	testq	%rax, %rax
	je	.LBB166_1
# %bb.2:                                # %if.then6.i
	leaq	1023(%r15), %rbx
	movb	$0, 1023(%r15)
	leaq	.L.str.34.145(%rip), %rdx
	movq	%r15, %rdi
	movq	%rbx, %rsi
	jmp	.LBB166_3
.LBB166_1:                              # %entry.split
	leaq	.L.str.34.145(%rip), %rdx
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB166_3:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r12, %rdx
	callq	halide_string_to_string@PLT
	leaq	.L.str.19.130(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	vmovsd	-40(%rbp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movl	$1, %edx
	callq	halide_double_to_string@PLT
	leaq	.L.str.35.146(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	vmovsd	-48(%rbp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movl	$1, %edx
	callq	halide_double_to_string@PLT
	testq	%r15, %r15
	je	.LBB166_4
# %bb.5:                                # %if.else.i
	subq	%r15, %rax
	incq	%rax
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r15, %rsi
	jmp	.LBB166_6
.LBB166_4:
	leaq	.L.str.29.163(%rip), %rsi
.LBB166_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%r15, %rdi
	callq	free@PLT
	movl	$-9, %eax
	addq	$16, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end166:
	.size	halide_error_param_too_small_f64, .Lfunc_end166-halide_error_param_too_small_f64
                                        # -- End function
	.section	.text.halide_error_param_too_large_i64,"ax",@progbits
	.weak	halide_error_param_too_large_i64 # -- Begin function halide_error_param_too_large_i64
	.p2align	4, 0x90
	.type	halide_error_param_too_large_i64,@function
halide_error_param_too_large_i64:       # @halide_error_param_too_large_i64
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movq	%rcx, -48(%rbp)                 # 8-byte Spill
	movq	%rdx, %r12
	movq	%rsi, %r15
	movq	%rdi, %r14
	movl	$1024, %edi                     # imm = 0x400
	callq	malloc@PLT
	movq	%rax, %r13
	testq	%rax, %rax
	je	.LBB167_1
# %bb.2:                                # %if.then6.i
	leaq	1023(%r13), %rbx
	movb	$0, 1023(%r13)
	leaq	.L.str.34.145(%rip), %rdx
	movq	%r13, %rdi
	movq	%rbx, %rsi
	jmp	.LBB167_3
.LBB167_1:                              # %entry.split
	leaq	.L.str.34.145(%rip), %rdx
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB167_3:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	halide_string_to_string@PLT
	leaq	.L.str.19.130(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r12, %rdx
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.36(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	-48(%rbp), %rdx                 # 8-byte Reload
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	testq	%r13, %r13
	je	.LBB167_4
# %bb.5:                                # %if.else.i
	subq	%r13, %rax
	incq	%rax
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r13, %rsi
	jmp	.LBB167_6
.LBB167_4:
	leaq	.L.str.29.163(%rip), %rsi
.LBB167_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%r13, %rdi
	callq	free@PLT
	movl	$-10, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end167:
	.size	halide_error_param_too_large_i64, .Lfunc_end167-halide_error_param_too_large_i64
                                        # -- End function
	.section	.text.halide_error_param_too_large_u64,"ax",@progbits
	.weak	halide_error_param_too_large_u64 # -- Begin function halide_error_param_too_large_u64
	.p2align	4, 0x90
	.type	halide_error_param_too_large_u64,@function
halide_error_param_too_large_u64:       # @halide_error_param_too_large_u64
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movq	%rcx, -48(%rbp)                 # 8-byte Spill
	movq	%rdx, %r12
	movq	%rsi, %r15
	movq	%rdi, %r14
	movl	$1024, %edi                     # imm = 0x400
	callq	malloc@PLT
	movq	%rax, %r13
	testq	%rax, %rax
	je	.LBB168_1
# %bb.2:                                # %if.then6.i
	leaq	1023(%r13), %rbx
	movb	$0, 1023(%r13)
	leaq	.L.str.34.145(%rip), %rdx
	movq	%r13, %rdi
	movq	%rbx, %rsi
	jmp	.LBB168_3
.LBB168_1:                              # %entry.split
	leaq	.L.str.34.145(%rip), %rdx
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB168_3:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	halide_string_to_string@PLT
	leaq	.L.str.19.130(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r12, %rdx
	movl	$1, %ecx
	callq	halide_uint64_to_string@PLT
	leaq	.L.str.36(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	-48(%rbp), %rdx                 # 8-byte Reload
	movl	$1, %ecx
	callq	halide_uint64_to_string@PLT
	testq	%r13, %r13
	je	.LBB168_4
# %bb.5:                                # %if.else.i
	subq	%r13, %rax
	incq	%rax
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r13, %rsi
	jmp	.LBB168_6
.LBB168_4:
	leaq	.L.str.29.163(%rip), %rsi
.LBB168_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%r13, %rdi
	callq	free@PLT
	movl	$-10, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end168:
	.size	halide_error_param_too_large_u64, .Lfunc_end168-halide_error_param_too_large_u64
                                        # -- End function
	.section	.text.halide_error_param_too_large_f64,"ax",@progbits
	.weak	halide_error_param_too_large_f64 # -- Begin function halide_error_param_too_large_f64
	.p2align	4, 0x90
	.type	halide_error_param_too_large_f64,@function
halide_error_param_too_large_f64:       # @halide_error_param_too_large_f64
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$16, %rsp
	vmovsd	%xmm1, -48(%rbp)                # 8-byte Spill
	vmovsd	%xmm0, -40(%rbp)                # 8-byte Spill
	movq	%rsi, %r12
	movq	%rdi, %r14
	movl	$1024, %edi                     # imm = 0x400
	callq	malloc@PLT
	movq	%rax, %r15
	testq	%rax, %rax
	je	.LBB169_1
# %bb.2:                                # %if.then6.i
	leaq	1023(%r15), %rbx
	movb	$0, 1023(%r15)
	leaq	.L.str.34.145(%rip), %rdx
	movq	%r15, %rdi
	movq	%rbx, %rsi
	jmp	.LBB169_3
.LBB169_1:                              # %entry.split
	leaq	.L.str.34.145(%rip), %rdx
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB169_3:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r12, %rdx
	callq	halide_string_to_string@PLT
	leaq	.L.str.19.130(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	vmovsd	-40(%rbp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movl	$1, %edx
	callq	halide_double_to_string@PLT
	leaq	.L.str.36(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	vmovsd	-48(%rbp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movl	$1, %edx
	callq	halide_double_to_string@PLT
	testq	%r15, %r15
	je	.LBB169_4
# %bb.5:                                # %if.else.i
	subq	%r15, %rax
	incq	%rax
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r15, %rsi
	jmp	.LBB169_6
.LBB169_4:
	leaq	.L.str.29.163(%rip), %rsi
.LBB169_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%r15, %rdi
	callq	free@PLT
	movl	$-10, %eax
	addq	$16, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end169:
	.size	halide_error_param_too_large_f64, .Lfunc_end169-halide_error_param_too_large_f64
                                        # -- End function
	.section	.text.halide_error_out_of_memory,"ax",@progbits
	.weak	halide_error_out_of_memory      # -- Begin function halide_error_out_of_memory
	.p2align	4, 0x90
	.type	halide_error_out_of_memory,@function
halide_error_out_of_memory:             # @halide_error_out_of_memory
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	leaq	.L.str.37(%rip), %rsi
	callq	halide_error@PLT
	movl	$-11, %eax
	popq	%rbp
	retq
.Lfunc_end170:
	.size	halide_error_out_of_memory, .Lfunc_end170-halide_error_out_of_memory
                                        # -- End function
	.section	.text.halide_error_buffer_argument_is_null,"ax",@progbits
	.weak	halide_error_buffer_argument_is_null # -- Begin function halide_error_buffer_argument_is_null
	.p2align	4, 0x90
	.type	halide_error_buffer_argument_is_null,@function
halide_error_buffer_argument_is_null:   # @halide_error_buffer_argument_is_null
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	movq	%rsi, %r15
	movq	%rdi, %r14
	movl	$1024, %edi                     # imm = 0x400
	callq	malloc@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.LBB171_1
# %bb.2:                                # %if.then6.i
	leaq	1023(%rbx), %r12
	movb	$0, 1023(%rbx)
	leaq	.L.str.38(%rip), %rdx
	movq	%rbx, %rdi
	movq	%r12, %rsi
	jmp	.LBB171_3
.LBB171_1:                              # %entry.split
	leaq	.L.str.38(%rip), %rdx
	xorl	%r12d, %r12d
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB171_3:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%r12, %rsi
	movq	%r15, %rdx
	callq	halide_string_to_string@PLT
	leaq	.L.str.39(%rip), %rdx
	movq	%rax, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	testq	%rbx, %rbx
	je	.LBB171_4
# %bb.5:                                # %if.else.i
	subq	%rbx, %rax
	incq	%rax
	movq	%r14, %rdi
	movq	%rbx, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%rbx, %rsi
	jmp	.LBB171_6
.LBB171_4:
	leaq	.L.str.29.163(%rip), %rsi
.LBB171_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%rbx, %rdi
	callq	free@PLT
	movl	$-12, %eax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end171:
	.size	halide_error_buffer_argument_is_null, .Lfunc_end171-halide_error_buffer_argument_is_null
                                        # -- End function
	.section	.text.halide_error_debug_to_file_failed,"ax",@progbits
	.weak	halide_error_debug_to_file_failed # -- Begin function halide_error_debug_to_file_failed
	.p2align	4, 0x90
	.type	halide_error_debug_to_file_failed,@function
halide_error_debug_to_file_failed:      # @halide_error_debug_to_file_failed
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movl	%ecx, -44(%rbp)                 # 4-byte Spill
	movq	%rdx, %r12
	movq	%rsi, %r15
	movq	%rdi, %r14
	movl	$1024, %edi                     # imm = 0x400
	callq	malloc@PLT
	movq	%rax, %r13
	testq	%rax, %rax
	je	.LBB172_1
# %bb.2:                                # %if.then6.i
	leaq	1023(%r13), %rbx
	movb	$0, 1023(%r13)
	leaq	.L.str.40(%rip), %rdx
	movq	%r13, %rdi
	movq	%rbx, %rsi
	jmp	.LBB172_3
.LBB172_1:                              # %entry.split
	leaq	.L.str.40(%rip), %rdx
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB172_3:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	halide_string_to_string@PLT
	leaq	.L.str.41.147(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r12, %rdx
	callq	halide_string_to_string@PLT
	leaq	.L.str.42(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movslq	-44(%rbp), %rdx                 # 4-byte Folded Reload
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	testq	%r13, %r13
	je	.LBB172_4
# %bb.5:                                # %if.else.i
	subq	%r13, %rax
	incq	%rax
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r13, %rsi
	jmp	.LBB172_6
.LBB172_4:
	leaq	.L.str.29.163(%rip), %rsi
.LBB172_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%r13, %rdi
	callq	free@PLT
	movl	$-13, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end172:
	.size	halide_error_debug_to_file_failed, .Lfunc_end172-halide_error_debug_to_file_failed
                                        # -- End function
	.section	.text.halide_error_unaligned_host_ptr,"ax",@progbits
	.weak	halide_error_unaligned_host_ptr # -- Begin function halide_error_unaligned_host_ptr
	.p2align	4, 0x90
	.type	halide_error_unaligned_host_ptr,@function
halide_error_unaligned_host_ptr:        # @halide_error_unaligned_host_ptr
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movl	%edx, %r15d
	movq	%rsi, %r13
	movq	%rdi, %r14
	movl	$1024, %edi                     # imm = 0x400
	callq	malloc@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.LBB173_1
# %bb.2:                                # %if.then6.i
	leaq	1023(%r12), %rbx
	movb	$0, 1023(%r12)
	leaq	.L.str.43(%rip), %rdx
	movq	%r12, %rdi
	movq	%rbx, %rsi
	jmp	.LBB173_3
.LBB173_1:                              # %entry.split
	leaq	.L.str.43(%rip), %rdx
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB173_3:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r13, %rdx
	callq	halide_string_to_string@PLT
	leaq	.L.str.44(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movslq	%r15d, %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.45(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	testq	%r12, %r12
	je	.LBB173_4
# %bb.5:                                # %if.else.i
	subq	%r12, %rax
	incq	%rax
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r12, %rsi
	jmp	.LBB173_6
.LBB173_4:
	leaq	.L.str.29.163(%rip), %rsi
.LBB173_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%r12, %rdi
	callq	free@PLT
	movl	$-24, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end173:
	.size	halide_error_unaligned_host_ptr, .Lfunc_end173-halide_error_unaligned_host_ptr
                                        # -- End function
	.section	.text.halide_error_device_dirty_with_no_device_support,"ax",@progbits
	.weak	halide_error_device_dirty_with_no_device_support # -- Begin function halide_error_device_dirty_with_no_device_support
	.p2align	4, 0x90
	.type	halide_error_device_dirty_with_no_device_support,@function
halide_error_device_dirty_with_no_device_support: # @halide_error_device_dirty_with_no_device_support
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	movq	%rsi, %r15
	movq	%rdi, %r14
	movl	$1024, %edi                     # imm = 0x400
	callq	malloc@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.LBB174_1
# %bb.2:                                # %if.then6.i
	leaq	1023(%rbx), %r12
	movb	$0, 1023(%rbx)
	leaq	.L.str.46(%rip), %rdx
	movq	%rbx, %rdi
	movq	%r12, %rsi
	jmp	.LBB174_3
.LBB174_1:                              # %entry.split
	leaq	.L.str.46(%rip), %rdx
	xorl	%r12d, %r12d
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB174_3:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%r12, %rsi
	movq	%r15, %rdx
	callq	halide_string_to_string@PLT
	leaq	.L.str.47(%rip), %rdx
	movq	%rax, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	leaq	.L.str.48(%rip), %rdx
	movq	%rax, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	testq	%rbx, %rbx
	je	.LBB174_4
# %bb.5:                                # %if.else.i
	subq	%rbx, %rax
	incq	%rax
	movq	%r14, %rdi
	movq	%rbx, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%rbx, %rsi
	jmp	.LBB174_6
.LBB174_4:
	leaq	.L.str.29.163(%rip), %rsi
.LBB174_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%rbx, %rdi
	callq	free@PLT
	movl	$-44, %eax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end174:
	.size	halide_error_device_dirty_with_no_device_support, .Lfunc_end174-halide_error_device_dirty_with_no_device_support
                                        # -- End function
	.section	.text.halide_error_host_is_null,"ax",@progbits
	.weak	halide_error_host_is_null       # -- Begin function halide_error_host_is_null
	.p2align	4, 0x90
	.type	halide_error_host_is_null,@function
halide_error_host_is_null:              # @halide_error_host_is_null
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	movq	%rsi, %r15
	movq	%rdi, %r14
	movl	$1024, %edi                     # imm = 0x400
	callq	malloc@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.LBB175_1
# %bb.2:                                # %if.then6.i
	leaq	1023(%rbx), %r12
	movb	$0, 1023(%rbx)
	leaq	.L.str.43(%rip), %rdx
	movq	%rbx, %rdi
	movq	%r12, %rsi
	jmp	.LBB175_3
.LBB175_1:                              # %entry.split
	leaq	.L.str.43(%rip), %rdx
	xorl	%r12d, %r12d
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB175_3:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%r12, %rsi
	movq	%r15, %rdx
	callq	halide_string_to_string@PLT
	leaq	.L.str.49(%rip), %rdx
	movq	%rax, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	testq	%rbx, %rbx
	je	.LBB175_4
# %bb.5:                                # %if.else.i
	subq	%rbx, %rax
	incq	%rax
	movq	%r14, %rdi
	movq	%rbx, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%rbx, %rsi
	jmp	.LBB175_6
.LBB175_4:
	leaq	.L.str.29.163(%rip), %rsi
.LBB175_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%rbx, %rdi
	callq	free@PLT
	movl	$-34, %eax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end175:
	.size	halide_error_host_is_null, .Lfunc_end175-halide_error_host_is_null
                                        # -- End function
	.section	.text.halide_error_bad_fold,"ax",@progbits
	.weak	halide_error_bad_fold           # -- Begin function halide_error_bad_fold
	.p2align	4, 0x90
	.type	halide_error_bad_fold,@function
halide_error_bad_fold:                  # @halide_error_bad_fold
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movq	%rcx, -48(%rbp)                 # 8-byte Spill
	movq	%rdx, %r15
	movq	%rsi, %r13
	movq	%rdi, %r14
	movl	$1024, %edi                     # imm = 0x400
	callq	malloc@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.LBB176_1
# %bb.2:                                # %if.then6.i
	leaq	1023(%r12), %rbx
	movb	$0, 1023(%r12)
	leaq	.L.str.50.148(%rip), %rdx
	movq	%r12, %rdi
	movq	%rbx, %rsi
	jmp	.LBB176_3
.LBB176_1:                              # %entry.split
	leaq	.L.str.50.148(%rip), %rdx
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB176_3:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	halide_string_to_string@PLT
	leaq	.L.str.51(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r13, %rdx
	callq	halide_string_to_string@PLT
	leaq	.L.str.52(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	-48(%rbp), %rdx                 # 8-byte Reload
	callq	halide_string_to_string@PLT
	leaq	.L.str.30.141(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	testq	%r12, %r12
	je	.LBB176_4
# %bb.5:                                # %if.else.i
	subq	%r12, %rax
	incq	%rax
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r12, %rsi
	jmp	.LBB176_6
.LBB176_4:
	leaq	.L.str.29.163(%rip), %rsi
.LBB176_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%r12, %rdi
	callq	free@PLT
	movl	$-25, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end176:
	.size	halide_error_bad_fold, .Lfunc_end176-halide_error_bad_fold
                                        # -- End function
	.section	.text.halide_error_bad_extern_fold,"ax",@progbits
	.weak	halide_error_bad_extern_fold    # -- Begin function halide_error_bad_extern_fold
	.p2align	4, 0x90
	.type	halide_error_bad_extern_fold,@function
halide_error_bad_extern_fold:           # @halide_error_bad_extern_fold
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$40, %rsp
	movl	%r9d, %r12d
                                        # kill: def $r8d killed $r8d def $r8
	movl	%ecx, %r15d
	movq	%rsi, %r14
	movq	%rdi, %rbx
	movl	16(%rbp), %eax
	cmpl	%r9d, %ecx
	movq	%rsi, -64(%rbp)                 # 8-byte Spill
	jl	.LBB177_2
# %bb.1:                                # %lor.lhs.false
	leal	(%r8,%r15), %ecx
	addl	%r12d, %eax
	cmpl	%eax, %ecx
	jle	.LBB177_9
.LBB177_2:                              # %if.then
	movq	%r15, -72(%rbp)                 # 8-byte Spill
	movl	%edx, %r15d
	movq	%r8, -48(%rbp)                  # 8-byte Spill
	movl	$1024, %edi                     # imm = 0x400
	callq	malloc@PLT
	movq	%rax, %r13
	testq	%rax, %rax
	movq	%rbx, -56(%rbp)                 # 8-byte Spill
	je	.LBB177_3
# %bb.4:                                # %if.then6.i
	leaq	1023(%r13), %r14
	movb	$0, 1023(%r13)
	leaq	.L.str.53(%rip), %rdx
	movq	%r13, %rdi
	movq	%r14, %rsi
	jmp	.LBB177_5
.LBB177_3:                              # %if.then.split
	leaq	.L.str.53(%rip), %rdx
	xorl	%r14d, %r14d
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB177_5:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movslq	%r15d, %rdx
	movq	%r14, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.51(%rip), %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%r14, %rsi
	movq	-64(%rbp), %rdx                 # 8-byte Reload
	callq	halide_string_to_string@PLT
	leaq	.L.str.54(%rip), %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	callq	halide_string_to_string@PLT
	movq	-72(%rbp), %r15                 # 8-byte Reload
	movslq	%r15d, %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.55(%rip), %rbx
	movq	%rax, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	halide_string_to_string@PLT
	movq	-48(%rbp), %rcx                 # 8-byte Reload
	addl	%r15d, %ecx
	decl	%ecx
	movslq	%ecx, %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.56(%rip), %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	callq	halide_string_to_string@PLT
	leaq	.L.str.57(%rip), %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	callq	halide_string_to_string@PLT
	movslq	%r12d, %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	movq	%rax, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	halide_string_to_string@PLT
	movl	16(%rbp), %ecx
	addl	%r12d, %ecx
	decl	%ecx
	movslq	%ecx, %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.58.149(%rip), %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	callq	halide_string_to_string@PLT
	testq	%r13, %r13
	je	.LBB177_6
# %bb.7:
	movq	-56(%rbp), %rbx                 # 8-byte Reload
	jmp	.LBB177_8
.LBB177_6:
	xorl	%r14d, %r14d
	leaq	.L.str.29.163(%rip), %r13
	movq	-56(%rbp), %rbx                 # 8-byte Reload
	jmp	.LBB177_14
.LBB177_9:                              # %if.else
	movl	%ecx, -48(%rbp)                 # 4-byte Spill
	movl	%edx, %r12d
	movl	$1024, %edi                     # imm = 0x400
	callq	malloc@PLT
	movq	%rax, %r13
	testq	%rax, %rax
	je	.LBB177_10
# %bb.11:                               # %if.then6.i107
	leaq	1023(%r13), %r14
	movb	$0, 1023(%r13)
	leaq	.L.str.53(%rip), %rdx
	movq	%r13, %rdi
	movq	%r14, %rsi
	jmp	.LBB177_12
.LBB177_10:                             # %if.else.split
	leaq	.L.str.53(%rip), %rdx
	xorl	%r14d, %r14d
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB177_12:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit110
	callq	halide_string_to_string@PLT
	movslq	%r12d, %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.51(%rip), %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%r14, %rsi
	movq	-64(%rbp), %rdx                 # 8-byte Reload
	callq	halide_string_to_string@PLT
	leaq	.L.str.54(%rip), %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	callq	halide_string_to_string@PLT
	movslq	%r15d, %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.55(%rip), %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	callq	halide_string_to_string@PLT
	movl	-48(%rbp), %ecx                 # 4-byte Reload
	decl	%ecx
	movslq	%ecx, %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.56(%rip), %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	callq	halide_string_to_string@PLT
	leaq	.L.str.59.150(%rip), %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	callq	halide_string_to_string@PLT
	leaq	.L.str.60.151(%rip), %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	callq	halide_string_to_string@PLT
	movl	16(%rbp), %ecx
	movslq	%ecx, %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.30.141(%rip), %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	callq	halide_string_to_string@PLT
	testq	%r13, %r13
	je	.LBB177_13
.LBB177_8:                              # %if.end.sink.split
	subq	%r13, %rax
	incq	%rax
	movq	%rbx, %rdi
	movq	%r13, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r13, %r14
.LBB177_14:                             # %if.end
	movq	%rbx, %rdi
	movq	%r13, %rsi
	callq	halide_error@PLT
	movq	%r14, %rdi
	callq	free@PLT
	movl	$-35, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB177_13:
	xorl	%r14d, %r14d
	leaq	.L.str.29.163(%rip), %r13
	jmp	.LBB177_14
.Lfunc_end177:
	.size	halide_error_bad_extern_fold, .Lfunc_end177-halide_error_bad_extern_fold
                                        # -- End function
	.section	.text.halide_error_fold_factor_too_small,"ax",@progbits
	.weak	halide_error_fold_factor_too_small # -- Begin function halide_error_fold_factor_too_small
	.p2align	4, 0x90
	.type	halide_error_fold_factor_too_small,@function
halide_error_fold_factor_too_small:     # @halide_error_fold_factor_too_small
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	movl	%r9d, -44(%rbp)                 # 4-byte Spill
	movq	%r8, -64(%rbp)                  # 8-byte Spill
	movl	%ecx, %r13d
	movq	%rdx, %r14
	movq	%rsi, %r15
	movq	%rdi, -56(%rbp)                 # 8-byte Spill
	movl	$1024, %edi                     # imm = 0x400
	callq	malloc@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.LBB178_1
# %bb.2:                                # %if.then6.i
	leaq	1023(%r12), %rbx
	movb	$0, 1023(%r12)
	leaq	.L.str.61.152(%rip), %rdx
	movq	%r12, %rdi
	movq	%rbx, %rsi
	jmp	.LBB178_3
.LBB178_1:                              # %entry.split
	leaq	.L.str.61.152(%rip), %rdx
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB178_3:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	callq	halide_string_to_string@PLT
	movslq	%r13d, %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.62(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r14, %rdx
	callq	halide_string_to_string@PLT
	leaq	.L.str.51(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	halide_string_to_string@PLT
	leaq	.L.str.63(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	-64(%rbp), %rdx                 # 8-byte Reload
	callq	halide_string_to_string@PLT
	leaq	.L.str.32.143(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movslq	-44(%rbp), %rdx                 # 4-byte Folded Reload
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.64.153(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	testq	%r12, %r12
	je	.LBB178_4
# %bb.5:                                # %if.else.i
	subq	%r12, %rax
	incq	%rax
	movq	-56(%rbp), %rbx                 # 8-byte Reload
	movq	%rbx, %rdi
	movq	%r12, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r12, %rsi
	jmp	.LBB178_6
.LBB178_4:
	leaq	.L.str.29.163(%rip), %rsi
	movq	-56(%rbp), %rbx                 # 8-byte Reload
.LBB178_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	movq	%rbx, %rdi
	callq	halide_error@PLT
	movq	%r12, %rdi
	callq	free@PLT
	movl	$-26, %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end178:
	.size	halide_error_fold_factor_too_small, .Lfunc_end178-halide_error_fold_factor_too_small
                                        # -- End function
	.section	.text.halide_error_requirement_failed,"ax",@progbits
	.weak	halide_error_requirement_failed # -- Begin function halide_error_requirement_failed
	.p2align	4, 0x90
	.type	halide_error_requirement_failed,@function
halide_error_requirement_failed:        # @halide_error_requirement_failed
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movq	%rdx, %r15
	movq	%rsi, %r12
	movq	%rdi, %r14
	movl	$1024, %edi                     # imm = 0x400
	callq	malloc@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.LBB179_1
# %bb.2:                                # %if.then6.i
	leaq	1023(%rbx), %r13
	movb	$0, 1023(%rbx)
	leaq	.L.str.65(%rip), %rdx
	movq	%rbx, %rdi
	movq	%r13, %rsi
	jmp	.LBB179_3
.LBB179_1:                              # %entry.split
	leaq	.L.str.65(%rip), %rdx
	xorl	%r13d, %r13d
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB179_3:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%r13, %rsi
	movq	%r12, %rdx
	callq	halide_string_to_string@PLT
	leaq	.L.str.66(%rip), %rdx
	movq	%rax, %rdi
	movq	%r13, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%r13, %rsi
	movq	%r15, %rdx
	callq	halide_string_to_string@PLT
	testq	%rbx, %rbx
	je	.LBB179_4
# %bb.5:                                # %if.else.i
	subq	%rbx, %rax
	incq	%rax
	movq	%r14, %rdi
	movq	%rbx, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%rbx, %rsi
	jmp	.LBB179_6
.LBB179_4:
	leaq	.L.str.29.163(%rip), %rsi
.LBB179_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%rbx, %rdi
	callq	free@PLT
	movl	$-27, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end179:
	.size	halide_error_requirement_failed, .Lfunc_end179-halide_error_requirement_failed
                                        # -- End function
	.section	.text.halide_error_specialize_fail,"ax",@progbits
	.weak	halide_error_specialize_fail    # -- Begin function halide_error_specialize_fail
	.p2align	4, 0x90
	.type	halide_error_specialize_fail,@function
halide_error_specialize_fail:           # @halide_error_specialize_fail
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	movq	%rsi, %r15
	movq	%rdi, %r14
	movl	$1024, %edi                     # imm = 0x400
	callq	malloc@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.LBB180_1
# %bb.2:                                # %if.else.i
	leaq	1023(%rbx), %r12
	movb	$0, 1023(%rbx)
	leaq	.L.str.67(%rip), %rdx
	movq	%rbx, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%r12, %rsi
	movq	%r15, %rdx
	callq	halide_string_to_string@PLT
	subq	%rbx, %rax
	leaq	1(%rax), %rdx
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%rbx, %rsi
	jmp	.LBB180_3
.LBB180_1:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit.thread
	leaq	.L.str.67(%rip), %rdx
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	xorl	%esi, %esi
	movq	%r15, %rdx
	callq	halide_string_to_string@PLT
	leaq	.L.str.29.163(%rip), %rsi
.LBB180_3:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%rbx, %rdi
	callq	free@PLT
	movl	$-31, %eax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end180:
	.size	halide_error_specialize_fail, .Lfunc_end180-halide_error_specialize_fail
                                        # -- End function
	.section	.text.halide_error_no_device_interface,"ax",@progbits
	.weak	halide_error_no_device_interface # -- Begin function halide_error_no_device_interface
	.p2align	4, 0x90
	.type	halide_error_no_device_interface,@function
halide_error_no_device_interface:       # @halide_error_no_device_interface
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	movq	%rdi, %r14
	movl	$1024, %edi                     # imm = 0x400
	callq	malloc@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.LBB181_1
# %bb.2:                                # %if.else.i
	leaq	1023(%rbx), %rsi
	movb	$0, 1023(%rbx)
	leaq	.L.str.68(%rip), %rdx
	movq	%rbx, %rdi
	callq	halide_string_to_string@PLT
	subq	%rbx, %rax
	leaq	1(%rax), %rdx
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%rbx, %rsi
	jmp	.LBB181_3
.LBB181_1:                              # %if.then.i
	leaq	.L.str.68(%rip), %rdx
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	halide_string_to_string@PLT
	leaq	.L.str.29.163(%rip), %rsi
.LBB181_3:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%rbx, %rdi
	callq	free@PLT
	movl	$-19, %eax
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end181:
	.size	halide_error_no_device_interface, .Lfunc_end181-halide_error_no_device_interface
                                        # -- End function
	.section	.text.halide_error_device_interface_no_device,"ax",@progbits
	.weak	halide_error_device_interface_no_device # -- Begin function halide_error_device_interface_no_device
	.p2align	4, 0x90
	.type	halide_error_device_interface_no_device,@function
halide_error_device_interface_no_device: # @halide_error_device_interface_no_device
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	movq	%rdi, %r14
	movl	$1024, %edi                     # imm = 0x400
	callq	malloc@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.LBB182_1
# %bb.2:                                # %if.else.i
	leaq	1023(%rbx), %rsi
	movb	$0, 1023(%rbx)
	leaq	.L.str.69(%rip), %rdx
	movq	%rbx, %rdi
	callq	halide_string_to_string@PLT
	subq	%rbx, %rax
	leaq	1(%rax), %rdx
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%rbx, %rsi
	jmp	.LBB182_3
.LBB182_1:                              # %if.then.i
	leaq	.L.str.69(%rip), %rdx
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	halide_string_to_string@PLT
	leaq	.L.str.29.163(%rip), %rsi
.LBB182_3:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%rbx, %rdi
	callq	free@PLT
	movl	$-36, %eax
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end182:
	.size	halide_error_device_interface_no_device, .Lfunc_end182-halide_error_device_interface_no_device
                                        # -- End function
	.section	.text.halide_error_host_and_device_dirty,"ax",@progbits
	.weak	halide_error_host_and_device_dirty # -- Begin function halide_error_host_and_device_dirty
	.p2align	4, 0x90
	.type	halide_error_host_and_device_dirty,@function
halide_error_host_and_device_dirty:     # @halide_error_host_and_device_dirty
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	movq	%rdi, %r14
	movl	$1024, %edi                     # imm = 0x400
	callq	malloc@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.LBB183_1
# %bb.2:                                # %if.else.i
	leaq	1023(%rbx), %rsi
	movb	$0, 1023(%rbx)
	leaq	.L.str.70(%rip), %rdx
	movq	%rbx, %rdi
	callq	halide_string_to_string@PLT
	subq	%rbx, %rax
	leaq	1(%rax), %rdx
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%rbx, %rsi
	jmp	.LBB183_3
.LBB183_1:                              # %if.then.i
	leaq	.L.str.70(%rip), %rdx
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	halide_string_to_string@PLT
	leaq	.L.str.29.163(%rip), %rsi
.LBB183_3:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%rbx, %rdi
	callq	free@PLT
	movl	$-37, %eax
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end183:
	.size	halide_error_host_and_device_dirty, .Lfunc_end183-halide_error_host_and_device_dirty
                                        # -- End function
	.section	.text.halide_error_buffer_is_null,"ax",@progbits
	.weak	halide_error_buffer_is_null     # -- Begin function halide_error_buffer_is_null
	.p2align	4, 0x90
	.type	halide_error_buffer_is_null,@function
halide_error_buffer_is_null:            # @halide_error_buffer_is_null
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	movq	%rsi, %r15
	movq	%rdi, %r14
	movl	$1024, %edi                     # imm = 0x400
	callq	malloc@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.LBB184_1
# %bb.2:                                # %if.then6.i
	leaq	1023(%rbx), %r12
	movb	$0, 1023(%rbx)
	leaq	.L.str.71(%rip), %rdx
	movq	%rbx, %rdi
	movq	%r12, %rsi
	jmp	.LBB184_3
.LBB184_1:                              # %entry.split
	leaq	.L.str.71(%rip), %rdx
	xorl	%r12d, %r12d
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB184_3:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%r12, %rsi
	movq	%r15, %rdx
	callq	halide_string_to_string@PLT
	leaq	.L.str.72(%rip), %rdx
	movq	%rax, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	testq	%rbx, %rbx
	je	.LBB184_4
# %bb.5:                                # %if.else.i
	subq	%rbx, %rax
	incq	%rax
	movq	%r14, %rdi
	movq	%rbx, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%rbx, %rsi
	jmp	.LBB184_6
.LBB184_4:
	leaq	.L.str.29.163(%rip), %rsi
.LBB184_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%rbx, %rdi
	callq	free@PLT
	movl	$-38, %eax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end184:
	.size	halide_error_buffer_is_null, .Lfunc_end184-halide_error_buffer_is_null
                                        # -- End function
	.section	.text.halide_error_storage_bound_too_small,"ax",@progbits
	.weak	halide_error_storage_bound_too_small # -- Begin function halide_error_storage_bound_too_small
	.p2align	4, 0x90
	.type	halide_error_storage_bound_too_small,@function
halide_error_storage_bound_too_small:   # @halide_error_storage_bound_too_small
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	movl	%r8d, -44(%rbp)                 # 4-byte Spill
	movl	%ecx, %r14d
	movq	%rdx, %r15
	movq	%rsi, %r13
	movq	%rdi, -56(%rbp)                 # 8-byte Spill
	movl	$1024, %edi                     # imm = 0x400
	callq	malloc@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.LBB185_1
# %bb.2:                                # %if.then6.i
	leaq	1023(%r12), %rbx
	movb	$0, 1023(%r12)
	leaq	.L.str.73(%rip), %rdx
	movq	%r12, %rdi
	movq	%rbx, %rsi
	jmp	.LBB185_3
.LBB185_1:                              # %entry.split
	leaq	.L.str.73(%rip), %rdx
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB185_3:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	callq	halide_string_to_string@PLT
	movslq	%r14d, %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.62(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	halide_string_to_string@PLT
	leaq	.L.str.51(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r13, %rdx
	callq	halide_string_to_string@PLT
	leaq	.L.str.74(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movslq	-44(%rbp), %rdx                 # 4-byte Folded Reload
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.64.153(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	testq	%r12, %r12
	je	.LBB185_4
# %bb.5:                                # %if.else.i
	subq	%r12, %rax
	incq	%rax
	movq	-56(%rbp), %rbx                 # 8-byte Reload
	movq	%rbx, %rdi
	movq	%r12, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r12, %rsi
	jmp	.LBB185_6
.LBB185_4:
	leaq	.L.str.29.163(%rip), %rsi
	movq	-56(%rbp), %rbx                 # 8-byte Reload
.LBB185_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	movq	%rbx, %rdi
	callq	halide_error@PLT
	movq	%r12, %rdi
	callq	free@PLT
	movl	$-45, %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end185:
	.size	halide_error_storage_bound_too_small, .Lfunc_end185-halide_error_storage_bound_too_small
                                        # -- End function
	.section	.text.halide_error_device_crop_failed,"ax",@progbits
	.weak	halide_error_device_crop_failed # -- Begin function halide_error_device_crop_failed
	.p2align	4, 0x90
	.type	halide_error_device_crop_failed,@function
halide_error_device_crop_failed:        # @halide_error_device_crop_failed
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	movq	%rdi, %r14
	movl	$1024, %edi                     # imm = 0x400
	callq	malloc@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.LBB186_1
# %bb.2:                                # %if.else.i
	leaq	1023(%rbx), %rsi
	movb	$0, 1023(%rbx)
	leaq	.L.str.75(%rip), %rdx
	movq	%rbx, %rdi
	callq	halide_string_to_string@PLT
	subq	%rbx, %rax
	leaq	1(%rax), %rdx
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%rbx, %rsi
	jmp	.LBB186_3
.LBB186_1:                              # %if.then.i
	leaq	.L.str.75(%rip), %rdx
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	halide_string_to_string@PLT
	leaq	.L.str.29.163(%rip), %rsi
.LBB186_3:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%rbx, %rdi
	callq	free@PLT
	movl	$-41, %eax
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end186:
	.size	halide_error_device_crop_failed, .Lfunc_end186-halide_error_device_crop_failed
                                        # -- End function
	.section	.text.halide_profiler_shutdown,"ax",@progbits
	.weak	halide_profiler_shutdown        # -- Begin function halide_profiler_shutdown
	.p2align	4, 0x90
	.type	halide_profiler_shutdown,@function
halide_profiler_shutdown:               # @halide_profiler_shutdown
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	pushq	%rax
	callq	halide_profiler_get_state@PLT
	movq	40(%rax), %rdi
	testq	%rdi, %rdi
	je	.LBB187_1
# %bb.2:                                # %if.end
	movq	%rax, %rbx
	movl	$-2, 16(%rax)
	callq	halide_join_thread@PLT
	movq	$0, 40(%rbx)
	movl	$-1, 16(%rbx)
	xorl	%edi, %edi
	movq	%rbx, %rsi
	callq	halide_profiler_report_unlocked@PLT
	movq	%rbx, %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	jmp	halide_profiler_reset_unlocked@PLT # TAILCALL
.LBB187_1:                              # %cleanup
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end187:
	.size	halide_profiler_shutdown, .Lfunc_end187-halide_profiler_shutdown
                                        # -- End function
	.section	.text.halide_profiler_get_state,"ax",@progbits
	.weak	halide_profiler_get_state       # -- Begin function halide_profiler_get_state
	.p2align	4, 0x90
	.type	halide_profiler_get_state,@function
halide_profiler_get_state:              # @halide_profiler_get_state
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	leaq	_ZZ25halide_profiler_get_stateE1s(%rip), %rax
	popq	%rbp
	retq
.Lfunc_end188:
	.size	halide_profiler_get_state, .Lfunc_end188-halide_profiler_get_state
                                        # -- End function
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2                               # -- Begin function halide_profiler_report_unlocked
.LCPI189_0:
	.long	0x49742400                      # float 1.0E+6
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI189_1:
	.long	1127219200                      # 0x43300000
	.long	1160773632                      # 0x45300000
	.long	0                               # 0x0
	.long	0                               # 0x0
.LCPI189_2:
	.quad	0x4330000000000000              # double 4503599627370496
	.quad	0x4530000000000000              # double 1.9342813113834067E+25
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI189_3:
	.quad	0x3ddb7cdfd9d7bdbb              # double 1.0E-10
	.section	.text.halide_profiler_report_unlocked,"ax",@progbits
	.weak	halide_profiler_report_unlocked
	.p2align	4, 0x90
	.type	halide_profiler_report_unlocked,@function
halide_profiler_report_unlocked:        # @halide_profiler_report_unlocked
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$72, %rsp
	movq	%rsi, %r12
	movq	%rdi, %rbx
	movl	$1024, %edi                     # imm = 0x400
	callq	malloc@PLT
	movq	%rax, %r15
	testq	%rax, %rax
	je	.LBB189_1
# %bb.2:                                # %if.then6.i
	leaq	1023(%r15), %r14
	movb	$0, 1023(%r15)
	movq	24(%r12), %rsi
	movq	%r15, %r12
	testq	%rsi, %rsi
	jne	.LBB189_4
	jmp	.LBB189_7
.LBB189_1:
	xorl	%r14d, %r14d
	movq	24(%r12), %rsi
	movq	%r15, %r12
	testq	%rsi, %rsi
	je	.LBB189_7
.LBB189_4:                              # %for.body.lr.ph
	movl	$1, %eax
	subq	%r15, %rax
	movq	%rax, -104(%rbp)                # 8-byte Spill
	leaq	.L.str.20.177(%rip), %r13
	movq	%r15, %r12
	movq	%rbx, -80(%rbp)                 # 8-byte Spill
	jmp	.LBB189_5
	.p2align	4, 0x90
.LBB189_77:                             # %cleanup181
                                        #   in Loop: Header=BB189_5 Depth=1
	movq	64(%rsi), %rsi
	testq	%rsi, %rsi
	movq	-80(%rbp), %rbx                 # 8-byte Reload
	je	.LBB189_7
.LBB189_5:                              # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB189_25 Depth 2
                                        #     Child Loop BB189_28 Depth 2
                                        #       Child Loop BB189_35 Depth 3
                                        #       Child Loop BB189_43 Depth 3
                                        #       Child Loop BB189_50 Depth 3
                                        #       Child Loop BB189_56 Depth 3
                                        #       Child Loop BB189_61 Depth 3
                                        #       Child Loop BB189_63 Depth 3
	movq	(%rsi), %rax
	testq	%rax, %rax
	js	.LBB189_6
# %bb.11:                               # %for.body
                                        #   in Loop: Header=BB189_5 Depth=1
	vcvtsi2ss	%rax, %xmm4, %xmm0
	vdivss	.LCPI189_0(%rip), %xmm0, %xmm0
	cmpl	$0, 80(%rsi)
	jne	.LBB189_13
	jmp	.LBB189_77
	.p2align	4, 0x90
.LBB189_6:                              #   in Loop: Header=BB189_5 Depth=1
	movq	%rax, %rcx
	shrq	%rcx
	andl	$1, %eax
	orq	%rcx, %rax
	vcvtsi2ss	%rax, %xmm4, %xmm0
	vaddss	%xmm0, %xmm0, %xmm0
	vdivss	.LCPI189_0(%rip), %xmm0, %xmm0
	cmpl	$0, 80(%rsi)
	je	.LBB189_77
.LBB189_13:                             # %if.end
                                        #   in Loop: Header=BB189_5 Depth=1
	testq	%r15, %r15
	vmovss	%xmm0, -56(%rbp)                # 4-byte Spill
	je	.LBB189_14
# %bb.15:                               # %if.then.i273
                                        #   in Loop: Header=BB189_5 Depth=1
	movb	$0, (%r15)
	movq	32(%rsi), %rcx
	movq	40(%rsi), %rax
	movq	%rax, -64(%rbp)                 # 8-byte Spill
	movq	%rcx, -96(%rbp)                 # 8-byte Spill
	cmpq	%rax, %rcx
	sete	%r12b
	movq	48(%rsi), %rdx
	movq	%r15, %rdi
	jmp	.LBB189_16
	.p2align	4, 0x90
.LBB189_14:                             # %if.end.split
                                        #   in Loop: Header=BB189_5 Depth=1
	movq	32(%rsi), %rcx
	movq	40(%rsi), %rax
	movq	%rax, -64(%rbp)                 # 8-byte Spill
	movq	%rcx, -96(%rbp)                 # 8-byte Spill
	cmpq	%rax, %rcx
	sete	%r12b
	movq	48(%rsi), %rdx
	xorl	%edi, %edi
.LBB189_16:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EE5clearEv.exit
                                        #   in Loop: Header=BB189_5 Depth=1
	movq	%rsi, %rbx
	movq	%r14, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movb	%r12b, -41(%rbp)                # 1-byte Spill
	movq	%r14, %rsi
	leaq	.L.str.7.164(%rip), %rdx
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%r14, %rsi
	leaq	.L.str.8.165(%rip), %rdx
	callq	halide_string_to_string@PLT
	vmovss	-56(%rbp), %xmm0                # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movq	%rax, %rdi
	movq	%r14, %rsi
	xorl	%edx, %edx
	callq	halide_double_to_string@PLT
	movq	%rax, %rdi
	movq	%r14, %rsi
	leaq	.L.str.9.166(%rip), %rdx
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%r14, %rsi
	leaq	.L.str.10.167(%rip), %rdx
	callq	halide_string_to_string@PLT
	movslq	84(%rbx), %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	movq	%rax, %rdi
	movq	%r14, %rsi
	leaq	.L.str.11.168(%rip), %rdx
	callq	halide_string_to_string@PLT
	movslq	80(%rbx), %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	movq	%rax, %rdi
	movq	%r14, %rsi
	leaq	.L.str.12.169(%rip), %rdx
	callq	halide_string_to_string@PLT
	movq	%rbx, -72(%rbp)                 # 8-byte Spill
	vcvtsi2ssl	80(%rbx), %xmm4, %xmm0
	vmovss	-56(%rbp), %xmm1                # 4-byte Reload
                                        # xmm1 = mem[0],zero,zero,zero
	vdivss	%xmm0, %xmm1, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movq	%rax, %rdi
	movq	%r14, %rsi
	xorl	%edx, %edx
	callq	halide_double_to_string@PLT
	movq	%rax, %rdi
	movq	%r14, %rsi
	leaq	.L.str.13.170(%rip), %rdx
	callq	halide_string_to_string@PLT
	testb	%r12b, %r12b
	jne	.LBB189_18
# %bb.17:                               # %if.then24
                                        #   in Loop: Header=BB189_5 Depth=1
	vmovsd	-96(%rbp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vmovapd	.LCPI189_1(%rip), %xmm2         # xmm2 = [1127219200,1160773632,0,0]
	vunpcklps	%xmm2, %xmm0, %xmm0     # xmm0 = xmm0[0],xmm2[0],xmm0[1],xmm2[1]
	vmovapd	.LCPI189_2(%rip), %xmm3         # xmm3 = [4.503599627370496E+15,1.9342813113834067E+25]
	vsubpd	%xmm3, %xmm0, %xmm0
	vpermilpd	$1, %xmm0, %xmm1        # xmm1 = xmm0[1,0]
	vaddsd	%xmm0, %xmm1, %xmm0
	vmovsd	-64(%rbp), %xmm1                # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vunpcklps	%xmm2, %xmm1, %xmm1     # xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
	vsubpd	%xmm3, %xmm1, %xmm1
	vpermilpd	$1, %xmm1, %xmm2        # xmm2 = xmm1[1,0]
	vaddsd	%xmm1, %xmm2, %xmm1
	vaddsd	.LCPI189_3(%rip), %xmm1, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, -56(%rbp)                # 4-byte Spill
	movq	%rax, %rdi
	movq	%r14, %rsi
	leaq	.L.str.14.171(%rip), %rdx
	callq	halide_string_to_string@PLT
	vmovss	-56(%rbp), %xmm0                # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movq	%rax, %rdi
	movq	%r14, %rsi
	xorl	%edx, %edx
	callq	halide_double_to_string@PLT
	movq	%rax, %rdi
	movq	%r14, %rsi
	leaq	.L.str.7.164(%rip), %rdx
	callq	halide_string_to_string@PLT
.LBB189_18:                             # %if.end28
                                        #   in Loop: Header=BB189_5 Depth=1
	movq	-80(%rbp), %rbx                 # 8-byte Reload
	movq	%rax, %rdi
	movq	%r14, %rsi
	leaq	.L.str.15.172(%rip), %rdx
	callq	halide_string_to_string@PLT
	movq	-72(%rbp), %r12                 # 8-byte Reload
	movslq	88(%r12), %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	movq	%rax, %rdi
	movq	%r14, %rsi
	leaq	.L.str.16.173(%rip), %rdx
	callq	halide_string_to_string@PLT
	movq	16(%r12), %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	movl	$1, %ecx
	callq	halide_uint64_to_string@PLT
	movq	%rax, %rdi
	movq	%r14, %rsi
	leaq	.L.str.17.174(%rip), %rdx
	callq	halide_string_to_string@PLT
	movq	%rax, %r12
	leaq	.L.str.29.163(%rip), %rsi
	testq	%r15, %r15
	je	.LBB189_20
# %bb.19:                               # %if.then.i347
                                        #   in Loop: Header=BB189_5 Depth=1
	movq	-104(%rbp), %rax                # 8-byte Reload
	leaq	(%rax,%r12), %rdx
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r15, %rsi
.LBB189_20:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EE3strEv.exit
                                        #   in Loop: Header=BB189_5 Depth=1
	movq	%rbx, %rdi
	callq	halide_print@PLT
	movq	-72(%rbp), %rsi                 # 8-byte Reload
	cmpq	$0, (%rsi)
	jne	.LBB189_26
# %bb.21:                               # %lor.end
                                        #   in Loop: Header=BB189_5 Depth=1
	cmpq	$0, 24(%rsi)
	je	.LBB189_22
.LBB189_26:                             # %for.cond53.preheader
                                        #   in Loop: Header=BB189_5 Depth=1
	cmpl	$0, 72(%rsi)
	jle	.LBB189_77
# %bb.27:                               # %for.body57.lr.ph
                                        #   in Loop: Header=BB189_5 Depth=1
	xorl	%ecx, %ecx
	jmp	.LBB189_28
	.p2align	4, 0x90
.LBB189_75:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EE3strEv.exit475
                                        #   in Loop: Header=BB189_28 Depth=2
	movq	%rbx, %rdi
	callq	halide_print@PLT
	movq	-72(%rbp), %rsi                 # 8-byte Reload
	movq	-96(%rbp), %rcx                 # 8-byte Reload
.LBB189_76:                             # %cleanup172
                                        #   in Loop: Header=BB189_28 Depth=2
	incq	%rcx
	movslq	72(%rsi), %rax
	cmpq	%rax, %rcx
	jge	.LBB189_77
.LBB189_28:                             # %for.body57
                                        #   Parent Loop BB189_5 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB189_35 Depth 3
                                        #       Child Loop BB189_43 Depth 3
                                        #       Child Loop BB189_50 Depth 3
                                        #       Child Loop BB189_56 Depth 3
                                        #       Child Loop BB189_61 Depth 3
                                        #       Child Loop BB189_63 Depth 3
	testq	%r15, %r15
	je	.LBB189_30
# %bb.29:                               # %if.then.i351
                                        #   in Loop: Header=BB189_28 Depth=2
	movb	$0, (%r15)
.LBB189_30:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EE5clearEv.exit353
                                        #   in Loop: Header=BB189_28 Depth=2
	movq	56(%rsi), %rbx
	leaq	(%rcx,%rcx,8), %rax
	leaq	(%rbx,%rax,8), %rdx
	testq	%rcx, %rcx
	jne	.LBB189_32
# %bb.31:                               # %land.lhs.true
                                        #   in Loop: Header=BB189_28 Depth=2
	cmpq	$0, (%rdx)
	movq	%r15, %r12
	je	.LBB189_76
.LBB189_32:                             # %if.end66
                                        #   in Loop: Header=BB189_28 Depth=2
	movq	%rdx, -88(%rbp)                 # 8-byte Spill
	movq	%rcx, -96(%rbp)                 # 8-byte Spill
	movq	%r15, %rdi
	movq	%r14, %rsi
	leaq	.L.str.18.175(%rip), %rdx
	movq	%rax, %r12
	callq	halide_string_to_string@PLT
	movq	%rbx, -56(%rbp)                 # 8-byte Spill
	movq	%r12, -64(%rbp)                 # 8-byte Spill
	movq	56(%rbx,%r12,8), %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%r14, %rsi
	leaq	.L.str.19.176(%rip), %rdx
	callq	halide_string_to_string@PLT
	movq	%rax, %rcx
	subq	%r15, %rcx
	cmpq	$24, %rcx
	ja	.LBB189_33
# %bb.34:                               # %while.body.preheader
                                        #   in Loop: Header=BB189_28 Depth=2
	movq	-88(%rbp), %rbx                 # 8-byte Reload
	.p2align	4, 0x90
.LBB189_35:                             # %while.body
                                        #   Parent Loop BB189_5 Depth=1
                                        #     Parent Loop BB189_28 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	%rax, %rdi
	movq	%r14, %rsi
	movq	%r13, %rdx
	callq	halide_string_to_string@PLT
	movq	%rax, %rcx
	subq	%r15, %rcx
	cmpq	$25, %rcx
	jb	.LBB189_35
# %bb.36:                               # %while.end
                                        #   in Loop: Header=BB189_28 Depth=2
	movq	(%rbx), %rcx
	testq	%rcx, %rcx
	js	.LBB189_37
.LBB189_38:                             # %while.end
                                        #   in Loop: Header=BB189_28 Depth=2
	vcvtsi2ss	%rcx, %xmm4, %xmm0
	jmp	.LBB189_39
	.p2align	4, 0x90
.LBB189_33:                             #   in Loop: Header=BB189_28 Depth=2
	movq	-88(%rbp), %rbx                 # 8-byte Reload
	movq	(%rbx), %rcx
	testq	%rcx, %rcx
	jns	.LBB189_38
.LBB189_37:                             #   in Loop: Header=BB189_28 Depth=2
	movq	%rcx, %rdx
	shrq	%rdx
	andl	$1, %ecx
	orq	%rdx, %rcx
	vcvtsi2ss	%rcx, %xmm4, %xmm0
	vaddss	%xmm0, %xmm0, %xmm0
.LBB189_39:                             # %while.end
                                        #   in Loop: Header=BB189_28 Depth=2
	movq	-72(%rbp), %rcx                 # 8-byte Reload
	vcvtsi2ssl	80(%rcx), %xmm4, %xmm1
	vmulss	.LCPI189_0(%rip), %xmm1, %xmm1
	vdivss	%xmm1, %xmm0, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movq	%rax, %rdi
	movq	%r14, %rsi
	xorl	%edx, %edx
	callq	halide_double_to_string@PLT
	testq	%rax, %rax
	je	.LBB189_40
# %bb.41:                               # %if.then.i374
                                        #   in Loop: Header=BB189_28 Depth=2
	addq	$-3, %rax
	cmpq	%r15, %rax
	cmovbq	%r15, %rax
	movb	$0, (%rax)
	jmp	.LBB189_42
	.p2align	4, 0x90
.LBB189_40:                             #   in Loop: Header=BB189_28 Depth=2
	xorl	%eax, %eax
.LBB189_42:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EE5eraseEi.exit
                                        #   in Loop: Header=BB189_28 Depth=2
	movq	%rax, %rdi
	movq	%r14, %rsi
	leaq	.L.str.21.178(%rip), %rdx
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	subq	%r15, %rax
	cmpq	$34, %rax
	ja	.LBB189_44
	.p2align	4, 0x90
.LBB189_43:                             # %while.body86
                                        #   Parent Loop BB189_5 Depth=1
                                        #     Parent Loop BB189_28 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	%r14, %rsi
	movq	%r13, %rdx
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	subq	%r15, %rax
	cmpq	$35, %rax
	jb	.LBB189_43
.LBB189_44:                             # %while.end88
                                        #   in Loop: Header=BB189_28 Depth=2
	movq	-72(%rbp), %rax                 # 8-byte Reload
	movq	(%rax), %rcx
	testq	%rcx, %rcx
	je	.LBB189_45
# %bb.46:                               # %if.then91
                                        #   in Loop: Header=BB189_28 Depth=2
	imulq	$100, (%rbx), %rax
	movq	%rax, %rdx
	orq	%rcx, %rdx
	shrq	$32, %rdx
	je	.LBB189_47
# %bb.48:                               #   in Loop: Header=BB189_28 Depth=2
	xorl	%edx, %edx
	divq	%rcx
	movq	%rax, %r12
	jmp	.LBB189_49
	.p2align	4, 0x90
.LBB189_45:                             #   in Loop: Header=BB189_28 Depth=2
	xorl	%r12d, %r12d
	jmp	.LBB189_49
	.p2align	4, 0x90
.LBB189_47:                             #   in Loop: Header=BB189_28 Depth=2
                                        # kill: def $eax killed $eax killed $rax
	xorl	%edx, %edx
	divl	%ecx
	movl	%eax, %r12d
.LBB189_49:                             # %if.end97
                                        #   in Loop: Header=BB189_28 Depth=2
	movq	%r14, %rsi
	leaq	.L.str.22.179(%rip), %rdx
	callq	halide_string_to_string@PLT
	movslq	%r12d, %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	movq	%rax, %rdi
	movq	%r14, %rsi
	leaq	.L.str.23.180(%rip), %rdx
	callq	halide_string_to_string@PLT
	movq	%rax, %rcx
	subq	%r15, %rcx
	leaq	.L.str.7.164(%rip), %r12
	cmpq	$42, %rcx
	ja	.LBB189_51
	.p2align	4, 0x90
.LBB189_50:                             # %while.body105
                                        #   Parent Loop BB189_5 Depth=1
                                        #     Parent Loop BB189_28 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	%rax, %rdi
	movq	%r14, %rsi
	movq	%r13, %rdx
	callq	halide_string_to_string@PLT
	movq	%rax, %rcx
	subq	%r15, %rcx
	cmpq	$43, %rcx
	jb	.LBB189_50
.LBB189_51:                             # %while.end107
                                        #   in Loop: Header=BB189_28 Depth=2
	movl	$58, %ebx
	cmpb	$0, -41(%rbp)                   # 1-byte Folded Reload
	jne	.LBB189_57
# %bb.52:                               # %if.then109
                                        #   in Loop: Header=BB189_28 Depth=2
	movq	-56(%rbp), %rcx                 # 8-byte Reload
	movq	-64(%rbp), %rdx                 # 8-byte Reload
	vmovsd	40(%rcx,%rdx,8), %xmm0          # xmm0 = mem[0],zero
	vmovapd	.LCPI189_1(%rip), %xmm2         # xmm2 = [1127219200,1160773632,0,0]
	vunpcklps	%xmm2, %xmm0, %xmm0     # xmm0 = xmm0[0],xmm2[0],xmm0[1],xmm2[1]
	vmovapd	.LCPI189_2(%rip), %xmm3         # xmm3 = [4.503599627370496E+15,1.9342813113834067E+25]
	vsubpd	%xmm3, %xmm0, %xmm0
	vpermilpd	$1, %xmm0, %xmm1        # xmm1 = xmm0[1,0]
	vaddsd	%xmm0, %xmm1, %xmm0
	vmovsd	48(%rcx,%rdx,8), %xmm1          # xmm1 = mem[0],zero
	vunpcklps	%xmm2, %xmm1, %xmm1     # xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
	vsubpd	%xmm3, %xmm1, %xmm1
	vpermilpd	$1, %xmm1, %xmm2        # xmm2 = xmm1[1,0]
	vaddsd	%xmm1, %xmm2, %xmm1
	vaddsd	.LCPI189_3(%rip), %xmm1, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, -88(%rbp)                # 4-byte Spill
	movq	%rax, %rdi
	movq	%r14, %rsi
	leaq	.L.str.24.181(%rip), %rdx
	callq	halide_string_to_string@PLT
	vmovss	-88(%rbp), %xmm0                # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movq	%rax, %rdi
	movq	%r14, %rsi
	xorl	%edx, %edx
	callq	halide_double_to_string@PLT
	testq	%rax, %rax
	je	.LBB189_53
# %bb.54:                               # %if.then.i413
                                        #   in Loop: Header=BB189_28 Depth=2
	addq	$-3, %rax
	cmpq	%r15, %rax
	cmovbq	%r15, %rax
	movb	$0, (%rax)
	jmp	.LBB189_55
.LBB189_53:                             #   in Loop: Header=BB189_28 Depth=2
	xorl	%eax, %eax
.LBB189_55:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EE5eraseEi.exit414
                                        #   in Loop: Header=BB189_28 Depth=2
	movq	-56(%rbp), %rdx                 # 8-byte Reload
	movq	-64(%rbp), %rsi                 # 8-byte Reload
	movq	%rax, %rcx
	subq	%r15, %rcx
	movl	$73, %ebx
	cmpq	$57, %rcx
	ja	.LBB189_58
	.p2align	4, 0x90
.LBB189_56:                             # %while.body124
                                        #   Parent Loop BB189_5 Depth=1
                                        #     Parent Loop BB189_28 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	%rax, %rdi
	movq	%r14, %rsi
	movq	%r13, %rdx
	callq	halide_string_to_string@PLT
	movq	%rax, %rcx
	subq	%r15, %rcx
	cmpq	$58, %rcx
	jb	.LBB189_56
.LBB189_57:                             #   in Loop: Header=BB189_28 Depth=2
	movq	-56(%rbp), %rdx                 # 8-byte Reload
	movq	-64(%rbp), %rsi                 # 8-byte Reload
.LBB189_58:                             # %if.end127
                                        #   in Loop: Header=BB189_28 Depth=2
	cmpq	$0, 16(%rdx,%rsi,8)
	je	.LBB189_71
# %bb.59:                               # %if.then130
                                        #   in Loop: Header=BB189_28 Depth=2
	leaq	(%rdx,%rsi,8), %r12
	addq	$16, %r12
	movq	%rax, %rdi
	movq	%r14, %rsi
	leaq	.L.str.25.182(%rip), %rdx
	callq	halide_string_to_string@PLT
	movq	(%r12), %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	movl	$1, %ecx
	callq	halide_uint64_to_string@PLT
	.p2align	4, 0x90
.LBB189_61:                             # %while.body138
                                        #   Parent Loop BB189_5 Depth=1
                                        #     Parent Loop BB189_28 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	%rax, %rcx
	subq	%r15, %rcx
	movq	%rax, %rdi
	movq	%r14, %rsi
	cmpq	%rbx, %rcx
	jae	.LBB189_62
# %bb.60:                               # %while.body138
                                        #   in Loop: Header=BB189_61 Depth=3
	movq	%r13, %rdx
	callq	halide_string_to_string@PLT
	jmp	.LBB189_61
	.p2align	4, 0x90
.LBB189_62:                             # %while.end140
                                        #   in Loop: Header=BB189_28 Depth=2
	leaq	.L.str.26.183(%rip), %rdx
	callq	halide_string_to_string@PLT
	movq	-56(%rbp), %rcx                 # 8-byte Reload
	movq	-64(%rbp), %rdx                 # 8-byte Reload
	movslq	64(%rcx,%rdx,8), %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	movq	%rax, %rdi
	addq	$15, %rbx
	subq	%r15, %rax
	cmpq	%rbx, %rax
	jae	.LBB189_65
	.p2align	4, 0x90
.LBB189_63:                             # %while.body148
                                        #   Parent Loop BB189_5 Depth=1
                                        #     Parent Loop BB189_28 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	%r14, %rsi
	movq	%r13, %rdx
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	subq	%r15, %rax
	cmpq	%rbx, %rax
	jb	.LBB189_63
.LBB189_65:                             # %while.end150
                                        #   in Loop: Header=BB189_28 Depth=2
	movq	-56(%rbp), %rdx                 # 8-byte Reload
	movq	-64(%rbp), %rsi                 # 8-byte Reload
	leaq	(%rdx,%rsi,8), %rax
	addq	$64, %rax
	movslq	(%rax), %rcx
	testq	%rcx, %rcx
	je	.LBB189_66
# %bb.67:                               # %if.then153
                                        #   in Loop: Header=BB189_28 Depth=2
	movq	24(%rdx,%rsi,8), %rax
	movq	%rax, %rdx
	orq	%rcx, %rdx
	shrq	$32, %rdx
	je	.LBB189_68
# %bb.69:                               #   in Loop: Header=BB189_28 Depth=2
	xorl	%edx, %edx
	divq	%rcx
	movq	%rax, %r12
	jmp	.LBB189_70
	.p2align	4, 0x90
.LBB189_66:                             #   in Loop: Header=BB189_28 Depth=2
	xorl	%r12d, %r12d
	jmp	.LBB189_70
.LBB189_68:                             #   in Loop: Header=BB189_28 Depth=2
                                        # kill: def $eax killed $eax killed $rax
	xorl	%edx, %edx
	divl	%ecx
	movl	%eax, %r12d
.LBB189_70:                             # %if.end159
                                        #   in Loop: Header=BB189_28 Depth=2
	movq	%r14, %rsi
	leaq	.L.str.27.184(%rip), %rdx
	callq	halide_string_to_string@PLT
	movslq	%r12d, %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.7.164(%rip), %r12
	movq	-56(%rbp), %rdx                 # 8-byte Reload
	movq	-64(%rbp), %rsi                 # 8-byte Reload
.LBB189_71:                             # %if.end162
                                        #   in Loop: Header=BB189_28 Depth=2
	cmpq	$0, 32(%rdx,%rsi,8)
	je	.LBB189_73
# %bb.72:                               # %if.then165
                                        #   in Loop: Header=BB189_28 Depth=2
	leaq	(%rdx,%rsi,8), %rbx
	addq	$32, %rbx
	movq	%rax, %rdi
	movq	%r14, %rsi
	leaq	.L.str.28.185(%rip), %rdx
	callq	halide_string_to_string@PLT
	movq	(%rbx), %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	movl	$1, %ecx
	callq	halide_uint64_to_string@PLT
.LBB189_73:                             # %if.end169
                                        #   in Loop: Header=BB189_28 Depth=2
	movq	-80(%rbp), %rbx                 # 8-byte Reload
	movq	%rax, %rdi
	movq	%r14, %rsi
	movq	%r12, %rdx
	callq	halide_string_to_string@PLT
	movq	%rax, %r12
	leaq	.L.str.29.163(%rip), %rsi
	testq	%r15, %r15
	je	.LBB189_75
# %bb.74:                               # %if.then.i473
                                        #   in Loop: Header=BB189_28 Depth=2
	movq	-104(%rbp), %rax                # 8-byte Reload
	leaq	(%rax,%r12), %rdx
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r15, %rsi
	jmp	.LBB189_75
.LBB189_22:                             # %for.cond41.preheader
                                        #   in Loop: Header=BB189_5 Depth=1
	movl	72(%rsi), %ecx
	testl	%ecx, %ecx
	jle	.LBB189_77
# %bb.23:                               # %for.body44.lr.ph
                                        #   in Loop: Header=BB189_5 Depth=1
	movq	56(%rsi), %rax
	shlq	$3, %rcx
	leaq	(%rcx,%rcx,8), %rcx
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB189_25:                             # %for.body44
                                        #   Parent Loop BB189_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpq	$0, 32(%rax,%rdx)
	jne	.LBB189_26
# %bb.24:                               # %for.cond41
                                        #   in Loop: Header=BB189_25 Depth=2
	addq	$72, %rdx
	cmpq	%rdx, %rcx
	jne	.LBB189_25
	jmp	.LBB189_77
.LBB189_7:                              # %for.cond.cleanup
	testq	%r15, %r15
	je	.LBB189_8
# %bb.9:                                # %if.else.i
	subq	%r15, %r12
	incq	%r12
	movq	%rbx, %rdi
	movq	%r15, %rsi
	movq	%r12, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	jmp	.LBB189_10
.LBB189_8:                              # %if.then.i
	leaq	.L.str.29.163(%rip), %rsi
	movq	%rbx, %rdi
	callq	halide_error@PLT
.LBB189_10:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EED2Ev.exit
	movq	%r15, %rdi
	addq	$72, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	free@PLT                        # TAILCALL
.Lfunc_end189:
	.size	halide_profiler_report_unlocked, .Lfunc_end189-halide_profiler_report_unlocked
                                        # -- End function
	.section	.text.halide_profiler_reset_unlocked,"ax",@progbits
	.weak	halide_profiler_reset_unlocked  # -- Begin function halide_profiler_reset_unlocked
	.p2align	4, 0x90
	.type	halide_profiler_reset_unlocked,@function
halide_profiler_reset_unlocked:         # @halide_profiler_reset_unlocked
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	movq	%rdi, %r14
	movq	24(%rdi), %rbx
	testq	%rbx, %rbx
	je	.LBB190_3
	.p2align	4, 0x90
.LBB190_1:                              # %while.body
                                        # =>This Inner Loop Header: Depth=1
	movq	64(%rbx), %rax
	movq	%rax, 24(%r14)
	movq	56(%rbx), %rdi
	callq	free@PLT
	movq	%rbx, %rdi
	callq	free@PLT
	movq	24(%r14), %rbx
	testq	%rbx, %rbx
	jne	.LBB190_1
.LBB190_3:                              # %while.end
	movl	$0, 12(%r14)
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end190:
	.size	halide_profiler_reset_unlocked, .Lfunc_end190-halide_profiler_reset_unlocked
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy # -- Begin function _ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy,@function
_ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy: # @_ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movq	%rdx, %r15
	movl	%esi, %r14d
	movq	%rdi, %r13
	callq	halide_profiler_get_state@PLT
	movq	%rax, %r12
	movq	24(%rax), %rbx
	jmp	.LBB191_1
	.p2align	4, 0x90
.LBB191_4:                              # %for.inc
                                        #   in Loop: Header=BB191_1 Depth=1
	movq	64(%rbx), %rbx
.LBB191_1:                              # %entry
                                        # =>This Inner Loop Header: Depth=1
	testq	%rbx, %rbx
	je	.LBB191_5
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB191_1 Depth=1
	cmpq	%r13, 48(%rbx)
	jne	.LBB191_4
# %bb.3:                                # %land.lhs.true
                                        #   in Loop: Header=BB191_1 Depth=1
	cmpl	%r14d, 72(%rbx)
	jne	.LBB191_4
	jmp	.LBB191_13
.LBB191_5:                              # %for.end
	movl	$96, %edi
	callq	malloc@PLT
	testq	%rax, %rax
	je	.LBB191_12
# %bb.6:                                # %if.end7
	movq	%rax, %rbx
	movq	24(%r12), %rax
	movq	%rax, 64(%rbx)
	movq	%r13, 48(%rbx)
	movl	12(%r12), %eax
	movl	%eax, 76(%rbx)
	movl	%r14d, 72(%rbx)
	movl	$0, 80(%rbx)
	movq	$0, (%rbx)
	movq	$0, 84(%rbx)
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%xmm0, 8(%rbx)
	movq	$0, 24(%rbx)
	vmovups	%xmm0, 32(%rbx)
	movslq	%r14d, %rax
	shlq	$3, %rax
	leaq	(%rax,%rax,8), %rdi
	callq	malloc@PLT
	movq	%rax, 56(%rbx)
	testq	%rax, %rax
	je	.LBB191_11
# %bb.7:                                # %for.cond17.preheader
	testl	%r14d, %r14d
	jle	.LBB191_10
# %bb.8:                                # %for.body20.lr.ph
	movl	%r14d, %ecx
	addq	$64, %rax
	xorl	%edx, %edx
	vxorps	%xmm0, %xmm0, %xmm0
	.p2align	4, 0x90
.LBB191_9:                              # %for.body20
                                        # =>This Inner Loop Header: Depth=1
	movq	$0, -64(%rax)
	movq	(%r15,%rdx,8), %rsi
	movq	%rsi, -8(%rax)
	vmovups	%xmm0, -56(%rax)
	movq	$0, -40(%rax)
	movl	$0, (%rax)
	vmovups	%xmm0, -32(%rax)
	movq	$0, -16(%rax)
	incq	%rdx
	addq	$72, %rax
	cmpq	%rdx, %rcx
	jne	.LBB191_9
.LBB191_10:                             # %for.cond.cleanup19
	addl	%r14d, 12(%r12)
	movq	%rbx, 24(%r12)
	jmp	.LBB191_13
.LBB191_11:                             # %if.then15
	movq	%rbx, %rdi
	callq	free@PLT
.LBB191_12:                             # %cleanup62
	xorl	%ebx, %ebx
.LBB191_13:                             # %cleanup62
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end191:
	.size	_ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy, .Lfunc_end191-_ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy
                                        # -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4                               # -- Begin function _ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi
.LCPI192_0:
	.zero	8
	.quad	1                               # 0x1
	.section	.text._ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi,@function
_ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi: # @_ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	24(%rdi), %r8
	testq	%r8, %r8
	je	.LBB192_8
# %bb.1:                                # %for.body.preheader
	xorl	%r10d, %r10d
	movq	%r8, %rax
	jmp	.LBB192_3
	.p2align	4, 0x90
.LBB192_2:                              # %if.end23
                                        #   in Loop: Header=BB192_3 Depth=1
	movq	64(%r11), %rax
	movq	%r11, %r10
	testq	%rax, %rax
	je	.LBB192_8
.LBB192_3:                              # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movq	%rax, %r11
	movslq	76(%rax), %r9
	cmpl	%esi, %r9d
	jg	.LBB192_2
# %bb.4:                                # %land.lhs.true
                                        #   in Loop: Header=BB192_3 Depth=1
	movl	72(%r11), %eax
	addl	%r9d, %eax
	cmpl	%esi, %eax
	jle	.LBB192_2
# %bb.5:                                # %if.then
	testq	%r10, %r10
	je	.LBB192_7
# %bb.6:                                # %if.then4
	movq	64(%r11), %rax
	movq	%rax, 64(%r10)
	movq	%r8, 64(%r11)
	movq	%r11, 24(%rdi)
.LBB192_7:                              # %if.end
	movslq	%esi, %rax
	leaq	(%rax,%rax,8), %rax
	shlq	$3, %rax
	addq	56(%r11), %rax
	negq	%r9
	leaq	(%r9,%r9,8), %rsi
	addq	%rdx, (%rax,%rsi,8)
	movslq	%ecx, %rcx
	vmovdqa	.LCPI192_0(%rip), %xmm0         # xmm0 = <u,1>
	vpinsrq	$0, %rcx, %xmm0, %xmm0
	vpaddq	40(%rax,%rsi,8), %xmm0, %xmm1
	vmovdqu	%xmm1, 40(%rax,%rsi,8)
	addq	%rdx, (%r11)
	incl	84(%r11)
	vpaddq	32(%r11), %xmm0, %xmm0
	vmovdqu	%xmm0, 32(%r11)
.LBB192_8:                              # %cleanup
	popq	%rbp
	retq
.Lfunc_end192:
	.size	_ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi, .Lfunc_end192-_ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi
                                        # -- End function
	.section	.text.halide_profiler_sample,"ax",@progbits
	.weak	halide_profiler_sample          # -- Begin function halide_profiler_sample
	.p2align	4, 0x90
	.type	halide_profiler_sample,@function
halide_profiler_sample:                 # @halide_profiler_sample
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	movq	%rsi, %r14
	movq	%rdi, %rbx
	movq	32(%rdi), %rax
	testq	%rax, %rax
	je	.LBB193_2
# %bb.1:                                # %if.then
	leaq	-32(%rbp), %rdi
	leaq	-28(%rbp), %rsi
	callq	*%rax
	jmp	.LBB193_3
.LBB193_2:                              # %if.else
	movl	16(%rbx), %eax
	movl	%eax, -32(%rbp)
	movl	20(%rbx), %eax
	movl	%eax, -28(%rbp)
.LBB193_3:                              # %if.end
	xorl	%edi, %edi
	callq	halide_current_time_ns@PLT
	movq	%rax, %r15
	movl	-32(%rbp), %esi
	movl	$-1, %eax
	cmpl	$-2, %esi
	je	.LBB193_7
# %bb.4:                                # %if.else4
	testl	%esi, %esi
	js	.LBB193_6
# %bb.5:                                # %if.then6
	movq	%r15, %rdx
	subq	(%r14), %rdx
	movl	-28(%rbp), %ecx
	movq	%rbx, %rdi
	callq	_ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi@PLT
.LBB193_6:                              # %if.end8
	movq	%r15, (%r14)
	movl	8(%rbx), %eax
.LBB193_7:                              # %cleanup
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end193:
	.size	halide_profiler_sample, .Lfunc_end193-halide_profiler_sample
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv # -- Begin function _ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv,@function
_ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv: # @_ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	callq	halide_profiler_get_state@PLT
	movq	%rax, %r15
	movq	%rax, %rdi
	callq	halide_mutex_lock@PLT
	cmpl	$-2, 16(%r15)
	jne	.LBB194_1
.LBB194_6:                              # %while.end8
	movq	%r15, %rdi
	callq	halide_mutex_unlock@PLT
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB194_1:                              # %while.body.lr.ph
	leaq	-32(%rbp), %r14
	jmp	.LBB194_2
	.p2align	4, 0x90
.LBB194_5:                              # %while.end
                                        #   in Loop: Header=BB194_2 Depth=1
	cmpl	$-2, 16(%r15)
	je	.LBB194_6
.LBB194_2:                              # %while.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB194_4 Depth 2
	xorl	%edi, %edi
	callq	halide_current_time_ns@PLT
	movq	%rax, -32(%rbp)
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	halide_profiler_sample@PLT
	testl	%eax, %eax
	js	.LBB194_5
# %bb.3:                                # %cleanup.preheader
                                        #   in Loop: Header=BB194_2 Depth=1
	movl	%eax, %ebx
	.p2align	4, 0x90
.LBB194_4:                              # %cleanup
                                        #   Parent Loop BB194_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%r15, %rdi
	callq	halide_mutex_unlock@PLT
	xorl	%edi, %edi
	movl	%ebx, %esi
	callq	halide_sleep_ms@PLT
	movq	%r15, %rdi
	callq	halide_mutex_lock@PLT
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	halide_profiler_sample@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jns	.LBB194_4
	jmp	.LBB194_5
.Lfunc_end194:
	.size	_ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv, .Lfunc_end194-_ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv
                                        # -- End function
	.section	.text.halide_profiler_get_pipeline_state,"ax",@progbits
	.weak	halide_profiler_get_pipeline_state # -- Begin function halide_profiler_get_pipeline_state
	.p2align	4, 0x90
	.type	halide_profiler_get_pipeline_state,@function
halide_profiler_get_pipeline_state:     # @halide_profiler_get_pipeline_state
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	movq	%rdi, %r15
	callq	halide_profiler_get_state@PLT
	movq	%rax, %r14
	movq	%rax, %rdi
	callq	halide_mutex_lock@PLT
	movq	24(%r14), %rbx
	testq	%rbx, %rbx
	je	.LBB195_4
	.p2align	4, 0x90
.LBB195_2:                              # %for.body
                                        # =>This Inner Loop Header: Depth=1
	cmpq	%r15, 48(%rbx)
	je	.LBB195_5
# %bb.3:                                # %for.inc
                                        #   in Loop: Header=BB195_2 Depth=1
	movq	64(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.LBB195_2
.LBB195_4:
	xorl	%ebx, %ebx
.LBB195_5:                              # %cleanup
	movq	%r14, %rdi
	callq	halide_mutex_unlock@PLT
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end195:
	.size	halide_profiler_get_pipeline_state, .Lfunc_end195-halide_profiler_get_pipeline_state
                                        # -- End function
	.section	.text.halide_profiler_pipeline_start,"ax",@progbits
	.weak	halide_profiler_pipeline_start  # -- Begin function halide_profiler_pipeline_start
	.p2align	4, 0x90
	.type	halide_profiler_pipeline_start,@function
halide_profiler_pipeline_start:         # @halide_profiler_pipeline_start
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movq	%rcx, %r15
	movl	%edx, %r12d
	movq	%rsi, %r13
	movq	%rdi, %r14
	callq	halide_profiler_get_state@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	callq	halide_mutex_lock@PLT
	cmpq	$0, 40(%rbx)
	jne	.LBB196_2
# %bb.1:                                # %if.then
	movq	%r14, %rdi
	callq	halide_start_clock@PLT
	movq	_ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv@GOTPCREL(%rip), %rdi
	xorl	%esi, %esi
	callq	halide_spawn_thread@PLT
	movq	%rax, 40(%rbx)
.LBB196_2:                              # %if.end
	movq	%r13, %rdi
	movl	%r12d, %esi
	movq	%r15, %rdx
	callq	_ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy@PLT
	testq	%rax, %rax
	je	.LBB196_3
# %bb.4:                                # %if.end8
	incl	80(%rax)
	movl	76(%rax), %r14d
	jmp	.LBB196_5
.LBB196_3:                              # %if.then6
	movq	%r14, %rdi
	callq	halide_error_out_of_memory@PLT
	movl	%eax, %r14d
.LBB196_5:                              # %cleanup
	movq	%rbx, %rdi
	callq	halide_mutex_unlock@PLT
	movl	%r14d, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end196:
	.size	halide_profiler_pipeline_start, .Lfunc_end196-halide_profiler_pipeline_start
                                        # -- End function
	.section	.text.halide_profiler_stack_peak_update,"ax",@progbits
	.weak	halide_profiler_stack_peak_update # -- Begin function halide_profiler_stack_peak_update
	.p2align	4, 0x90
	.type	halide_profiler_stack_peak_update,@function
halide_profiler_stack_peak_update:      # @halide_profiler_stack_peak_update
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	movq	%rdx, %r14
	movq	%rsi, %rbx
	testq	%rsi, %rsi
	je	.LBB197_1
# %bb.2:                                # %do.end
	movl	72(%rbx), %eax
	testl	%eax, %eax
	jg	.LBB197_3
	jmp	.LBB197_10
.LBB197_1:                              # %if.then
	leaq	.L.str.186(%rip), %rsi
	callq	halide_print@PLT
	callq	abort@PLT
	movl	72(%rbx), %eax
	testl	%eax, %eax
	jle	.LBB197_10
.LBB197_3:                              # %for.body.lr.ph
	xorl	%edx, %edx
	jmp	.LBB197_4
	.p2align	4, 0x90
.LBB197_8:                              # %for.inc.loopexit
                                        #   in Loop: Header=BB197_4 Depth=1
	movl	72(%rbx), %eax
.LBB197_9:                              # %for.inc
                                        #   in Loop: Header=BB197_4 Depth=1
	incq	%rdx
	movslq	%eax, %rcx
	cmpq	%rcx, %rdx
	jge	.LBB197_10
.LBB197_4:                              # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB197_6 Depth 2
	movq	(%r14,%rdx,8), %rsi
	testq	%rsi, %rsi
	je	.LBB197_9
# %bb.5:                                # %if.then3
                                        #   in Loop: Header=BB197_4 Depth=1
	movq	56(%rbx), %rax
	leaq	(%rdx,%rdx,8), %rcx
	leaq	(%rax,%rcx,8), %rdi
	addq	$32, %rdi
	movq	32(%rax,%rcx,8), %rcx
	.p2align	4, 0x90
.LBB197_6:                              # %while.cond.i
                                        #   Parent Loop BB197_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpq	%rsi, %rcx
	jae	.LBB197_8
# %bb.7:                                # %while.body.i
                                        #   in Loop: Header=BB197_6 Depth=2
	movq	%rcx, %rax
	lock		cmpxchgq	%rsi, (%rdi)
	cmpq	%rax, %rcx
	movq	%rax, %rcx
	jne	.LBB197_6
	jmp	.LBB197_8
.LBB197_10:                             # %for.cond.cleanup
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end197:
	.size	halide_profiler_stack_peak_update, .Lfunc_end197-halide_profiler_stack_peak_update
                                        # -- End function
	.section	.text.halide_profiler_memory_allocate,"ax",@progbits
	.weak	halide_profiler_memory_allocate # -- Begin function halide_profiler_memory_allocate
	.p2align	4, 0x90
	.type	halide_profiler_memory_allocate,@function
halide_profiler_memory_allocate:        # @halide_profiler_memory_allocate
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	testq	%rcx, %rcx
	je	.LBB198_13
# %bb.1:                                # %if.end
	movq	%rcx, %r14
	movl	%edx, %r15d
	movq	%rsi, %rbx
	movq	%rdi, %r12
	testq	%rsi, %rsi
	je	.LBB198_2
# %bb.3:                                # %do.body4
	testl	%r15d, %r15d
	js	.LBB198_4
.LBB198_5:                              # %do.body10
	cmpl	%r15d, 72(%rbx)
	jg	.LBB198_7
.LBB198_6:                              # %if.then12
	leaq	.L.str.3.189(%rip), %rsi
	movq	%r12, %rdi
	callq	halide_print@PLT
	callq	abort@PLT
.LBB198_7:                              # %do.end15
	movq	56(%rbx), %rdx
	lock		incl	88(%rbx)
	lock		addq	%r14, 24(%rbx)
	movq	%r14, %rsi
	lock		xaddq	%rsi, 8(%rbx)
	movslq	%r15d, %rdi
	addq	%r14, %rsi
	movq	16(%rbx), %rcx
	.p2align	4, 0x90
.LBB198_8:                              # %while.cond.i
                                        # =>This Inner Loop Header: Depth=1
	cmpq	%rsi, %rcx
	jae	.LBB198_10
# %bb.9:                                # %while.body.i
                                        #   in Loop: Header=BB198_8 Depth=1
	movq	%rcx, %rax
	lock		cmpxchgq	%rsi, 16(%rbx)
	cmpq	%rax, %rcx
	movq	%rax, %rcx
	jne	.LBB198_8
.LBB198_10:                             # %_ZN12_GLOBAL__N_125sync_compare_max_and_swapIyEEvPT_S1_.exit
	leaq	(%rdi,%rdi,8), %rax
	lock		incl	64(%rdx,%rax,8)
	lock		addq	%r14, 24(%rdx,%rax,8)
	movq	%r14, %rsi
	lock		xaddq	%rsi, 8(%rdx,%rax,8)
	addq	%r14, %rsi
	leaq	(%rdx,%rax,8), %rdi
	addq	$16, %rdi
	movq	16(%rdx,%rax,8), %rcx
	.p2align	4, 0x90
.LBB198_11:                             # %while.cond.i43
                                        # =>This Inner Loop Header: Depth=1
	cmpq	%rsi, %rcx
	jae	.LBB198_13
# %bb.12:                               # %while.body.i45
                                        #   in Loop: Header=BB198_11 Depth=1
	movq	%rcx, %rax
	lock		cmpxchgq	%rsi, (%rdi)
	cmpq	%rax, %rcx
	movq	%rax, %rcx
	jne	.LBB198_11
.LBB198_13:                             # %return
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB198_2:                              # %if.then2
	leaq	.L.str.1.187(%rip), %rsi
	movq	%r12, %rdi
	callq	halide_print@PLT
	callq	abort@PLT
	testl	%r15d, %r15d
	jns	.LBB198_5
.LBB198_4:                              # %if.then6
	leaq	.L.str.2.188(%rip), %rsi
	movq	%r12, %rdi
	callq	halide_print@PLT
	callq	abort@PLT
	cmpl	%r15d, 72(%rbx)
	jle	.LBB198_6
	jmp	.LBB198_7
.Lfunc_end198:
	.size	halide_profiler_memory_allocate, .Lfunc_end198-halide_profiler_memory_allocate
                                        # -- End function
	.section	.text.halide_profiler_memory_free,"ax",@progbits
	.weak	halide_profiler_memory_free     # -- Begin function halide_profiler_memory_free
	.p2align	4, 0x90
	.type	halide_profiler_memory_free,@function
halide_profiler_memory_free:            # @halide_profiler_memory_free
# %bb.0:                                # %entry
	testq	%rcx, %rcx
	je	.LBB199_8
# %bb.1:                                # %if.end
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	movq	%rcx, %r14
	movl	%edx, %r15d
	movq	%rsi, %rbx
	movq	%rdi, %r12
	testq	%rsi, %rsi
	je	.LBB199_2
# %bb.3:                                # %do.body4
	testl	%r15d, %r15d
	js	.LBB199_4
.LBB199_5:                              # %do.body10
	cmpl	%r15d, 72(%rbx)
	jg	.LBB199_7
.LBB199_6:                              # %if.then12
	leaq	.L.str.6.192(%rip), %rsi
	movq	%r12, %rdi
	callq	halide_print@PLT
	callq	abort@PLT
.LBB199_7:                              # %do.end15
	movq	56(%rbx), %rax
	movslq	%r15d, %rcx
	lock		subq	%r14, 8(%rbx)
	leaq	(%rcx,%rcx,8), %rcx
	lock		subq	%r14, 8(%rax,%rcx,8)
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
.LBB199_8:                              # %return
	retq
.LBB199_2:                              # %if.then2
	leaq	.L.str.4.190(%rip), %rsi
	movq	%r12, %rdi
	callq	halide_print@PLT
	callq	abort@PLT
	testl	%r15d, %r15d
	jns	.LBB199_5
.LBB199_4:                              # %if.then6
	leaq	.L.str.5.191(%rip), %rsi
	movq	%r12, %rdi
	callq	halide_print@PLT
	callq	abort@PLT
	cmpl	%r15d, 72(%rbx)
	jle	.LBB199_6
	jmp	.LBB199_7
.Lfunc_end199:
	.size	halide_profiler_memory_free, .Lfunc_end199-halide_profiler_memory_free
                                        # -- End function
	.section	.text.halide_profiler_report,"ax",@progbits
	.weak	halide_profiler_report          # -- Begin function halide_profiler_report
	.p2align	4, 0x90
	.type	halide_profiler_report,@function
halide_profiler_report:                 # @halide_profiler_report
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	movq	%rdi, %r14
	callq	halide_profiler_get_state@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	callq	halide_mutex_lock@PLT
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	halide_profiler_report_unlocked@PLT
	movq	%rbx, %rdi
	popq	%rbx
	popq	%r14
	popq	%rbp
	jmp	halide_mutex_unlock@PLT         # TAILCALL
.Lfunc_end200:
	.size	halide_profiler_report, .Lfunc_end200-halide_profiler_report
                                        # -- End function
	.section	.text.halide_profiler_reset,"ax",@progbits
	.weak	halide_profiler_reset           # -- Begin function halide_profiler_reset
	.p2align	4, 0x90
	.type	halide_profiler_reset,@function
halide_profiler_reset:                  # @halide_profiler_reset
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	pushq	%rax
	callq	halide_profiler_get_state@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	callq	halide_mutex_lock@PLT
	movq	%rbx, %rdi
	callq	halide_profiler_reset_unlocked@PLT
	movq	%rbx, %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	jmp	halide_mutex_unlock@PLT         # TAILCALL
.Lfunc_end201:
	.size	halide_profiler_reset, .Lfunc_end201-halide_profiler_reset
                                        # -- End function
	.section	.text.halide_profiler_pipeline_end,"ax",@progbits
	.weak	halide_profiler_pipeline_end    # -- Begin function halide_profiler_pipeline_end
	.p2align	4, 0x90
	.type	halide_profiler_pipeline_end,@function
halide_profiler_pipeline_end:           # @halide_profiler_pipeline_end
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$-1, 16(%rsi)
	popq	%rbp
	retq
.Lfunc_end202:
	.size	halide_profiler_pipeline_end, .Lfunc_end202-halide_profiler_pipeline_end
                                        # -- End function
	.section	.text.halide_msan_annotate_memory_is_initialized,"ax",@progbits
	.weak	halide_msan_annotate_memory_is_initialized # -- Begin function halide_msan_annotate_memory_is_initialized
	.p2align	4, 0x90
	.type	halide_msan_annotate_memory_is_initialized,@function
halide_msan_annotate_memory_is_initialized: # @halide_msan_annotate_memory_is_initialized
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	xorl	%eax, %eax
	popq	%rbp
	retq
.Lfunc_end203:
	.size	halide_msan_annotate_memory_is_initialized, .Lfunc_end203-halide_msan_annotate_memory_is_initialized
                                        # -- End function
	.section	.text.halide_msan_check_memory_is_initialized,"ax",@progbits
	.weak	halide_msan_check_memory_is_initialized # -- Begin function halide_msan_check_memory_is_initialized
	.p2align	4, 0x90
	.type	halide_msan_check_memory_is_initialized,@function
halide_msan_check_memory_is_initialized: # @halide_msan_check_memory_is_initialized
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	xorl	%eax, %eax
	popq	%rbp
	retq
.Lfunc_end204:
	.size	halide_msan_check_memory_is_initialized, .Lfunc_end204-halide_msan_check_memory_is_initialized
                                        # -- End function
	.section	.text.halide_msan_check_buffer_is_initialized,"ax",@progbits
	.weak	halide_msan_check_buffer_is_initialized # -- Begin function halide_msan_check_buffer_is_initialized
	.p2align	4, 0x90
	.type	halide_msan_check_buffer_is_initialized,@function
halide_msan_check_buffer_is_initialized: # @halide_msan_check_buffer_is_initialized
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	xorl	%eax, %eax
	popq	%rbp
	retq
.Lfunc_end205:
	.size	halide_msan_check_buffer_is_initialized, .Lfunc_end205-halide_msan_check_buffer_is_initialized
                                        # -- End function
	.section	.text.halide_msan_annotate_buffer_is_initialized,"ax",@progbits
	.weak	halide_msan_annotate_buffer_is_initialized # -- Begin function halide_msan_annotate_buffer_is_initialized
	.p2align	4, 0x90
	.type	halide_msan_annotate_buffer_is_initialized,@function
halide_msan_annotate_buffer_is_initialized: # @halide_msan_annotate_buffer_is_initialized
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	xorl	%eax, %eax
	popq	%rbp
	retq
.Lfunc_end206:
	.size	halide_msan_annotate_buffer_is_initialized, .Lfunc_end206-halide_msan_annotate_buffer_is_initialized
                                        # -- End function
	.section	.text.halide_msan_annotate_buffer_is_initialized_as_destructor,"ax",@progbits
	.weak	halide_msan_annotate_buffer_is_initialized_as_destructor # -- Begin function halide_msan_annotate_buffer_is_initialized_as_destructor
	.p2align	4, 0x90
	.type	halide_msan_annotate_buffer_is_initialized_as_destructor,@function
halide_msan_annotate_buffer_is_initialized_as_destructor: # @halide_msan_annotate_buffer_is_initialized_as_destructor
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	popq	%rbp
	retq
.Lfunc_end207:
	.size	halide_msan_annotate_buffer_is_initialized_as_destructor, .Lfunc_end207-halide_msan_annotate_buffer_is_initialized_as_destructor
                                        # -- End function
	.section	.text.halide_default_can_use_target_features,"ax",@progbits
	.weak	halide_default_can_use_target_features # -- Begin function halide_default_can_use_target_features
	.p2align	4, 0x90
	.type	halide_default_can_use_target_features,@function
halide_default_can_use_target_features: # @halide_default_can_use_target_features
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$32, %rsp
	movq	%rsi, %r14
	movl	%edi, %ebx
	movq	_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_lock@PLT
	movq	_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE@GOTPCREL(%rip), %r12
	cmpb	$0, (%r12)
	je	.LBB208_1
# %bb.2:                                # %if.end
	movq	_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_unlock@PLT
	cmpl	$2, %ebx
	jne	.LBB208_3
.LBB208_4:                              # %if.end2
	movq	_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rdx
	andq	(%r14), %rdx
	jne	.LBB208_5
	jmp	.LBB208_6
.LBB208_1:                              # %if.then
	leaq	-64(%rbp), %r15
	movq	%r15, %rdi
	callq	_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv@PLT
	movq	_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE@GOTPCREL(%rip), %rdi
	movl	$32, %edx
	movq	%r15, %rsi
	callq	memcpy@PLT
	movb	$1, (%r12)
	movq	_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_unlock@PLT
	cmpl	$2, %ebx
	je	.LBB208_4
.LBB208_3:                              # %if.then1
	leaq	.L.str.197(%rip), %rsi
	xorl	%edi, %edi
	callq	halide_error@PLT
	movq	_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rdx
	andq	(%r14), %rdx
	je	.LBB208_6
.LBB208_5:                              # %if.then7
	movq	16(%rcx), %rsi
	xorl	%eax, %eax
	andnq	%rdx, %rsi, %rdx
	jne	.LBB208_9
.LBB208_6:                              # %for.inc.critedge
	movq	8(%rcx), %rdx
	andq	8(%r14), %rdx
	je	.LBB208_8
# %bb.7:                                # %if.then7.1
	movq	24(%rcx), %rcx
	xorl	%eax, %eax
	andnq	%rdx, %rcx, %rcx
	jne	.LBB208_9
.LBB208_8:                              # %for.inc.critedge.1
	movl	$1, %eax
.LBB208_9:                              # %cleanup15
	addq	$32, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end208:
	.size	halide_default_can_use_target_features, .Lfunc_end208-halide_default_can_use_target_features
                                        # -- End function
	.section	.text.halide_set_custom_can_use_target_features,"ax",@progbits
	.weak	halide_set_custom_can_use_target_features # -- Begin function halide_set_custom_can_use_target_features
	.p2align	4, 0x90
	.type	halide_set_custom_can_use_target_features,@function
halide_set_custom_can_use_target_features: # @halide_set_custom_can_use_target_features
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rax
	movq	%rdi, (%rcx)
	popq	%rbp
	retq
.Lfunc_end209:
	.size	halide_set_custom_can_use_target_features, .Lfunc_end209-halide_set_custom_can_use_target_features
                                        # -- End function
	.section	.text.halide_can_use_target_features,"ax",@progbits
	.weak	halide_can_use_target_features  # -- Begin function halide_can_use_target_features
	.p2align	4, 0x90
	.type	halide_can_use_target_features,@function
halide_can_use_target_features:         # @halide_can_use_target_features
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.Lfunc_end210:
	.size	halide_can_use_target_features, .Lfunc_end210-halide_can_use_target_features
                                        # -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4                               # -- Begin function _ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv
.LCPI211_0:
	.quad	34084860461808                  # 0x1f00000002f0
	.quad	0                               # 0x0
	.section	.text._ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv,@function
_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv: # @_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	movq	%rdi, %r8
	vmovaps	.LCPI211_0(%rip), %xmm0         # xmm0 = [34084860461808,0]
	vmovups	%ymm0, (%rdi)
	movq	$1, -56(%rbp)
	#APP

	xchgq	%rsi, %rbx
	movl	-56(%rbp), %eax
	movl	-52(%rbp), %ecx
	cpuid
	movl	%eax, -56(%rbp)
	movl	%ebx, -52(%rbp)
	movl	%ecx, -48(%rbp)
	movl	%edx, -44(%rbp)
	xchgq	%rsi, %rbx

	#NO_APP
	movl	-48(%rbp), %eax
	movq	%rax, %rcx
	shrq	$15, %rcx
	andl	$16, %ecx
	movq	%rax, %rdx
	shrq	$23, %rdx
	andl	$32, %edx
	orq	%rcx, %rdx
	movq	%rax, %rcx
	shrq	$20, %rcx
	andl	$512, %ecx                      # imm = 0x200
	orq	%rdx, %rcx
	movq	%rax, %rdi
	shrq	$5, %rdi
	andl	$128, %edi
	orq	%rcx, %rdi
	testl	$805834752, %eax                # imm = 0x30081000
	je	.LBB211_2
# %bb.1:
	movq	%rdi, 16(%r8)
.LBB211_2:
	notl	%eax
	testl	$1879048192, %eax               # imm = 0x70000000
	jne	.LBB211_10
# %bb.3:                                # %if.then30
	movq	$7, -24(%rbp)
	#APP

	xchgq	%rsi, %rbx
	movl	-24(%rbp), %eax
	movl	-20(%rbp), %ecx
	cpuid
	movl	%eax, -24(%rbp)
	movl	%ebx, -20(%rbp)
	movl	%ecx, -16(%rbp)
	movl	%edx, -12(%rbp)
	xchgq	%rsi, %rbx

	#NO_APP
	movl	-20(%rbp), %eax
	testb	$32, %al
	je	.LBB211_5
# %bb.4:                                # %if.then35
	orq	$64, %rdi
	movq	%rdi, 16(%r8)
.LBB211_5:                              # %if.end36
	notl	%eax
	testl	$268500992, %eax                # imm = 0x10010000
	jne	.LBB211_10
# %bb.6:                                # %if.then40
	xorl	%ecx, %ecx
	testl	$469827584, %eax                # imm = 0x1C010000
	sete	%cl
	shlq	$41, %rcx
	orq	%rdi, %rcx
	xorl	%edx, %edx
	testl	$-805109760, %eax               # imm = 0xD0030000
	sete	%dl
	shlq	$42, %rdx
	orq	%rcx, %rdx
	movabsq	$1099511627776, %rdi            # imm = 0x10000000000
	orq	%rdx, %rdi
	movq	%rdi, 16(%r8)
	testl	$-803012608, %eax               # imm = 0xD0230000
	jne	.LBB211_10
# %bb.7:                                # %if.then54
	movabsq	$8796093022208, %rax            # imm = 0x80000000000
	orq	%rdi, %rax
	movq	%rax, 16(%r8)
	movabsq	$4294967303, %rax               # imm = 0x100000007
	movq	%rax, -40(%rbp)
	#APP

	xchgq	%rsi, %rbx
	movl	-40(%rbp), %eax
	movl	-36(%rbp), %ecx
	cpuid
	movl	%eax, -40(%rbp)
	movl	%ebx, -36(%rbp)
	movl	%ecx, -32(%rbp)
	movl	%edx, -28(%rbp)
	xchgq	%rsi, %rbx

	#NO_APP
	testb	$8, -15(%rbp)
	je	.LBB211_10
# %bb.8:                                # %land.lhs.true59
	testb	$32, -40(%rbp)
	je	.LBB211_10
# %bb.9:                                # %if.then63
	movabsq	$26388279066624, %rax           # imm = 0x180000000000
	orq	%rax, %rdi
	movq	%rdi, 16(%r8)
.LBB211_10:                             # %if.end67
	movq	%r8, %rax
	popq	%rbx
	popq	%rbp
	vzeroupper
	retq
.Lfunc_end211:
	.size	_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv, .Lfunc_end211-_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv
                                        # -- End function
	.section	.text.halide_use_jit_module,"ax",@progbits
	.weak	halide_use_jit_module           # -- Begin function halide_use_jit_module
	.p2align	4, 0x90
	.type	halide_use_jit_module,@function
halide_use_jit_module:                  # @halide_use_jit_module
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	popq	%rbp
	retq
.Lfunc_end212:
	.size	halide_use_jit_module, .Lfunc_end212-halide_use_jit_module
                                        # -- End function
	.section	.text.halide_release_jit_module,"ax",@progbits
	.weak	halide_release_jit_module       # -- Begin function halide_release_jit_module
	.p2align	4, 0x90
	.type	halide_release_jit_module,@function
halide_release_jit_module:              # @halide_release_jit_module
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	popq	%rbp
	retq
.Lfunc_end213:
	.size	halide_release_jit_module, .Lfunc_end213-halide_release_jit_module
                                        # -- End function
	.section	.text.blur,"ax",@progbits
	.globl	blur                            # -- Begin function blur
	.p2align	4, 0x90
	.type	blur,@function
blur:                                   # @blur
# %bb.0:                                # %entry
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$456, %rsp                      # imm = 0x1C8
	testq	%rsi, %rsi
	je	.LBB214_1
# %bb.6:                                # %"assert succeeded"
	testq	%rdi, %rdi
	je	.LBB214_5
# %bb.7:                                # %"assert succeeded2"
	movq	40(%rdi), %r13
	movslq	(%r13), %rbx
	movl	4(%r13), %ebp
	movl	16(%r13), %r8d
	movl	20(%r13), %r11d
	movq	40(%rsi), %rcx
	movslq	(%rcx), %r15
	movslq	4(%rcx), %r10
	leal	(%rbx,%rbp), %eax
	leal	(%r10,%r15), %edx
	cmpl	%edx, %eax
	movl	%eax, 28(%rsp)                  # 4-byte Spill
	movl	%eax, %r14d
	movl	%edx, 240(%rsp)                 # 4-byte Spill
	cmovgl	%edx, %r14d
	leal	1(%rbx), %eax
	cmpl	%eax, %r14d
	cmovlel	%eax, %r14d
	cmpq	$256, %r10                      # imm = 0x100
	movl	16(%rcx), %edx
	movslq	20(%rcx), %r9
	movl	$256, %eax                      # imm = 0x100
	cmovll	%r10d, %eax
	addl	%r15d, %eax
	movq	%rbp, 48(%rsp)                  # 8-byte Spill
	addl	%ebx, %ebp
	addl	$255, %ebp
	cmpl	%eax, %ebp
	movq	%rax, 104(%rsp)                 # 8-byte Spill
	cmovgl	%eax, %ebp
	addl	$-256, %ebp
	cmpl	%ebx, %ebp
	cmovlel	%ebx, %ebp
	movl	%ebp, 168(%rsp)                 # 4-byte Spill
	leal	(%r9,%rdx), %ebp
	leal	(%r11,%r8), %eax
	decl	%eax
	cmpl	%ebp, %eax
	movl	%eax, 80(%rsp)                  # 4-byte Spill
	movl	%ebp, 232(%rsp)                 # 4-byte Spill
	cmovgl	%ebp, %eax
	cmpl	%r8d, %eax
	cmovlel	%r8d, %eax
	movl	%eax, 32(%rsp)                  # 4-byte Spill
	cmpq	$32, %r9
	movl	8(%rcx), %eax
	movl	%eax, 136(%rsp)                 # 4-byte Spill
	movslq	24(%rcx), %rax
	movq	%rax, 216(%rsp)                 # 8-byte Spill
	movl	$32, %eax
	cmovll	%r9d, %eax
	movq	%rdx, 200(%rsp)                 # 8-byte Spill
	addl	%edx, %eax
	leal	(%r11,%r8), %ecx
	addl	$32, %ecx
	cmpl	%eax, %ecx
	movq	%rax, 160(%rsp)                 # 8-byte Spill
	cmovgl	%eax, %ecx
	addl	$-33, %ecx
	cmpl	%r8d, %ecx
	cmovlel	%r8d, %ecx
	movq	16(%rdi), %r12
	movq	24(%rdi), %rax
	movq	%rax, 192(%rsp)                 # 8-byte Spill
	movl	32(%rdi), %ebp
	movl	36(%rdi), %eax
	movl	%eax, 176(%rsp)                 # 4-byte Spill
	movl	8(%r13), %eax
	movl	%eax, 184(%rsp)                 # 4-byte Spill
	movslq	24(%r13), %rax
	movq	%rax, 112(%rsp)                 # 8-byte Spill
	movq	16(%rsi), %rdx
	movq	24(%rsi), %rax
	movq	%rax, 72(%rsp)                  # 8-byte Spill
	movl	32(%rsi), %eax
	movl	%eax, 56(%rsp)                  # 4-byte Spill
	movl	36(%rsi), %eax
	movl	%eax, 40(%rsp)                  # 4-byte Spill
	movl	%r10d, %eax
	movq	%rax, 88(%rsp)                  # 8-byte Spill
	movq	%rdx, 208(%rsp)                 # 8-byte Spill
	testq	%r12, %r12
	jne	.LBB214_9
# %bb.8:                                # %_halide_buffer_is_bounds_query.exit
	cmpq	$0, (%rdi)
	movq	208(%rsp), %rdx                 # 8-byte Reload
	je	.LBB214_88
.LBB214_9:                              # %after_bb
	testq	%rdx, %rdx
	movq	%r8, 96(%rsp)                   # 8-byte Spill
	jne	.LBB214_11
.LBB214_10:                             # %_halide_buffer_is_bounds_query.exit117
	cmpq	$0, (%rsi)
	jne	.LBB214_11
# %bb.89:                               # %then_bb4
	cmpl	$257, %r10d                     # imm = 0x101
	movl	$256, %edx                      # imm = 0x100
	cmovgel	88(%rsp), %edx                  # 4-byte Folded Reload
	movl	%r14d, 24(%rsp)                 # 4-byte Spill
	movq	40(%rsi), %r14
	movq	%r9, %r13
	movl	%ebp, %eax
	movq	104(%rsp), %rbp                 # 8-byte Reload
	leal	-256(%rbp), %r9d
	movq	%r10, %r8
	movq	160(%rsp), %rbp                 # 8-byte Reload
	leal	-32(%rbp), %r10d
	cmpl	$33, %r13d
	movl	$32, %ebp
	cmovgel	%r13d, %ebp
	movl	%r9d, 328(%rsp)
	movq	%r13, %r9
	movl	%edx, 332(%rsp)
	movq	$1, 336(%rsp)
	movl	%r10d, 344(%rsp)
	movq	%r8, %r10
	movq	96(%rsp), %r8                   # 8-byte Reload
	movl	%ebp, 348(%rsp)
	movl	%edx, 352(%rsp)
	vpxor	%xmm0, %xmm0, %xmm0
	vmovdqu	%xmm0, (%rsi)
	movl	$0, 356(%rsp)
	movq	$0, 16(%rsi)
	movabsq	$8590002177, %rdx               # imm = 0x200010801
	movq	%rdx, 32(%rsi)
	movl	328(%rsp), %edx
	movl	%edx, (%r14)
	movl	332(%rsp), %edx
	movl	%edx, 4(%r14)
	movq	336(%rsp), %rdx
	movq	%rdx, 8(%r14)
	movl	24(%rsp), %r14d                 # 4-byte Reload
	movq	40(%rsi), %rdx
	movl	344(%rsp), %ebp
	movl	%ebp, 16(%rdx)
	movl	348(%rsp), %ebp
	movl	%ebp, 20(%rdx)
	movl	352(%rsp), %ebp
	movl	%ebp, 24(%rdx)
	movl	356(%rsp), %ebp
	movl	%ebp, 28(%rdx)
	movl	%eax, %ebp
	movq	$0, 24(%rsi)
	jmp	.LBB214_11
.LBB214_88:                             # %then_bb
	movl	%r14d, %eax
	movq	%r9, %r14
	movl	%eax, %r9d
	movl	%ebp, 20(%rsp)                  # 4-byte Spill
	movl	168(%rsp), %ebp                 # 4-byte Reload
	subl	%ebp, %r9d
	movl	32(%rsp), %edx                  # 4-byte Reload
	subl	%ecx, %edx
	incl	%edx
	movl	%ebp, 296(%rsp)
	movl	%r9d, 300(%rsp)
	movq	$1, 304(%rsp)
	movl	%ecx, 312(%rsp)
	movl	%edx, 316(%rsp)
	movl	%r9d, 320(%rsp)
	movq	%r14, %r9
	movl	%eax, %r14d
	movl	$0, 324(%rsp)
	vpxor	%xmm0, %xmm0, %xmm0
	vmovdqu	%xmm0, (%rdi)
	movq	$0, 16(%rdi)
	movabsq	$8590002177, %rdx               # imm = 0x200010801
	movq	%rdx, 32(%rdi)
	movl	296(%rsp), %edx
	movl	%edx, (%r13)
	movl	300(%rsp), %edx
	movl	%edx, 4(%r13)
	movq	304(%rsp), %rdx
	movq	%rdx, 8(%r13)
	movq	40(%rdi), %rdx
	movl	312(%rsp), %ebp
	movl	%ebp, 16(%rdx)
	movl	316(%rsp), %ebp
	movl	%ebp, 20(%rdx)
	movl	320(%rsp), %ebp
	movl	%ebp, 24(%rdx)
	movl	324(%rsp), %ebp
	movl	%ebp, 28(%rdx)
	movl	20(%rsp), %ebp                  # 4-byte Reload
	movq	$0, 24(%rdi)
	movq	16(%rsi), %rdx
	testq	%rdx, %rdx
	movq	%r8, 96(%rsp)                   # 8-byte Spill
	je	.LBB214_10
.LBB214_11:                             # %after_bb3
	cmpq	$0, 16(%rdi)
	je	.LBB214_13
# %bb.12:
	xorl	%edx, %edx
	movl	56(%rsp), %eax                  # 4-byte Reload
	movl	40(%rsp), %r13d                 # 4-byte Reload
	cmpq	$0, 16(%rsi)
	je	.LBB214_16
.LBB214_15:
	xorl	%esi, %esi
	orb	%sil, %dl
	je	.LBB214_18
	jmp	.LBB214_3
.LBB214_13:                             # %land.rhs.i124
	cmpq	$0, (%rdi)
	sete	%dl
	movl	56(%rsp), %eax                  # 4-byte Reload
	movl	40(%rsp), %r13d                 # 4-byte Reload
	cmpq	$0, 16(%rsi)
	jne	.LBB214_15
.LBB214_16:                             # %land.rhs.i130
	cmpq	$0, (%rsi)
	sete	%sil
	orb	%sil, %dl
	jne	.LBB214_3
.LBB214_18:                             # %then_bb7
	movq	%r15, 152(%rsp)                 # 8-byte Spill
	addl	%r11d, %r8d
	movl	%ebp, %edx
	xorl	%ebp, %ebp
	cmpl	$32, %r9d
	setl	%bpl
	xorl	%edi, %edi
	cmpl	$256, %r10d                     # imm = 0x100
	setl	%dil
	xorl	%esi, %esi
	movl	%edx, 20(%rsp)                  # 4-byte Spill
	cmpl	$67585, %edx                    # imm = 0x10801
	setne	%sil
	movq	%rsi, 224(%rsp)                 # 8-byte Spill
	xorl	%esi, %esi
	cmpl	$67585, %eax                    # imm = 0x10801
	setne	%sil
	shlq	$2, %rsi
	xorl	%eax, %eax
	cmpl	$2, %r13d
	setne	%al
	movq	%rax, 64(%rsp)                  # 8-byte Spill
	xorl	%r15d, %r15d
	cmpl	28(%rsp), %r14d                 # 4-byte Folded Reload
	setg	%r15b
	shlq	$4, %r15
	movq	%r9, 144(%rsp)                  # 8-byte Spill
	movq	48(%rsp), %rax                  # 8-byte Reload
	movq	%rax, %r9
	shrq	$26, %r9
	andl	$-32, %r9d
	movl	%r14d, 24(%rsp)                 # 4-byte Spill
	xorl	%r14d, %r14d
	movl	%r8d, 84(%rsp)                  # 4-byte Spill
	cmpl	%r8d, 32(%rsp)                  # 4-byte Folded Reload
	setge	%r14b
	shlq	$6, %r14
	movq	%r10, 128(%rsp)                 # 8-byte Spill
	movq	%r11, %r10
	shrq	$24, %r10
	andl	$-128, %r10d
	shlq	$8, %rdi
	shlq	$9, %rbp
	xorl	%r13d, %r13d
	cmpl	$1, 184(%rsp)                   # 4-byte Folded Reload
	setne	%r13b
	shlq	$10, %r13
	movq	%r11, 120(%rsp)                 # 8-byte Spill
	xorl	%r11d, %r11d
	cmpl	$1, 136(%rsp)                   # 4-byte Folded Reload
	setne	%r11b
	shlq	$11, %r11
	movabsq	$-9223372036854775808, %rdx     # imm = 0x8000000000000000
	leaq	2(%rdx), %r8
	cmpl	$2, 176(%rsp)                   # 4-byte Folded Reload
	cmoveq	%rdx, %r8
	addq	224(%rsp), %r8                  # 8-byte Folded Reload
	orq	%r9, %r8
	orq	%r13, %r8
	orq	%r10, %r8
	movq	64(%rsp), %rdx                  # 8-byte Reload
	leaq	(%r8,%rdx,8), %rdx
	orq	%rsi, %rdi
	orq	%r11, %rdi
	orq	%rbp, %rdi
	orq	%rdx, %rdi
	orq	%r15, %rdi
	orq	%r14, %rdi
	tzcntq	%rdi, %rdi
	cmpl	$11, %edi
	jbe	.LBB214_19
# %bb.20:                               # %no_errors_bb
	movslq	%eax, %rdx
	movslq	120(%rsp), %r9                  # 4-byte Folded Reload
	movq	144(%rsp), %rbp                 # 8-byte Reload
	movq	%rbp, %rcx
	imulq	128(%rsp), %rcx                 # 8-byte Folded Reload
	shrl	$31, %eax
	movq	%rax, 48(%rsp)                  # 8-byte Spill
	movq	112(%rsp), %rax                 # 8-byte Reload
	imulq	%r9, %rax
	movq	%rdx, 56(%rsp)                  # 8-byte Spill
	imulq	%rdx, %r9
	movq	%rax, %r10
	negq	%r10
	cmovsq	%rax, %r10
	xorl	%r11d, %r11d
	cmpq	$2147483647, %r10               # imm = 0x7FFFFFFF
	seta	%r11b
	addq	%r11, %r11
	xorl	%r15d, %r15d
	cmpq	$2147483647, %r9                # imm = 0x7FFFFFFF
	setg	%r15b
	shlq	$2, %r15
	movq	88(%rsp), %rsi                  # 8-byte Reload
	shrq	$28, %rsi
	andl	$-8, %esi
	movq	216(%rsp), %rdi                 # 8-byte Reload
	imulq	%rbp, %rdi
	movq	%rdi, %r14
	negq	%r14
	cmovsq	%rdi, %r14
	xorl	%edi, %edi
	cmpq	$2147483647, %r14               # imm = 0x7FFFFFFF
	seta	%dil
	shlq	$4, %rdi
	xorl	%ebp, %ebp
	movq	%rcx, 40(%rsp)                  # 8-byte Spill
	cmpq	$2147483647, %rcx               # imm = 0x7FFFFFFF
	setg	%bpl
	shlq	$5, %rbp
	movq	192(%rsp), %rdx                 # 8-byte Reload
	shll	$5, %edx
	andl	$64, %edx
	movq	72(%rsp), %r13                  # 8-byte Reload
	andl	$2, %r13d
	shlq	$6, %r13
	xorl	%eax, %eax
	cmpq	$0, 208(%rsp)                   # 8-byte Folded Reload
	sete	%al
	shlq	$9, %rax
	testq	%r12, %r12
	movabsq	$-9223372036854775808, %r8      # imm = 0x8000000000000000
	leaq	256(%r8), %rcx
	cmovneq	%r8, %rcx
	orq	%rdx, %rcx
	orq	48(%rsp), %rcx                  # 8-byte Folded Reload
	orq	%rax, %rcx
	orq	%r15, %rcx
	orq	%r13, %rcx
	orq	%rsi, %rcx
	orq	%rbp, %rcx
	orq	%r11, %rcx
	orq	%rdi, %rcx
	tzcntq	%rcx, %rcx
	cmpl	$9, %ecx
	jbe	.LBB214_21
# %bb.54:                               # %"produce result"
	movq	144(%rsp), %r9                  # 8-byte Reload
	testl	%r9d, %r9d
	movq	96(%rsp), %r10                  # 8-byte Reload
	movq	120(%rsp), %rcx                 # 8-byte Reload
	movq	152(%rsp), %r14                 # 8-byte Reload
	movq	128(%rsp), %r8                  # 8-byte Reload
	movl	84(%rsp), %esi                  # 4-byte Reload
	jle	.LBB214_3
# %bb.55:                               # %"for result.s0.v1.v1.preheader"
	cmpl	$0, 88(%rsp)                    # 4-byte Folded Reload
	jle	.LBB214_3
# %bb.56:                               # %"for result.s0.v1.v1.us.preheader"
	leal	31(%r9), %eax
	sarl	$5, %eax
	movl	%eax, 256(%rsp)                 # 4-byte Spill
	addl	$255, %r8d
	sarl	$8, %r8d
	movq	112(%rsp), %rax                 # 8-byte Reload
	movl	%eax, %edi
	imull	%r10d, %edi
	addl	%ebx, %edi
	addl	$-32, %r9d
	movq	200(%rsp), %rax                 # 8-byte Reload
                                        # kill: def $eax killed $eax killed $rax
	subl	%esi, %eax
	movl	%eax, 252(%rsp)                 # 4-byte Spill
	movq	88(%rsp), %rax                  # 8-byte Reload
	addl	$-256, %eax
	movq	%rax, 88(%rsp)                  # 8-byte Spill
	movl	28(%rsp), %edx                  # 4-byte Reload
	movslq	%edx, %rax
	movq	%rax, 376(%rsp)                 # 8-byte Spill
	leaq	-1(%rax), %r13
	movl	%r14d, %eax
	subl	%edx, %eax
	movl	%eax, 276(%rsp)                 # 4-byte Spill
	movl	%edi, 56(%rsp)                  # 4-byte Spill
	movslq	%edi, %rax
	movslq	80(%rsp), %r15                  # 4-byte Folded Reload
	vmovd	%esi, %xmm0
	vmovdqa	%xmm0, 432(%rsp)                # 16-byte Spill
	vmovd	%r10d, %xmm0
	vpbroadcastd	%xmm0, %xmm0
	vmovdqa	%xmm0, 416(%rsp)                # 16-byte Spill
	leal	256(%r14), %edi
	movq	%rdi, 360(%rsp)                 # 8-byte Spill
	movq	%rax, 224(%rsp)                 # 8-byte Spill
                                        # kill: def $eax killed $eax killed $rax
	negl	%eax
	movl	%eax, 272(%rsp)                 # 4-byte Spill
	movl	%r14d, %eax
	subl	%edx, %eax
	movl	%eax, 268(%rsp)                 # 4-byte Spill
	addl	%r10d, %ecx
	xorl	%edi, %edi
	xorl	%edx, %edx
	movq	%rcx, 120(%rsp)                 # 8-byte Spill
	movq	%r8, 128(%rsp)                  # 8-byte Spill
	movq	%r9, 144(%rsp)                  # 8-byte Spill
	movq	%r15, 368(%rsp)                 # 8-byte Spill
	.p2align	4, 0x90
.LBB214_57:                             # %"for result.s0.v1.v1.us"
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB214_58 Depth 2
                                        #       Child Loop BB214_61 Depth 3
                                        #         Child Loop BB214_62 Depth 4
                                        #       Child Loop BB214_66 Depth 3
                                        #         Child Loop BB214_68 Depth 4
                                        #         Child Loop BB214_71 Depth 4
                                        #         Child Loop BB214_74 Depth 4
                                        #       Child Loop BB214_78 Depth 3
                                        #         Child Loop BB214_79 Depth 4
                                        #       Child Loop BB214_82 Depth 3
                                        #         Child Loop BB214_83 Depth 4
	cmpl	%r9d, %edi
	movl	%r9d, %eax
	movl	%edi, 264(%rsp)                 # 4-byte Spill
	cmovll	%edi, %eax
	movq	216(%rsp), %rdi                 # 8-byte Reload
                                        # kill: def $edi killed $edi killed $rdi
	imull	%eax, %edi
	movl	%edi, 292(%rsp)                 # 4-byte Spill
	movq	200(%rsp), %rdi                 # 8-byte Reload
	addl	%edi, %eax
                                        # kill: def $ecx killed $ecx killed $rcx
	subl	%eax, %ecx
	cmpl	$33, %ecx
	movl	$33, %ebp
	cmovgel	%ebp, %ecx
	movl	$33, %ebp
	testl	%ecx, %ecx
	movl	$-1, %r11d
	cmovsl	%r11d, %ecx
	shll	$8, %ecx
	movl	%ecx, 288(%rsp)                 # 4-byte Spill
	movl	%r10d, %ecx
	subl	%eax, %ecx
	cmpl	$33, %ecx
	cmovgel	%ebp, %ecx
	testl	%ecx, %ecx
	cmovsl	%r11d, %ecx
	shll	$8, %ecx
	movl	%ecx, 284(%rsp)                 # 4-byte Spill
	movl	%edx, 260(%rsp)                 # 4-byte Spill
	movl	%edx, %ebp
	shll	$5, %ebp
	cmpl	%ebp, %r9d
	cmovlel	%r9d, %ebp
	leal	(%rbp,%rdi), %edx
	leal	-1(%rbp,%rdi), %ecx
	leal	33(%rbp,%rdi), %eax
	vmovdqa	432(%rsp), %xmm0                # 16-byte Reload
	vpinsrd	$1, %ecx, %xmm0, %xmm0
	vmovdqa	416(%rsp), %xmm1                # 16-byte Reload
	vpinsrd	$0, %ecx, %xmm1, %xmm1
	vpcmpgtd	%xmm1, %xmm0, %xmm2
	vblendvps	%xmm2, %xmm0, %xmm1, %xmm0
	vmovd	%eax, %xmm1
	vpbroadcastd	%xmm1, %xmm1
	vpminsd	%xmm0, %xmm1, %xmm1
	vpextrd	$1, %xmm1, %ecx
	vmovd	%xmm1, %edi
	subl	%ecx, %edi
	movq	%rdi, 136(%rsp)                 # 8-byte Spill
	movl	%r10d, %edi
	movq	%rdx, 392(%rsp)                 # 8-byte Spill
	subl	%edx, %edi
	cmpl	$33, %edi
	movl	$33, %edx
	cmovgel	%edx, %edi
	testl	%edi, %edi
	movl	$-1, %edx
	movl	%edi, 280(%rsp)                 # 4-byte Spill
	cmovnsl	%edi, %edx
	movq	%rdx, 168(%rsp)                 # 8-byte Spill
	addl	252(%rsp), %ebp                 # 4-byte Folded Reload
	testl	%ebp, %ebp
	movl	$1, %edx
	cmovgl	%edx, %ebp
	vpextrd	$1, %xmm0, %edx
	cmpl	%edx, %esi
	cmovgl	%esi, %edx
	cmpl	%edx, %eax
	cmovlel	%eax, %edx
	movq	%rbp, 400(%rsp)                 # 8-byte Spill
	leal	32(%rbp), %eax
	movq	%rax, 160(%rsp)                 # 8-byte Spill
	movslq	%ecx, %rcx
	movslq	%edx, %rax
	movq	%rax, 232(%rsp)                 # 8-byte Spill
	movq	112(%rsp), %rdx                 # 8-byte Reload
	movq	%rcx, %rax
	movq	%rcx, 240(%rsp)                 # 8-byte Spill
	imulq	%rcx, %rdx
	addq	%r12, %rdx
	movq	%rdx, 384(%rsp)                 # 8-byte Spill
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB214_58:                             # %"for result.s0.v0.v0.us"
                                        #   Parent Loop BB214_57 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB214_61 Depth 3
                                        #         Child Loop BB214_62 Depth 4
                                        #       Child Loop BB214_66 Depth 3
                                        #         Child Loop BB214_68 Depth 4
                                        #         Child Loop BB214_71 Depth 4
                                        #         Child Loop BB214_74 Depth 4
                                        #       Child Loop BB214_78 Depth 3
                                        #         Child Loop BB214_79 Depth 4
                                        #       Child Loop BB214_82 Depth 3
                                        #         Child Loop BB214_83 Depth 4
	movq	88(%rsp), %r10                  # 8-byte Reload
	cmpl	%r10d, %eax
	movl	%r10d, %edx
	movl	%eax, 24(%rsp)                  # 4-byte Spill
	cmovll	%eax, %edx
	movslq	%edx, %rax
	addq	%r14, %rax
	movq	376(%rsp), %rcx                 # 8-byte Reload
	subq	%rax, %rcx
	cmpq	$256, %rcx                      # imm = 0x100
	movl	$256, %r9d                      # imm = 0x100
	cmovgeq	%r9, %rcx
	testq	%rcx, %rcx
	movl	$0, %r8d
	cmovleq	%r8, %rcx
	movq	%rcx, 184(%rsp)                 # 8-byte Spill
	movl	28(%rsp), %r11d                 # 4-byte Reload
	cmpl	%r11d, %ebx
	movl	%r11d, %edi
	cmovgl	%ebx, %edi
	leal	(%r14,%rdx), %ebp
	cmpl	%ebp, %edi
	cmovlel	%ebp, %edi
	movq	360(%rsp), %rcx                 # 8-byte Reload
	addl	%edx, %ecx
	cmpl	%ecx, %edi
	cmovgel	%ecx, %edi
	movl	%edi, 48(%rsp)                  # 4-byte Spill
	movl	268(%rsp), %edi                 # 4-byte Reload
	movl	%edi, %r15d
	movq	%rdx, 408(%rsp)                 # 8-byte Spill
	addl	%edx, %r15d
	cmovnsl	%r8d, %r15d
	movq	%rbx, %rdx
	subq	%rax, %rdx
	cmpq	$256, %rdx                      # imm = 0x100
	cmovgeq	%r9, %rdx
	testq	%rdx, %rdx
	cmovleq	%r8, %rdx
	movq	%rdx, 176(%rsp)                 # 8-byte Spill
	cmpl	%ebp, %ebx
	movl	%ebp, %edx
	cmovgl	%ebx, %edx
	cmpl	%ecx, %edx
	movl	%ecx, %eax
	cmovll	%edx, %eax
	movl	%eax, 40(%rsp)                  # 4-byte Spill
	cmpl	%ebp, %r11d
	movl	%ebp, 32(%rsp)                  # 4-byte Spill
	movl	%ebp, %r14d
	cmovgl	%r11d, %r14d
	cmpl	%ecx, %r14d
	cmovgel	%ecx, %r14d
	cmpl	%ecx, %edx
	cmovgel	%ecx, %edx
	movl	%edx, 104(%rsp)                 # 4-byte Spill
	movl	%esi, 20(%rsp)                  # 4-byte Spill
	movl	%esi, %ebp
	shll	$8, %ebp
	cmpl	%ebp, %r10d
	cmovlel	%r10d, %ebp
	movl	$17414, %esi                    # imm = 0x4406
	xorl	%edi, %edi
	callq	halide_malloc@PLT
	movq	%rax, 64(%rsp)                  # 8-byte Spill
	testq	%rax, %rax
	je	.LBB214_87
# %bb.59:                               # %"assert succeeded32.us"
                                        #   in Loop: Header=BB214_58 Depth=2
	movslq	32(%rsp), %rcx                  # 4-byte Folded Reload
	movq	%rbp, 32(%rsp)                  # 8-byte Spill
	movq	152(%rsp), %rax                 # 8-byte Reload
	addl	%ebp, %eax
	movq	%rax, 72(%rsp)                  # 8-byte Spill
	cmpl	$0, 280(%rsp)                   # 4-byte Folded Reload
	movq	96(%rsp), %r8                   # 8-byte Reload
	movq	112(%rsp), %r11                 # 8-byte Reload
	movl	84(%rsp), %r9d                  # 4-byte Reload
	movq	392(%rsp), %r10                 # 8-byte Reload
	js	.LBB214_64
# %bb.60:                               # %"for f0.s0.v1.rebased.preheader.us"
                                        #   in Loop: Header=BB214_58 Depth=2
	movq	64(%rsp), %rax                  # 8-byte Reload
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB214_61:                             # %"for f0.s0.v1.rebased.us"
                                        #   Parent Loop BB214_57 Depth=1
                                        #     Parent Loop BB214_58 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB214_62 Depth 4
	leal	(%r10,%rdx), %esi
	cmpl	%esi, %r9d
	cmovlel	%r9d, %esi
	decl	%esi
	cmpl	%r8d, %esi
	cmovlel	%r8d, %esi
	imull	%r11d, %esi
	subl	56(%rsp), %esi                  # 4-byte Folded Reload
	movslq	%esi, %rsi
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB214_62:                             # %"for f0.s0.v0.rebased.us"
                                        #   Parent Loop BB214_57 Depth=1
                                        #     Parent Loop BB214_58 Depth=2
                                        #       Parent Loop BB214_61 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	leaq	(%rcx,%rdi), %rbp
	cmpq	%r13, %rbp
	cmovgq	%r13, %rbp
	cmpq	%rbx, %rbp
	cmovleq	%rbx, %rbp
	addq	%rsi, %rbp
	movzbl	(%r12,%rbp), %ebp
	movw	%bp, (%rax,%rdi,2)
	incq	%rdi
	cmpq	$256, %rdi                      # imm = 0x100
	jne	.LBB214_62
# %bb.63:                               # %"end for f0.s0.v0.rebased.us"
                                        #   in Loop: Header=BB214_61 Depth=3
	leaq	1(%rdx), %rsi
	addq	$512, %rax                      # imm = 0x200
	cmpq	168(%rsp), %rdx                 # 8-byte Folded Reload
	movq	%rsi, %rdx
	jne	.LBB214_61
.LBB214_64:                             # %"end for f0.s0.v1.rebased.us"
                                        #   in Loop: Header=BB214_58 Depth=2
	movl	%ebx, %eax
	movq	72(%rsp), %rdi                  # 8-byte Reload
	subl	%edi, %eax
	movl	%eax, 192(%rsp)                 # 4-byte Spill
	movl	%edi, %eax
	cmovgl	%ebx, %eax
	leal	256(%rdi), %edx
	movl	28(%rsp), %esi                  # 4-byte Reload
	cmpl	%edi, %esi
	cmovgl	%esi, %edi
	cmpl	%edi, %edx
	cmovlel	%edx, %edi
	movq	%rdi, 72(%rsp)                  # 8-byte Spill
	cmpl	%eax, %edx
	cmovlel	%edx, %eax
	cmpl	$0, 136(%rsp)                   # 4-byte Folded Reload
	jle	.LBB214_76
# %bb.65:                               # %"for f0.s0.v1.rebased33.preheader.us"
                                        #   in Loop: Header=BB214_58 Depth=2
	addl	$255, %r15d
	movl	40(%rsp), %edx                  # 4-byte Reload
	addl	272(%rsp), %edx                 # 4-byte Folded Reload
	subl	104(%rsp), %r14d                # 4-byte Folded Reload
	movslq	48(%rsp), %r10                  # 4-byte Folded Reload
	incq	%r15
	movslq	%edx, %rdx
	addq	384(%rsp), %rdx                 # 8-byte Folded Reload
	movq	72(%rsp), %rsi                  # 8-byte Reload
	subl	%eax, %esi
	movq	%rsi, 72(%rsp)                  # 8-byte Spill
	movq	32(%rsp), %rax                  # 8-byte Reload
	addl	276(%rsp), %eax                 # 4-byte Folded Reload
	movl	%eax, %esi
	sarl	$31, %esi
	andl	%eax, %esi
	movl	%esi, 104(%rsp)                 # 4-byte Spill
	movl	192(%rsp), %eax                 # 4-byte Reload
	cmpl	$256, %eax                      # imm = 0x100
	movl	$256, %r8d                      # imm = 0x100
	cmovll	%eax, %r8d
	testl	%eax, %eax
	movl	$0, %eax
	cmovlel	%eax, %r8d
	movq	64(%rsp), %rax                  # 8-byte Reload
	addq	$512, %rax                      # imm = 0x200
	movq	%rax, 48(%rsp)                  # 8-byte Spill
	movl	284(%rsp), %eax                 # 4-byte Reload
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB214_66:                             # %"for f0.s0.v1.rebased33.us"
                                        #   Parent Loop BB214_57 Depth=1
                                        #     Parent Loop BB214_58 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB214_68 Depth 4
                                        #         Child Loop BB214_71 Depth 4
                                        #         Child Loop BB214_74 Depth 4
	movl	%eax, 40(%rsp)                  # 4-byte Spill
	movslq	%eax, %r9
	movq	240(%rsp), %rax                 # 8-byte Reload
	movq	%rsi, 32(%rsp)                  # 8-byte Spill
	addq	%rsi, %rax
	imulq	%r11, %rax
	subq	224(%rsp), %rax                 # 8-byte Folded Reload
	cmpl	$0, 192(%rsp)                   # 4-byte Folded Reload
	jle	.LBB214_69
# %bb.67:                               # %"for f0.s0.v0.rebased36.preheader.us"
                                        #   in Loop: Header=BB214_66 Depth=3
	movq	48(%rsp), %rsi                  # 8-byte Reload
	leaq	(%rsi,%r9,2), %rbp
	xorl	%r11d, %r11d
	.p2align	4, 0x90
.LBB214_68:                             # %"for f0.s0.v0.rebased36.us"
                                        #   Parent Loop BB214_57 Depth=1
                                        #     Parent Loop BB214_58 Depth=2
                                        #       Parent Loop BB214_66 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	leaq	(%rcx,%r11), %rdi
	cmpq	%r13, %rdi
	cmovgq	%r13, %rdi
	cmpq	%rbx, %rdi
	cmovleq	%rbx, %rdi
	addq	%rax, %rdi
	movzbl	(%r12,%rdi), %edi
	movw	%di, (%rbp,%r11,2)
	incq	%r11
	cmpq	%r11, %r8
	jne	.LBB214_68
.LBB214_69:                             # %"end for f0.s0.v0.rebased37.us"
                                        #   in Loop: Header=BB214_66 Depth=3
	cmpl	$0, 72(%rsp)                    # 4-byte Folded Reload
	jle	.LBB214_72
# %bb.70:                               # %"for f0.s0.v0.rebased39.preheader.us"
                                        #   in Loop: Header=BB214_66 Depth=3
	movq	176(%rsp), %rsi                 # 8-byte Reload
	addq	%r9, %rsi
	movq	48(%rsp), %rdi                  # 8-byte Reload
	leaq	(%rdi,%rsi,2), %rdi
	xorl	%ebp, %ebp
	.p2align	4, 0x90
.LBB214_71:                             # %"for f0.s0.v0.rebased39.us"
                                        #   Parent Loop BB214_57 Depth=1
                                        #     Parent Loop BB214_58 Depth=2
                                        #       Parent Loop BB214_66 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movzbl	(%rdx,%rbp), %esi
	movw	%si, (%rdi,%rbp,2)
	incq	%rbp
	cmpq	%rbp, %r14
	jne	.LBB214_71
.LBB214_72:                             # %"end for f0.s0.v0.rebased40.us"
                                        #   in Loop: Header=BB214_66 Depth=3
	cmpl	$-256, 104(%rsp)                # 4-byte Folded Reload
	movq	112(%rsp), %r11                 # 8-byte Reload
	jle	.LBB214_75
# %bb.73:                               # %"for f0.s0.v0.rebased42.preheader.us"
                                        #   in Loop: Header=BB214_66 Depth=3
	addq	184(%rsp), %r9                  # 8-byte Folded Reload
	movq	48(%rsp), %rsi                  # 8-byte Reload
	leaq	(%rsi,%r9,2), %rbp
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB214_74:                             # %"for f0.s0.v0.rebased42.us"
                                        #   Parent Loop BB214_57 Depth=1
                                        #     Parent Loop BB214_58 Depth=2
                                        #       Parent Loop BB214_66 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	leaq	(%r10,%rdi), %rsi
	cmpq	%r13, %rsi
	cmovgq	%r13, %rsi
	cmpq	%rbx, %rsi
	cmovleq	%rbx, %rsi
	addq	%rax, %rsi
	movzbl	(%r12,%rsi), %esi
	movw	%si, (%rbp,%rdi,2)
	incq	%rdi
	cmpq	%rdi, %r15
	jne	.LBB214_74
.LBB214_75:                             # %"end for f0.s0.v0.rebased43.us"
                                        #   in Loop: Header=BB214_66 Depth=3
	movq	32(%rsp), %rsi                  # 8-byte Reload
	incq	%rsi
	movl	40(%rsp), %eax                  # 4-byte Reload
	addl	$256, %eax                      # imm = 0x100
	addq	%r11, %rdx
	cmpq	136(%rsp), %rsi                 # 8-byte Folded Reload
	jne	.LBB214_66
.LBB214_76:                             # %"end for f0.s0.v1.rebased34.us"
                                        #   in Loop: Header=BB214_58 Depth=2
	cmpl	$-33, 400(%rsp)                 # 4-byte Folded Reload
	movq	96(%rsp), %r10                  # 8-byte Reload
	movq	152(%rsp), %r14                 # 8-byte Reload
	movl	80(%rsp), %r11d                 # 4-byte Reload
	movq	368(%rsp), %r15                 # 8-byte Reload
	jle	.LBB214_81
# %bb.77:                               # %"for f0.s0.v1.rebased45.preheader.us"
                                        #   in Loop: Header=BB214_58 Depth=2
	movq	64(%rsp), %rax                  # 8-byte Reload
	leaq	512(%rax), %r8
	movl	288(%rsp), %edx                 # 4-byte Reload
	xorl	%r9d, %r9d
	.p2align	4, 0x90
.LBB214_78:                             # %"for f0.s0.v1.rebased45.us"
                                        #   Parent Loop BB214_57 Depth=1
                                        #     Parent Loop BB214_58 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB214_79 Depth 4
	movslq	%edx, %rax
	movq	232(%rsp), %rsi                 # 8-byte Reload
	leaq	(%r9,%rsi), %rbp
	cmpq	%r15, %rbp
	cmovgl	%r11d, %ebp
	leaq	(%r8,%rax,2), %rdi
	cmpl	%r10d, %ebp
	cmovlel	%r10d, %ebp
	imull	112(%rsp), %ebp                 # 4-byte Folded Reload
	subl	56(%rsp), %ebp                  # 4-byte Folded Reload
	movslq	%ebp, %rbp
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB214_79:                             # %"for f0.s0.v0.rebased48.us"
                                        #   Parent Loop BB214_57 Depth=1
                                        #     Parent Loop BB214_58 Depth=2
                                        #       Parent Loop BB214_78 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	leaq	(%rcx,%rax), %rsi
	cmpq	%r13, %rsi
	cmovgq	%r13, %rsi
	cmpq	%rbx, %rsi
	cmovleq	%rbx, %rsi
	addq	%rbp, %rsi
	movzbl	(%r12,%rsi), %esi
	movw	%si, (%rdi,%rax,2)
	incq	%rax
	cmpq	$256, %rax                      # imm = 0x100
	jne	.LBB214_79
# %bb.80:                               # %"end for f0.s0.v0.rebased49.us"
                                        #   in Loop: Header=BB214_78 Depth=3
	leaq	1(%r9), %rax
	addl	$256, %edx                      # imm = 0x100
	cmpq	160(%rsp), %r9                  # 8-byte Folded Reload
	movq	%rax, %r9
	jne	.LBB214_78
.LBB214_81:                             # %"for result.s0.v1.v3.us.preheader"
                                        #   in Loop: Header=BB214_58 Depth=2
	movq	408(%rsp), %rbp                 # 8-byte Reload
	addl	292(%rsp), %ebp                 # 4-byte Folded Reload
	movq	64(%rsp), %rax                  # 8-byte Reload
	addq	$1024, %rax                     # imm = 0x400
	xorl	%ecx, %ecx
	movq	216(%rsp), %r8                  # 8-byte Reload
	movq	208(%rsp), %r9                  # 8-byte Reload
	.p2align	4, 0x90
.LBB214_82:                             # %"for result.s0.v1.v3.us"
                                        #   Parent Loop BB214_57 Depth=1
                                        #     Parent Loop BB214_58 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB214_83 Depth 4
	movslq	%ebp, %rdx
	addq	%r9, %rdx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB214_83:                             # %"for result.s0.v0.v2.us"
                                        #   Parent Loop BB214_57 Depth=1
                                        #     Parent Loop BB214_58 Depth=2
                                        #       Parent Loop BB214_82 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movzwl	(%rax,%rsi,2), %edi
	addw	-512(%rax,%rsi,2), %di
	addw	-1024(%rax,%rsi,2), %di
	movzwl	%di, %edi
	imull	$58255, %edi, %edi              # imm = 0xE38F
	shrl	$19, %edi
	movb	%dil, (%rdx,%rsi)
	incq	%rsi
	cmpq	$256, %rsi                      # imm = 0x100
	jne	.LBB214_83
# %bb.84:                               # %"end for result.s0.v0.v2.us"
                                        #   in Loop: Header=BB214_82 Depth=3
	incq	%rcx
	addl	%r8d, %ebp
	addq	$512, %rax                      # imm = 0x200
	cmpq	$32, %rcx
	jne	.LBB214_82
# %bb.85:                               # %call_destructor.exit154.us
                                        #   in Loop: Header=BB214_58 Depth=2
	xorl	%edi, %edi
	movq	64(%rsp), %rsi                  # 8-byte Reload
	callq	halide_free@PLT
	movl	20(%rsp), %esi                  # 4-byte Reload
	incl	%esi
	movl	24(%rsp), %eax                  # 4-byte Reload
	addl	$256, %eax                      # imm = 0x100
	movq	128(%rsp), %r8                  # 8-byte Reload
	cmpl	%r8d, %esi
	jne	.LBB214_58
# %bb.86:                               # %"end for result.s0.v0.v0.loopexit.us"
                                        #   in Loop: Header=BB214_57 Depth=1
	movl	260(%rsp), %edx                 # 4-byte Reload
	incl	%edx
	movl	264(%rsp), %edi                 # 4-byte Reload
	addl	$32, %edi
	cmpl	256(%rsp), %edx                 # 4-byte Folded Reload
	movq	96(%rsp), %r10                  # 8-byte Reload
	movq	120(%rsp), %rcx                 # 8-byte Reload
	movq	144(%rsp), %r9                  # 8-byte Reload
	movl	84(%rsp), %esi                  # 4-byte Reload
	jne	.LBB214_57
.LBB214_3:                              # %common.ret
	xorl	%eax, %eax
.LBB214_4:                              # %common.ret
	addq	$456, %rsp                      # imm = 0x1C8
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB214_87:                             # %destructor_block.split.us
	xorl	%edi, %edi
	addq	$456, %rsp                      # imm = 0x1C8
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	halide_error_out_of_memory@PLT  # TAILCALL
.LBB214_1:                              # %"assert failed"
	leaq	.Lstr.200(%rip), %rsi
	jmp	.LBB214_2
.LBB214_5:                              # %"assert failed1"
	leaq	.Lstr(%rip), %rsi
.LBB214_2:                              # %"assert failed"
	xorl	%edi, %edi
	addq	$456, %rsp                      # imm = 0x1C8
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	halide_error_buffer_argument_is_null@PLT # TAILCALL
.LBB214_19:                             # %then_bb7
	movl	20(%rsp), %edx                  # 4-byte Reload
	movl	24(%rsp), %r8d                  # 4-byte Reload
	movq	120(%rsp), %rbp                 # 8-byte Reload
	leaq	.LJTI214_0(%rip), %rsi
	movslq	(%rsi,%rdi,4), %rdi
	addq	%rsi, %rdi
	jmpq	*%rdi
.LBB214_22:                             # %assert_failed
	leaq	.Lstr.203(%rip), %rsi
	xorl	%edi, %edi
	jmp	.LBB214_23
.LBB214_21:                             # %no_errors_bb
	movq	40(%rsp), %rbp                  # 8-byte Reload
	movq	56(%rsp), %rdx                  # 8-byte Reload
	leaq	.LJTI214_1(%rip), %rax
	movslq	(%rax,%rcx,4), %rcx
	addq	%rax, %rcx
	jmpq	*%rcx
.LBB214_40:                             # %assert_failed21
	leaq	.Lstr(%rip), %rsi
	movl	$2147483647, %ecx               # imm = 0x7FFFFFFF
	xorl	%edi, %edi
	jmp	.LBB214_41
.LBB214_42:                             # %assert_failed22
	leaq	.Lstr(%rip), %rsi
	movl	$2147483647, %ecx               # imm = 0x7FFFFFFF
	xorl	%edi, %edi
	movq	%r10, %rdx
	jmp	.LBB214_41
.LBB214_43:                             # %assert_failed23
	leaq	.Lstr(%rip), %rsi
	movl	$2147483647, %ecx               # imm = 0x7FFFFFFF
	xorl	%edi, %edi
	movq	%r9, %rdx
	jmp	.LBB214_44
.LBB214_45:                             # %assert_failed24
	leaq	.Lstr.200(%rip), %rsi
	movl	$2147483647, %ecx               # imm = 0x7FFFFFFF
	xorl	%edi, %edi
	movq	128(%rsp), %rdx                 # 8-byte Reload
	jmp	.LBB214_41
.LBB214_46:                             # %assert_failed25
	leaq	.Lstr.200(%rip), %rsi
	movl	$2147483647, %ecx               # imm = 0x7FFFFFFF
	xorl	%edi, %edi
	movq	%r14, %rdx
.LBB214_41:                             # %assert_failed21
	addq	$456, %rsp                      # imm = 0x1C8
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	halide_error_buffer_allocation_too_large@PLT # TAILCALL
.LBB214_47:                             # %assert_failed26
	leaq	.Lstr.200(%rip), %rsi
	movl	$2147483647, %ecx               # imm = 0x7FFFFFFF
	xorl	%edi, %edi
	movq	%rbp, %rdx
.LBB214_44:                             # %assert_failed23
	addq	$456, %rsp                      # imm = 0x1C8
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	halide_error_buffer_extents_too_large@PLT # TAILCALL
.LBB214_48:                             # %assert_failed27
	leaq	.Lstr.203(%rip), %rsi
	jmp	.LBB214_49
.LBB214_50:                             # %assert_failed28
	leaq	.Lstr.204(%rip), %rsi
.LBB214_49:                             # %assert_failed27
	xorl	%edi, %edi
	addq	$456, %rsp                      # imm = 0x1C8
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	halide_error_device_dirty_with_no_device_support@PLT # TAILCALL
.LBB214_51:                             # %assert_failed29
	leaq	.Lstr.203(%rip), %rsi
	jmp	.LBB214_52
.LBB214_53:                             # %assert_failed30
	leaq	.Lstr.204(%rip), %rsi
.LBB214_52:                             # %assert_failed29
	xorl	%edi, %edi
	addq	$456, %rsp                      # imm = 0x1C8
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	halide_error_host_is_null@PLT   # TAILCALL
.LBB214_24:                             # %assert_failed9
	leaq	.Lstr.203(%rip), %rsi
	xorl	%edi, %edi
	movl	176(%rsp), %edx                 # 4-byte Reload
	jmp	.LBB214_25
.LBB214_26:                             # %assert_failed10
	leaq	.Lstr.204(%rip), %rsi
	xorl	%edi, %edi
	movl	56(%rsp), %edx                  # 4-byte Reload
.LBB214_23:                             # %assert_failed
	movl	$67585, %ecx                    # imm = 0x10801
	addq	$456, %rsp                      # imm = 0x1C8
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	halide_error_bad_type@PLT       # TAILCALL
.LBB214_27:                             # %assert_failed11
	leaq	.Lstr.204(%rip), %rsi
	xorl	%edi, %edi
	movl	40(%rsp), %edx                  # 4-byte Reload
.LBB214_25:                             # %assert_failed9
	movl	$2, %ecx
	addq	$456, %rsp                      # imm = 0x1C8
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	halide_error_bad_dimensions@PLT # TAILCALL
.LBB214_28:                             # %assert_failed12
	decl	%r8d
	movl	28(%rsp), %ecx                  # 4-byte Reload
	decl	%ecx
	movl	%ecx, (%rsp)
	leaq	.Lstr.203(%rip), %rsi
	xorl	%edi, %edi
	xorl	%edx, %edx
	movl	168(%rsp), %ecx                 # 4-byte Reload
	movl	%ebx, %r9d
	callq	halide_error_access_out_of_bounds@PLT
	jmp	.LBB214_4
.LBB214_29:                             # %assert_failed13
	leaq	.Lstr.203(%rip), %rsi
	xorl	%edi, %edi
	xorl	%edx, %edx
	movl	%eax, %ecx
	jmp	.LBB214_30
.LBB214_31:                             # %assert_failed14
	movl	80(%rsp), %eax                  # 4-byte Reload
	movl	%eax, (%rsp)
	leaq	.Lstr.203(%rip), %rsi
	xorl	%edi, %edi
	movl	$1, %edx
	movl	32(%rsp), %r8d                  # 4-byte Reload
	movq	96(%rsp), %r9                   # 8-byte Reload
                                        # kill: def $r9d killed $r9d killed $r9
	callq	halide_error_access_out_of_bounds@PLT
	jmp	.LBB214_4
.LBB214_34:                             # %assert_failed15
	leaq	.Lstr.203(%rip), %rsi
	xorl	%edi, %edi
	movl	$1, %edx
	movl	%ebp, %ecx
.LBB214_30:                             # %assert_failed13
	addq	$456, %rsp                      # imm = 0x1C8
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	halide_error_buffer_extents_negative@PLT # TAILCALL
.LBB214_35:                             # %assert_failed16
	movq	104(%rsp), %rcx                 # 8-byte Reload
	addl	$-256, %ecx
	movl	240(%rsp), %r8d                 # 4-byte Reload
	decl	%r8d
	movl	%r8d, (%rsp)
	leaq	.Lstr.204(%rip), %rsi
	xorl	%edi, %edi
	xorl	%edx, %edx
                                        # kill: def $ecx killed $ecx killed $rcx
	movq	152(%rsp), %r9                  # 8-byte Reload
                                        # kill: def $r9d killed $r9d killed $r9
	callq	halide_error_access_out_of_bounds@PLT
	jmp	.LBB214_4
.LBB214_36:                             # %assert_failed17
	movq	160(%rsp), %rcx                 # 8-byte Reload
	addl	$-32, %ecx
	movl	232(%rsp), %r8d                 # 4-byte Reload
	decl	%r8d
	movl	%r8d, (%rsp)
	leaq	.Lstr.204(%rip), %rsi
	xorl	%edi, %edi
	movl	$1, %edx
                                        # kill: def $ecx killed $ecx killed $rcx
	movq	200(%rsp), %r9                  # 8-byte Reload
                                        # kill: def $r9d killed $r9d killed $r9
	callq	halide_error_access_out_of_bounds@PLT
	jmp	.LBB214_4
.LBB214_37:                             # %assert_failed18
	leaq	.Lstr.205(%rip), %rsi
	leaq	.Lstr.206(%rip), %rcx
	xorl	%edi, %edi
	movl	184(%rsp), %edx                 # 4-byte Reload
	jmp	.LBB214_38
.LBB214_39:                             # %assert_failed19
	leaq	.Lstr.207(%rip), %rsi
	leaq	.Lstr.206(%rip), %rcx
	xorl	%edi, %edi
	movl	136(%rsp), %edx                 # 4-byte Reload
.LBB214_38:                             # %assert_failed18
	movl	$1, %r8d
	addq	$456, %rsp                      # imm = 0x1C8
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	halide_error_constraint_violated@PLT # TAILCALL
.Lfunc_end214:
	.size	blur, .Lfunc_end214-blur
	.section	.rodata.blur,"a",@progbits
	.p2align	2
.LJTI214_0:
	.long	.LBB214_22-.LJTI214_0
	.long	.LBB214_24-.LJTI214_0
	.long	.LBB214_26-.LJTI214_0
	.long	.LBB214_27-.LJTI214_0
	.long	.LBB214_28-.LJTI214_0
	.long	.LBB214_29-.LJTI214_0
	.long	.LBB214_31-.LJTI214_0
	.long	.LBB214_34-.LJTI214_0
	.long	.LBB214_35-.LJTI214_0
	.long	.LBB214_36-.LJTI214_0
	.long	.LBB214_37-.LJTI214_0
	.long	.LBB214_39-.LJTI214_0
.LJTI214_1:
	.long	.LBB214_40-.LJTI214_1
	.long	.LBB214_42-.LJTI214_1
	.long	.LBB214_43-.LJTI214_1
	.long	.LBB214_45-.LJTI214_1
	.long	.LBB214_46-.LJTI214_1
	.long	.LBB214_47-.LJTI214_1
	.long	.LBB214_48-.LJTI214_1
	.long	.LBB214_50-.LJTI214_1
	.long	.LBB214_51-.LJTI214_1
	.long	.LBB214_53-.LJTI214_1
                                        # -- End function
	.section	.text.blur_argv,"ax",@progbits
	.globl	blur_argv                       # -- Begin function blur_argv
	.p2align	4, 0x90
	.type	blur_argv,@function
blur_argv:                              # @blur_argv
# %bb.0:                                # %entry
	movq	(%rdi), %rax
	movq	8(%rdi), %rsi
	movq	%rax, %rdi
	jmp	blur@PLT                        # TAILCALL
.Lfunc_end215:
	.size	blur_argv, .Lfunc_end215-blur_argv
                                        # -- End function
	.section	.text.blur_metadata,"ax",@progbits
	.globl	blur_metadata                   # -- Begin function blur_metadata
	.p2align	4, 0x90
	.type	blur_metadata,@function
blur_metadata:                          # @blur_metadata
# %bb.0:                                # %entry
	leaq	.Lblur_metadata_storage(%rip), %rax
	retq
.Lfunc_end216:
	.size	blur_metadata, .Lfunc_end216-blur_metadata
                                        # -- End function
	.type	_ZN6Halide7Runtime8Internal13custom_mallocE,@object # @_ZN6Halide7Runtime8Internal13custom_mallocE
	.data
	.weak	_ZN6Halide7Runtime8Internal13custom_mallocE
	.p2align	3
_ZN6Halide7Runtime8Internal13custom_mallocE:
	.quad	halide_default_malloc
	.size	_ZN6Halide7Runtime8Internal13custom_mallocE, 8

	.type	_ZN6Halide7Runtime8Internal11custom_freeE,@object # @_ZN6Halide7Runtime8Internal11custom_freeE
	.weak	_ZN6Halide7Runtime8Internal11custom_freeE
	.p2align	3
_ZN6Halide7Runtime8Internal11custom_freeE:
	.quad	halide_default_free
	.size	_ZN6Halide7Runtime8Internal11custom_freeE, 8

	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Error: "
	.size	.L.str, 8

	.type	_ZN6Halide7Runtime8Internal13error_handlerE,@object # @_ZN6Halide7Runtime8Internal13error_handlerE
	.data
	.weak	_ZN6Halide7Runtime8Internal13error_handlerE
	.p2align	3
_ZN6Halide7Runtime8Internal13error_handlerE:
	.quad	halide_default_error
	.size	_ZN6Halide7Runtime8Internal13error_handlerE, 8

	.type	_ZN6Halide7Runtime8Internal12custom_printE,@object # @_ZN6Halide7Runtime8Internal12custom_printE
	.weak	_ZN6Halide7Runtime8Internal12custom_printE
	.p2align	3
_ZN6Halide7Runtime8Internal12custom_printE:
	.quad	halide_default_print
	.size	_ZN6Halide7Runtime8Internal12custom_printE, 8

	.type	halide_reference_clock_inited,@object # @halide_reference_clock_inited
	.bss
	.weak	halide_reference_clock_inited
halide_reference_clock_inited:
	.byte	0                               # 0x0
	.size	halide_reference_clock_inited, 1

	.type	halide_reference_clock,@object  # @halide_reference_clock
	.weak	halide_reference_clock
	.p2align	3
halide_reference_clock:
	.zero	16
	.size	halide_reference_clock, 16

	.section	.fini_array,"aw",@fini_array
	.p2align	3
	.quad	halide_thread_pool_cleanup
	.quad	halide_trace_cleanup
	.quad	halide_cache_cleanup
	.quad	halide_profiler_shutdown
	.type	.L.str.5,@object                # @.str.5
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.5:
	.asciz	"/home/halidenightly/build_bot/worker/halide-release_14-x86-64-linux-cmake/halide-source/src/runtime/synchronization_common.h:386 halide_abort_if_false() failed: next != nullptr\n"
	.size	.L.str.5, 178

	.type	_ZN6Halide7Runtime8Internal15Synchronization5tableE,@object # @_ZN6Halide7Runtime8Internal15Synchronization5tableE
	.bss
	.weak	_ZN6Halide7Runtime8Internal15Synchronization5tableE
	.p2align	3
_ZN6Halide7Runtime8Internal15Synchronization5tableE:
	.zero	24576
	.size	_ZN6Halide7Runtime8Internal15Synchronization5tableE, 24576

	.type	.L.str.1,@object                # @.str.1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1:
	.asciz	"HL_NUM_THREADS"
	.size	.L.str.1, 15

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"HL_NUMTHREADS"
	.size	.L.str.2, 14

	.type	_ZN6Halide7Runtime8Internal10work_queueE,@object # @_ZN6Halide7Runtime8Internal10work_queueE
	.bss
	.weak	_ZN6Halide7Runtime8Internal10work_queueE
	.p2align	3
_ZN6Halide7Runtime8Internal10work_queueE:
	.zero	8
	.long	0                               # 0x0
	.long	0                               # 0x0
	.quad	0
	.long	0                               # 0x0
	.long	0                               # 0x0
	.long	0                               # 0x0
	.zero	4
	.zero	8
	.zero	8
	.zero	8
	.long	0                               # 0x0
	.long	0                               # 0x0
	.zero	2048
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	2
	.long	0                               # 0x0
	.size	_ZN6Halide7Runtime8Internal10work_queueE, 2128

	.type	.L.str.3,@object                # @.str.3
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.3:
	.asciz	"/home/halidenightly/build_bot/worker/halide-release_14-x86-64-linux-cmake/halide-source/src/runtime/thread_pool_common.h:527 halide_abort_if_false() failed: (min_threads <= ((task_parent->task.min_threads * task_parent->active_workers) - task_parent->threads_reserved)) && \"Logic error: thread over commit.\\n\"\n"
	.size	.L.str.3, 311

	.type	_ZN6Halide7Runtime8Internal14custom_do_taskE,@object # @_ZN6Halide7Runtime8Internal14custom_do_taskE
	.data
	.weak	_ZN6Halide7Runtime8Internal14custom_do_taskE
	.p2align	3
_ZN6Halide7Runtime8Internal14custom_do_taskE:
	.quad	halide_default_do_task
	.size	_ZN6Halide7Runtime8Internal14custom_do_taskE, 8

	.type	_ZN6Halide7Runtime8Internal19custom_do_loop_taskE,@object # @_ZN6Halide7Runtime8Internal19custom_do_loop_taskE
	.weak	_ZN6Halide7Runtime8Internal19custom_do_loop_taskE
	.p2align	3
_ZN6Halide7Runtime8Internal19custom_do_loop_taskE:
	.quad	halide_default_do_loop_task
	.size	_ZN6Halide7Runtime8Internal19custom_do_loop_taskE, 8

	.type	_ZN6Halide7Runtime8Internal17custom_do_par_forE,@object # @_ZN6Halide7Runtime8Internal17custom_do_par_forE
	.weak	_ZN6Halide7Runtime8Internal17custom_do_par_forE
	.p2align	3
_ZN6Halide7Runtime8Internal17custom_do_par_forE:
	.quad	halide_default_do_par_for
	.size	_ZN6Halide7Runtime8Internal17custom_do_par_forE, 8

	.type	_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE,@object # @_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE
	.weak	_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE
	.p2align	3
_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE:
	.quad	halide_default_do_parallel_tasks
	.size	_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE, 8

	.type	_ZN6Halide7Runtime8Internal21custom_semaphore_initE,@object # @_ZN6Halide7Runtime8Internal21custom_semaphore_initE
	.weak	_ZN6Halide7Runtime8Internal21custom_semaphore_initE
	.p2align	3
_ZN6Halide7Runtime8Internal21custom_semaphore_initE:
	.quad	halide_default_semaphore_init
	.size	_ZN6Halide7Runtime8Internal21custom_semaphore_initE, 8

	.type	_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE,@object # @_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE
	.weak	_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE
	.p2align	3
_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE:
	.quad	halide_default_semaphore_try_acquire
	.size	_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE, 8

	.type	_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE,@object # @_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE
	.weak	_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE
	.p2align	3
_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE:
	.quad	halide_default_semaphore_release
	.size	_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE, 8

	.type	.L.str.4,@object                # @.str.4
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.4:
	.asciz	"halide_set_num_threads: must be >= 0."
	.size	.L.str.4, 38

	.type	_ZTVN6Halide7Runtime8Internal15Synchronization21mutex_parking_controlE,@object # @_ZTVN6Halide7Runtime8Internal15Synchronization21mutex_parking_controlE
	.section	.data.rel.ro._ZTVN6Halide7Runtime8Internal15Synchronization21mutex_parking_controlE,"aGw",@progbits,_ZTVN6Halide7Runtime8Internal15Synchronization21mutex_parking_controlE,comdat
	.weak	_ZTVN6Halide7Runtime8Internal15Synchronization21mutex_parking_controlE
	.p2align	3
_ZTVN6Halide7Runtime8Internal15Synchronization21mutex_parking_controlE:
	.quad	0
	.quad	0
	.quad	_ZN6Halide7Runtime8Internal15Synchronization21mutex_parking_control8validateERNS2_15validate_actionE
	.quad	_ZN6Halide7Runtime8Internal15Synchronization15parking_control12before_sleepEv
	.quad	_ZN6Halide7Runtime8Internal15Synchronization21mutex_parking_control6unparkEib
	.quad	_ZN6Halide7Runtime8Internal15Synchronization15parking_control16requeue_callbackERKNS2_15validate_actionEbb
	.size	_ZTVN6Halide7Runtime8Internal15Synchronization21mutex_parking_controlE, 48

	.type	_ZTVN6Halide7Runtime8Internal15Synchronization25broadcast_parking_controlE,@object # @_ZTVN6Halide7Runtime8Internal15Synchronization25broadcast_parking_controlE
	.section	.data.rel.ro._ZTVN6Halide7Runtime8Internal15Synchronization25broadcast_parking_controlE,"aGw",@progbits,_ZTVN6Halide7Runtime8Internal15Synchronization25broadcast_parking_controlE,comdat
	.weak	_ZTVN6Halide7Runtime8Internal15Synchronization25broadcast_parking_controlE
	.p2align	3
_ZTVN6Halide7Runtime8Internal15Synchronization25broadcast_parking_controlE:
	.quad	0
	.quad	0
	.quad	_ZN6Halide7Runtime8Internal15Synchronization25broadcast_parking_control8validateERNS2_15validate_actionE
	.quad	_ZN6Halide7Runtime8Internal15Synchronization15parking_control12before_sleepEv
	.quad	_ZN6Halide7Runtime8Internal15Synchronization15parking_control6unparkEib
	.quad	_ZN6Halide7Runtime8Internal15Synchronization25broadcast_parking_control16requeue_callbackERKNS2_15validate_actionEbb
	.size	_ZTVN6Halide7Runtime8Internal15Synchronization25broadcast_parking_controlE, 48

	.type	_ZTVN6Halide7Runtime8Internal15Synchronization22signal_parking_controlE,@object # @_ZTVN6Halide7Runtime8Internal15Synchronization22signal_parking_controlE
	.section	.data.rel.ro._ZTVN6Halide7Runtime8Internal15Synchronization22signal_parking_controlE,"aGw",@progbits,_ZTVN6Halide7Runtime8Internal15Synchronization22signal_parking_controlE,comdat
	.weak	_ZTVN6Halide7Runtime8Internal15Synchronization22signal_parking_controlE
	.p2align	3
_ZTVN6Halide7Runtime8Internal15Synchronization22signal_parking_controlE:
	.quad	0
	.quad	0
	.quad	_ZN6Halide7Runtime8Internal15Synchronization15parking_control8validateERNS2_15validate_actionE
	.quad	_ZN6Halide7Runtime8Internal15Synchronization15parking_control12before_sleepEv
	.quad	_ZN6Halide7Runtime8Internal15Synchronization22signal_parking_control6unparkEib
	.quad	_ZN6Halide7Runtime8Internal15Synchronization15parking_control16requeue_callbackERKNS2_15validate_actionEbb
	.size	_ZTVN6Halide7Runtime8Internal15Synchronization22signal_parking_controlE, 48

	.type	.L.str.5.6,@object              # @.str.5.6
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.5.6:
	.asciz	"/home/halidenightly/build_bot/worker/halide-release_14-x86-64-linux-cmake/halide-source/src/runtime/synchronization_common.h:994 halide_abort_if_false() failed: val & 0x1\n"
	.size	.L.str.5.6, 172

	.type	_ZTVN6Halide7Runtime8Internal15Synchronization20wait_parking_controlE,@object # @_ZTVN6Halide7Runtime8Internal15Synchronization20wait_parking_controlE
	.section	.data.rel.ro._ZTVN6Halide7Runtime8Internal15Synchronization20wait_parking_controlE,"aGw",@progbits,_ZTVN6Halide7Runtime8Internal15Synchronization20wait_parking_controlE,comdat
	.weak	_ZTVN6Halide7Runtime8Internal15Synchronization20wait_parking_controlE
	.p2align	3
_ZTVN6Halide7Runtime8Internal15Synchronization20wait_parking_controlE:
	.quad	0
	.quad	0
	.quad	_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control8validateERNS2_15validate_actionE
	.quad	_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control12before_sleepEv
	.quad	_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control6unparkEib
	.quad	_ZN6Halide7Runtime8Internal15Synchronization15parking_control16requeue_callbackERKNS2_15validate_actionEbb
	.size	_ZTVN6Halide7Runtime8Internal15Synchronization20wait_parking_controlE, 48

	.type	.L.str.6,@object                # @.str.6
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.6:
	.asciz	"/home/halidenightly/build_bot/worker/halide-release_14-x86-64-linux-cmake/halide-source/src/runtime/thread_pool_common.h:155 halide_abort_if_false() failed: bytes == limit && \"Logic error in thread pool work queue initialization.\\n\"\n"
	.size	.L.str.6, 234

	.type	_ZN6Halide7Runtime8Internal17custom_get_symbolE,@object # @_ZN6Halide7Runtime8Internal17custom_get_symbolE
	.data
	.weak	_ZN6Halide7Runtime8Internal17custom_get_symbolE
	.p2align	3
_ZN6Halide7Runtime8Internal17custom_get_symbolE:
	.quad	halide_default_get_symbol
	.size	_ZN6Halide7Runtime8Internal17custom_get_symbolE, 8

	.type	_ZN6Halide7Runtime8Internal19custom_load_libraryE,@object # @_ZN6Halide7Runtime8Internal19custom_load_libraryE
	.weak	_ZN6Halide7Runtime8Internal19custom_load_libraryE
	.p2align	3
_ZN6Halide7Runtime8Internal19custom_load_libraryE:
	.quad	halide_default_load_library
	.size	_ZN6Halide7Runtime8Internal19custom_load_libraryE, 8

	.type	_ZN6Halide7Runtime8Internal25custom_get_library_symbolE,@object # @_ZN6Halide7Runtime8Internal25custom_get_library_symbolE
	.weak	_ZN6Halide7Runtime8Internal25custom_get_library_symbolE
	.p2align	3
_ZN6Halide7Runtime8Internal25custom_get_library_symbolE:
	.quad	halide_default_get_library_symbol
	.size	_ZN6Halide7Runtime8Internal25custom_get_library_symbolE, 8

	.type	_ZN6Halide7Runtime8Internal17halide_gpu_deviceE,@object # @_ZN6Halide7Runtime8Internal17halide_gpu_deviceE
	.bss
	.weak	_ZN6Halide7Runtime8Internal17halide_gpu_deviceE
	.p2align	2
_ZN6Halide7Runtime8Internal17halide_gpu_deviceE:
	.long	0                               # 0x0
	.size	_ZN6Halide7Runtime8Internal17halide_gpu_deviceE, 4

	.type	_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE,@object # @_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE
	.weak	_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE
_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE:
	.byte	0                               # 0x0
	.size	_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE, 1

	.type	_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE,@object # @_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE
	.weak	_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE
_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE:
	.byte	0                               # 0x0
	.size	_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE, 1

	.type	.L.str.8,@object                # @.str.8
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.8:
	.asciz	"HL_GPU_DEVICE"
	.size	.L.str.8, 14

	.type	_ZN6Halide7Runtime8Internal19halide_trace_bufferE,@object # @_ZN6Halide7Runtime8Internal19halide_trace_bufferE
	.bss
	.weak	_ZN6Halide7Runtime8Internal19halide_trace_bufferE
	.p2align	3
_ZN6Halide7Runtime8Internal19halide_trace_bufferE:
	.quad	0
	.size	_ZN6Halide7Runtime8Internal19halide_trace_bufferE, 8

	.type	_ZN6Halide7Runtime8Internal17halide_trace_fileE,@object # @_ZN6Halide7Runtime8Internal17halide_trace_fileE
	.data
	.weak	_ZN6Halide7Runtime8Internal17halide_trace_fileE
	.p2align	2
_ZN6Halide7Runtime8Internal17halide_trace_fileE:
	.long	4294967295                      # 0xffffffff
	.size	_ZN6Halide7Runtime8Internal17halide_trace_fileE, 4

	.type	_ZN6Halide7Runtime8Internal22halide_trace_file_lockE,@object # @_ZN6Halide7Runtime8Internal22halide_trace_file_lockE
	.bss
	.weak	_ZN6Halide7Runtime8Internal22halide_trace_file_lockE
_ZN6Halide7Runtime8Internal22halide_trace_file_lockE:
	.byte	0                               # 0x0
	.size	_ZN6Halide7Runtime8Internal22halide_trace_file_lockE, 1

	.type	_ZN6Halide7Runtime8Internal29halide_trace_file_initializedE,@object # @_ZN6Halide7Runtime8Internal29halide_trace_file_initializedE
	.weak	_ZN6Halide7Runtime8Internal29halide_trace_file_initializedE
_ZN6Halide7Runtime8Internal29halide_trace_file_initializedE:
	.byte	0                               # 0x0
	.size	_ZN6Halide7Runtime8Internal29halide_trace_file_initializedE, 1

	.type	_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE,@object # @_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE
	.weak	_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE
	.p2align	3
_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE:
	.quad	0
	.size	_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE, 8

	.type	_ZZ20halide_default_traceE3ids,@object # @_ZZ20halide_default_traceE3ids
	.data
	.p2align	2
_ZZ20halide_default_traceE3ids:
	.long	1                               # 0x1
	.size	_ZZ20halide_default_traceE3ids, 4

	.type	.L.str.1.10,@object             # @.str.1.10
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1.10:
	.zero	1
	.size	.L.str.1.10, 1

	.type	.L.str.2.11,@object             # @.str.2.11
.L.str.2.11:
	.asciz	"/home/halidenightly/build_bot/worker/halide-release_14-x86-64-linux-cmake/halide-source/src/runtime/tracing.cpp:218 halide_abort_if_false() failed: print_bits <= 64 && \"Tracing bad type\"\n"
	.size	.L.str.2.11, 188

	.type	.L.str.3.12,@object             # @.str.3.12
.L.str.3.12:
	.asciz	"Load"
	.size	.L.str.3.12, 5

	.type	.L.str.4.13,@object             # @.str.4.13
.L.str.4.13:
	.asciz	"Store"
	.size	.L.str.4.13, 6

	.type	.L.str.5.14,@object             # @.str.5.14
.L.str.5.14:
	.asciz	"Begin realization"
	.size	.L.str.5.14, 18

	.type	.L.str.6.15,@object             # @.str.6.15
.L.str.6.15:
	.asciz	"End realization"
	.size	.L.str.6.15, 16

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"Produce"
	.size	.L.str.7, 8

	.type	.L.str.8.16,@object             # @.str.8.16
.L.str.8.16:
	.asciz	"End produce"
	.size	.L.str.8.16, 12

	.type	.L.str.9.17,@object             # @.str.9.17
.L.str.9.17:
	.asciz	"Consume"
	.size	.L.str.9.17, 8

	.type	.L.str.10,@object               # @.str.10
.L.str.10:
	.asciz	"End consume"
	.size	.L.str.10, 12

	.type	.L.str.11,@object               # @.str.11
.L.str.11:
	.asciz	"Begin pipeline"
	.size	.L.str.11, 15

	.type	.L.str.12,@object               # @.str.12
.L.str.12:
	.asciz	"End pipeline"
	.size	.L.str.12, 13

	.type	.L.str.13,@object               # @.str.13
.L.str.13:
	.asciz	"Tag"
	.size	.L.str.13, 4

	.type	.Lreltable.halide_default_trace,@object # @reltable.halide_default_trace
	.section	.rodata,"a",@progbits
	.p2align	2
.Lreltable.halide_default_trace:
	.long	.L.str.3.12-.Lreltable.halide_default_trace
	.long	.L.str.4.13-.Lreltable.halide_default_trace
	.long	.L.str.5.14-.Lreltable.halide_default_trace
	.long	.L.str.6.15-.Lreltable.halide_default_trace
	.long	.L.str.7-.Lreltable.halide_default_trace
	.long	.L.str.8.16-.Lreltable.halide_default_trace
	.long	.L.str.9.17-.Lreltable.halide_default_trace
	.long	.L.str.10-.Lreltable.halide_default_trace
	.long	.L.str.11-.Lreltable.halide_default_trace
	.long	.L.str.12-.Lreltable.halide_default_trace
	.long	.L.str.13-.Lreltable.halide_default_trace
	.size	.Lreltable.halide_default_trace, 44

	.type	.L.str.17,@object               # @.str.17
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.17:
	.asciz	"<"
	.size	.L.str.17, 2

	.type	.L.str.18,@object               # @.str.18
.L.str.18:
	.asciz	">, <"
	.size	.L.str.18, 5

	.type	.L.str.20,@object               # @.str.20
.L.str.20:
	.asciz	">)"
	.size	.L.str.20, 3

	.type	.L.str.22,@object               # @.str.22
.L.str.22:
	.asciz	" = <"
	.size	.L.str.22, 5

	.type	.L.str.23,@object               # @.str.23
.L.str.23:
	.asciz	" = "
	.size	.L.str.23, 4

	.type	.L.str.24,@object               # @.str.24
.L.str.24:
	.asciz	"/home/halidenightly/build_bot/worker/halide-release_14-x86-64-linux-cmake/halide-source/src/runtime/tracing.cpp:287 halide_abort_if_false() failed: print_bits >= 16 && \"Tracing a bad type\"\n"
	.size	.L.str.24, 190

	.type	.L.str.25,@object               # @.str.25
.L.str.25:
	.asciz	">"
	.size	.L.str.25, 2

	.type	.L.str.26,@object               # @.str.26
.L.str.26:
	.asciz	" tag = \""
	.size	.L.str.26, 9

	.type	.L.str.27,@object               # @.str.27
.L.str.27:
	.asciz	"\""
	.size	.L.str.27, 2

	.type	_ZN6Halide7Runtime8Internal19halide_custom_traceE,@object # @_ZN6Halide7Runtime8Internal19halide_custom_traceE
	.data
	.weak	_ZN6Halide7Runtime8Internal19halide_custom_traceE
	.p2align	3
_ZN6Halide7Runtime8Internal19halide_custom_traceE:
	.quad	halide_default_trace
	.size	_ZN6Halide7Runtime8Internal19halide_custom_traceE, 8

	.type	.L.str.28,@object               # @.str.28
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.28:
	.asciz	"HL_TRACE_FILE"
	.size	.L.str.28, 14

	.type	.L.str.29,@object               # @.str.29
.L.str.29:
	.asciz	"ab"
	.size	.L.str.29, 3

	.type	.L.str.30,@object               # @.str.30
.L.str.30:
	.asciz	"/home/halidenightly/build_bot/worker/halide-release_14-x86-64-linux-cmake/halide-source/src/runtime/tracing.cpp:351 halide_abort_if_false() failed: file && \"Failed to open trace file\\n\"\n"
	.size	.L.str.30, 187

	.type	.L.str.31,@object               # @.str.31
.L.str.31:
	.asciz	"/home/halidenightly/build_bot/worker/halide-release_14-x86-64-linux-cmake/halide-source/src/runtime/tracing.cpp:87 halide_abort_if_false() failed: size <= buffer_size\n"
	.size	.L.str.31, 168

	.type	.L.str.32,@object               # @.str.32
.L.str.32:
	.asciz	"/home/halidenightly/build_bot/worker/halide-release_14-x86-64-linux-cmake/halide-source/src/runtime/tracing.cpp:115 halide_abort_if_false() failed: success && \"Could not write to trace file\"\n"
	.size	.L.str.32, 192

	.type	_ZN6Halide7Runtime8Internal30pixel_type_to_tiff_sample_typeE,@object # @_ZN6Halide7Runtime8Internal30pixel_type_to_tiff_sample_typeE
	.data
	.weak	_ZN6Halide7Runtime8Internal30pixel_type_to_tiff_sample_typeE
	.p2align	1
_ZN6Halide7Runtime8Internal30pixel_type_to_tiff_sample_typeE:
	.short	3                               # 0x3
	.short	3                               # 0x3
	.short	1                               # 0x1
	.short	2                               # 0x2
	.short	1                               # 0x1
	.short	2                               # 0x2
	.short	1                               # 0x1
	.short	2                               # 0x2
	.short	1                               # 0x1
	.short	2                               # 0x2
	.size	_ZN6Halide7Runtime8Internal30pixel_type_to_tiff_sample_typeE, 20

	.type	_ZN6Halide7Runtime8Internal31pixel_type_to_matlab_class_codeE,@object # @_ZN6Halide7Runtime8Internal31pixel_type_to_matlab_class_codeE
	.weak	_ZN6Halide7Runtime8Internal31pixel_type_to_matlab_class_codeE
_ZN6Halide7Runtime8Internal31pixel_type_to_matlab_class_codeE:
	.ascii	"\007\006\t\b\013\n\r\f\017\016"
	.size	_ZN6Halide7Runtime8Internal31pixel_type_to_matlab_class_codeE, 10

	.type	_ZN6Halide7Runtime8Internal30pixel_type_to_matlab_type_codeE,@object # @_ZN6Halide7Runtime8Internal30pixel_type_to_matlab_type_codeE
	.weak	_ZN6Halide7Runtime8Internal30pixel_type_to_matlab_type_codeE
_ZN6Halide7Runtime8Internal30pixel_type_to_matlab_type_codeE:
	.ascii	"\007\t\002\001\004\003\006\005\r\f"
	.size	_ZN6Halide7Runtime8Internal30pixel_type_to_matlab_type_codeE, 10

	.type	.L.str.34,@object               # @.str.34
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.34:
	.asciz	"Bounds query buffer passed to halide_debug_to_file"
	.size	.L.str.34, 51

	.type	.L.str.1.35,@object             # @.str.1.35
.L.str.1.35:
	.asciz	"Can't debug_to_file a Func with more than four dimensions\n"
	.size	.L.str.1.35, 59

	.type	.L.str.2.36,@object             # @.str.2.36
.L.str.2.36:
	.asciz	"wb"
	.size	.L.str.2.36, 3

	.type	.L.str.3.37,@object             # @.str.3.37
.L.str.3.37:
	.asciz	".tiff"
	.size	.L.str.3.37, 6

	.type	.L.str.4.38,@object             # @.str.4.38
.L.str.4.38:
	.asciz	".tif"
	.size	.L.str.4.38, 5

	.type	.L.str.5.39,@object             # @.str.5.39
.L.str.5.39:
	.asciz	".mat"
	.size	.L.str.5.39, 5

	.type	.L__const.halide_debug_to_file.header,@object # @__const.halide_debug_to_file.header
	.section	.rodata,"a",@progbits
.L__const.halide_debug_to_file.header:
	.asciz	"MATLAB 5.0 MAT-file, produced by Halide                                                                                     \000\001IM"
	.size	.L__const.halide_debug_to_file.header, 129

	.type	.L.str.6.40,@object             # @.str.6.40
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.6.40:
	.asciz	"Can't debug_to_file to a .mat file greater than 4GB\n"
	.size	.L.str.6.40, 53

	.type	_ZN6Halide7Runtime8Internal16memoization_lockE,@object # @_ZN6Halide7Runtime8Internal16memoization_lockE
	.bss
	.weak	_ZN6Halide7Runtime8Internal16memoization_lockE
	.p2align	3
_ZN6Halide7Runtime8Internal16memoization_lockE:
	.zero	8
	.size	_ZN6Halide7Runtime8Internal16memoization_lockE, 8

	.type	_ZN6Halide7Runtime8Internal13cache_entriesE,@object # @_ZN6Halide7Runtime8Internal13cache_entriesE
	.weak	_ZN6Halide7Runtime8Internal13cache_entriesE
	.p2align	3
_ZN6Halide7Runtime8Internal13cache_entriesE:
	.zero	2048
	.size	_ZN6Halide7Runtime8Internal13cache_entriesE, 2048

	.type	_ZN6Halide7Runtime8Internal18most_recently_usedE,@object # @_ZN6Halide7Runtime8Internal18most_recently_usedE
	.weak	_ZN6Halide7Runtime8Internal18most_recently_usedE
	.p2align	3
_ZN6Halide7Runtime8Internal18most_recently_usedE:
	.quad	0
	.size	_ZN6Halide7Runtime8Internal18most_recently_usedE, 8

	.type	_ZN6Halide7Runtime8Internal19least_recently_usedE,@object # @_ZN6Halide7Runtime8Internal19least_recently_usedE
	.weak	_ZN6Halide7Runtime8Internal19least_recently_usedE
	.p2align	3
_ZN6Halide7Runtime8Internal19least_recently_usedE:
	.quad	0
	.size	_ZN6Halide7Runtime8Internal19least_recently_usedE, 8

	.type	_ZN6Halide7Runtime8Internal14max_cache_sizeE,@object # @_ZN6Halide7Runtime8Internal14max_cache_sizeE
	.data
	.weak	_ZN6Halide7Runtime8Internal14max_cache_sizeE
	.p2align	3
_ZN6Halide7Runtime8Internal14max_cache_sizeE:
	.quad	1048576                         # 0x100000
	.size	_ZN6Halide7Runtime8Internal14max_cache_sizeE, 8

	.type	_ZN6Halide7Runtime8Internal18current_cache_sizeE,@object # @_ZN6Halide7Runtime8Internal18current_cache_sizeE
	.bss
	.weak	_ZN6Halide7Runtime8Internal18current_cache_sizeE
	.p2align	3
_ZN6Halide7Runtime8Internal18current_cache_sizeE:
	.quad	0                               # 0x0
	.size	_ZN6Halide7Runtime8Internal18current_cache_sizeE, 8

	.type	.L.str.2.42,@object             # @.str.2.42
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.2.42:
	.asciz	"/home/halidenightly/build_bot/worker/halide-release_14-x86-64-linux-cmake/halide-source/src/runtime/cache.cpp:284 halide_abort_if_false() failed: prev_hash_entry != nullptr\n"
	.size	.L.str.2.42, 174

	.type	.L.str.3.43,@object             # @.str.3.43
.L.str.3.43:
	.asciz	"/home/halidenightly/build_bot/worker/halide-release_14-x86-64-linux-cmake/halide-source/src/runtime/cache.cpp:373 halide_abort_if_false() failed: entry->more_recent != nullptr\n"
	.size	.L.str.3.43, 177

	.type	.L.str.4.44,@object             # @.str.4.44
.L.str.4.44:
	.asciz	"/home/halidenightly/build_bot/worker/halide-release_14-x86-64-linux-cmake/halide-source/src/runtime/cache.cpp:377 halide_abort_if_false() failed: least_recently_used == entry\n"
	.size	.L.str.4.44, 176

	.type	.L.str.5.45,@object             # @.str.5.45
.L.str.5.45:
	.asciz	"/home/halidenightly/build_bot/worker/halide-release_14-x86-64-linux-cmake/halide-source/src/runtime/cache.cpp:380 halide_abort_if_false() failed: entry->more_recent != nullptr\n"
	.size	.L.str.5.45, 177

	.type	.L.str.9.46,@object             # @.str.9.46
.L.str.9.46:
	.asciz	"/home/halidenightly/build_bot/worker/halide-release_14-x86-64-linux-cmake/halide-source/src/runtime/cache.cpp:472 halide_abort_if_false() failed: no_host_pointers_equal\n"
	.size	.L.str.9.46, 170

	.type	.L.str.12.47,@object            # @.str.12.47
.L.str.12.47:
	.asciz	"/home/halidenightly/build_bot/worker/halide-release_14-x86-64-linux-cmake/halide-source/src/runtime/cache.cpp:550 halide_abort_if_false() failed: entry->in_use_count > 0\n"
	.size	.L.str.12.47, 171

	.type	.L.str.50,@object               # @.str.50
.L.str.50:
	.asciz	"<nullptr>"
	.size	.L.str.50, 10

	.type	.L.str.1.57,@object             # @.str.1.57
.L.str.1.57:
	.asciz	"-nan"
	.size	.L.str.1.57, 5

	.type	.L.str.2.58,@object             # @.str.2.58
.L.str.2.58:
	.asciz	"nan"
	.size	.L.str.2.58, 4

	.type	.L.str.3.59,@object             # @.str.3.59
.L.str.3.59:
	.asciz	"-inf"
	.size	.L.str.3.59, 5

	.type	.L.str.4.60,@object             # @.str.4.60
.L.str.4.60:
	.asciz	"inf"
	.size	.L.str.4.60, 4

	.type	.L.str.5.61,@object             # @.str.5.61
.L.str.5.61:
	.asciz	"-0.000000e+00"
	.size	.L.str.5.61, 14

	.type	.L.str.6.62,@object             # @.str.6.62
.L.str.6.62:
	.asciz	"0.000000e+00"
	.size	.L.str.6.62, 13

	.type	.L.str.7.63,@object             # @.str.7.63
.L.str.7.63:
	.asciz	"-0.000000"
	.size	.L.str.7.63, 10

	.type	.L.str.8.64,@object             # @.str.8.64
.L.str.8.64:
	.asciz	"0.000000"
	.size	.L.str.8.64, 9

	.type	.L.str.9.65,@object             # @.str.9.65
.L.str.9.65:
	.asciz	"-"
	.size	.L.str.9.65, 2

	.type	.L.str.11.67,@object            # @.str.11.67
.L.str.11.67:
	.asciz	"e+"
	.size	.L.str.11.67, 3

	.type	.L.str.12.68,@object            # @.str.12.68
.L.str.12.68:
	.asciz	"e-"
	.size	.L.str.12.68, 3

	.type	.L.str.13.71,@object            # @.str.13.71
.L.str.13.71:
	.asciz	"0123456789abcdef"
	.size	.L.str.13.71, 17

	.type	.L.str.14.76,@object            # @.str.14.76
.L.str.14.76:
	.asciz	"int"
	.size	.L.str.14.76, 4

	.type	.L.str.15.75,@object            # @.str.15.75
.L.str.15.75:
	.asciz	"uint"
	.size	.L.str.15.75, 5

	.type	.L.str.16.74,@object            # @.str.16.74
.L.str.16.74:
	.asciz	"float"
	.size	.L.str.16.74, 6

	.type	.L.str.17.73,@object            # @.str.17.73
.L.str.17.73:
	.asciz	"handle"
	.size	.L.str.17.73, 7

	.type	.L.str.18.72,@object            # @.str.18.72
.L.str.18.72:
	.asciz	"bad_type_code"
	.size	.L.str.18.72, 14

	.type	.L.str.19.77,@object            # @.str.19.77
.L.str.19.77:
	.asciz	"x"
	.size	.L.str.19.77, 2

	.type	.L.str.20.78,@object            # @.str.20.78
.L.str.20.78:
	.asciz	"nullptr"
	.size	.L.str.20.78, 8

	.type	.L.str.21.79,@object            # @.str.21.79
.L.str.21.79:
	.asciz	"buffer("
	.size	.L.str.21.79, 8

	.type	.L.str.23.82,@object            # @.str.23.82
.L.str.23.82:
	.asciz	", {"
	.size	.L.str.23.82, 4

	.type	.L.str.24.83,@object            # @.str.24.83
.L.str.24.83:
	.asciz	"}"
	.size	.L.str.24.83, 2

	.type	_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE,@object # @_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE
	.data
	.weak	_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE
_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE:
	.byte	1                               # 0x1
	.size	_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE, 1

	.type	_ZN6Halide7Runtime8Internal21allocation_pools_lockE,@object # @_ZN6Halide7Runtime8Internal21allocation_pools_lockE
	.bss
	.weak	_ZN6Halide7Runtime8Internal21allocation_pools_lockE
	.p2align	3
_ZN6Halide7Runtime8Internal21allocation_pools_lockE:
	.zero	8
	.size	_ZN6Halide7Runtime8Internal21allocation_pools_lockE, 8

	.type	_ZN6Halide7Runtime8Internal23device_allocation_poolsE,@object # @_ZN6Halide7Runtime8Internal23device_allocation_poolsE
	.weak	_ZN6Halide7Runtime8Internal23device_allocation_poolsE
	.p2align	3
_ZN6Halide7Runtime8Internal23device_allocation_poolsE:
	.quad	0
	.size	_ZN6Halide7Runtime8Internal23device_allocation_poolsE, 8

	.type	_ZN6Halide7Runtime8Internal17device_copy_mutexE,@object # @_ZN6Halide7Runtime8Internal17device_copy_mutexE
	.weak	_ZN6Halide7Runtime8Internal17device_copy_mutexE
	.p2align	3
_ZN6Halide7Runtime8Internal17device_copy_mutexE:
	.zero	8
	.size	_ZN6Halide7Runtime8Internal17device_copy_mutexE, 8

	.type	.L.str.6.88,@object             # @.str.6.88
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.6.88:
	.asciz	"halide_copy_to_host"
	.size	.L.str.6.88, 20

	.type	.L.str.7.89,@object             # @.str.7.89
.L.str.7.89:
	.asciz	"halide_copy_to_device"
	.size	.L.str.7.89, 22

	.type	.L.str.9.90,@object             # @.str.9.90
.L.str.9.90:
	.asciz	"halide_copy_to_device does not support switching interfaces\n"
	.size	.L.str.9.90, 61

	.type	.L.str.16.93,@object            # @.str.16.93
.L.str.16.93:
	.asciz	"halide_device_sync"
	.size	.L.str.16.93, 19

	.type	.L.str.17.91,@object            # @.str.17.91
.L.str.17.91:
	.asciz	"halide_device_malloc"
	.size	.L.str.17.91, 21

	.type	.L.str.20.92,@object            # @.str.20.92
.L.str.20.92:
	.asciz	"halide_device_malloc doesn't support switching interfaces\n"
	.size	.L.str.20.92, 59

	.type	.L.str.21.96,@object            # @.str.21.96
.L.str.21.96:
	.asciz	"halide_device_free"
	.size	.L.str.21.96, 19

	.type	.L.str.22.97,@object            # @.str.22.97
.L.str.22.97:
	.asciz	"/home/halidenightly/build_bot/worker/halide-release_14-x86-64-linux-cmake/halide-source/src/runtime/device_interface.cpp:252 halide_abort_if_false() failed: buf->device == 0\n"
	.size	.L.str.22.97, 175

	.type	.L.str.23.98,@object            # @.str.23.98
.L.str.23.98:
	.asciz	"halide_device_and_host_malloc"
	.size	.L.str.23.98, 30

	.type	.L.str.25.99,@object            # @.str.25.99
.L.str.25.99:
	.asciz	"halide_device_and_host_malloc doesn't support switching interfaces\n"
	.size	.L.str.25.99, 68

	.type	.L.str.26.100,@object           # @.str.26.100
.L.str.26.100:
	.asciz	"allocating host and device memory failed\n"
	.size	.L.str.26.100, 42

	.type	.L.str.27.101,@object           # @.str.27.101
.L.str.27.101:
	.asciz	"halide_device_and_host_free"
	.size	.L.str.27.101, 28

	.type	.L.str.28.102,@object           # @.str.28.102
.L.str.28.102:
	.asciz	"/home/halidenightly/build_bot/worker/halide-release_14-x86-64-linux-cmake/halide-source/src/runtime/device_interface.cpp:317 halide_abort_if_false() failed: buf->device == 0\n"
	.size	.L.str.28.102, 175

	.type	.L.str.29.103,@object           # @.str.29.103
.L.str.29.103:
	.asciz	"halide_default_device_and_host_malloc"
	.size	.L.str.29.103, 38

	.type	.L.str.30.104,@object           # @.str.30.104
.L.str.30.104:
	.asciz	"halide_default_device_and_host_free"
	.size	.L.str.30.104, 36

	.type	.L.str.31.105,@object           # @.str.31.105
.L.str.31.105:
	.asciz	"halide_device_wrap_native"
	.size	.L.str.31.105, 26

	.type	.L.str.32.106,@object           # @.str.32.106
.L.str.32.106:
	.asciz	"halide_device_wrap_native doesn't support switching interfaces\n"
	.size	.L.str.32.106, 64

	.type	.L.str.33.107,@object           # @.str.33.107
.L.str.33.107:
	.asciz	"halide_device_detach_native"
	.size	.L.str.33.107, 28

	.type	.L.str.34.108,@object           # @.str.34.108
.L.str.34.108:
	.asciz	"/home/halidenightly/build_bot/worker/halide-release_14-x86-64-linux-cmake/halide-source/src/runtime/device_interface.cpp:403 halide_abort_if_false() failed: buf->device == 0\n"
	.size	.L.str.34.108, 175

	.type	.L.str.35,@object               # @.str.35
.L.str.35:
	.asciz	"halide_default_device_detach_native"
	.size	.L.str.35, 36

	.type	.L.str.41,@object               # @.str.41
.L.str.41:
	.asciz	"halide_buffer_copy does not support switching device interfaces"
	.size	.L.str.41, 64

	.type	.L.str.58,@object               # @.str.58
.L.str.58:
	.asciz	"device_interface does not support cropping\n"
	.size	.L.str.58, 44

	.type	.L.str.59,@object               # @.str.59
.L.str.59:
	.asciz	"device_interface does not support slicing\n"
	.size	.L.str.59, 43

	.type	.L.str.60,@object               # @.str.60
.L.str.60:
	.asciz	"destination buffer already has a device allocation\n"
	.size	.L.str.60, 52

	.type	.L.str.61,@object               # @.str.61
.L.str.61:
	.asciz	"src and dst must have identical dimensionality\n"
	.size	.L.str.61, 48

	.type	.L.str.64,@object               # @.str.64
.L.str.64:
	.asciz	"dst must have exactly one fewer dimension than src\n"
	.size	.L.str.64, 52

	.type	.L.str.111,@object              # @.str.111
.L.str.111:
	.asciz	"Bounds inference call to external stage "
	.size	.L.str.111, 41

	.type	.L.str.1.112,@object            # @.str.1.112
.L.str.1.112:
	.asciz	" returned non-zero value: "
	.size	.L.str.1.112, 27

	.type	.L.str.2.113,@object            # @.str.2.113
.L.str.2.113:
	.asciz	"Call to external stage "
	.size	.L.str.2.113, 24

	.type	.L.str.3.114,@object            # @.str.3.114
.L.str.3.114:
	.asciz	"Bounds given for "
	.size	.L.str.3.114, 18

	.type	.L.str.4.115,@object            # @.str.4.115
.L.str.4.115:
	.asciz	" in "
	.size	.L.str.4.115, 5

	.type	.L.str.5.116,@object            # @.str.5.116
.L.str.5.116:
	.asciz	" (from "
	.size	.L.str.5.116, 8

	.type	.L.str.6.117,@object            # @.str.6.117
.L.str.6.117:
	.asciz	" to "
	.size	.L.str.6.117, 5

	.type	.L.str.7.118,@object            # @.str.7.118
.L.str.7.118:
	.asciz	") do not cover required region (from "
	.size	.L.str.7.118, 38

	.type	.L.str.8.119,@object            # @.str.8.119
.L.str.8.119:
	.asciz	")"
	.size	.L.str.8.119, 2

	.type	.L.str.9.120,@object            # @.str.9.120
.L.str.9.120:
	.asciz	" has type "
	.size	.L.str.9.120, 11

	.type	.L.str.10.121,@object           # @.str.10.121
.L.str.10.121:
	.asciz	" but type of the buffer passed in is "
	.size	.L.str.10.121, 38

	.type	.L.str.11.122,@object           # @.str.11.122
.L.str.11.122:
	.asciz	" requires a buffer of exactly "
	.size	.L.str.11.122, 31

	.type	.L.str.12.123,@object           # @.str.12.123
.L.str.12.123:
	.asciz	" dimensions, but the buffer passed in has "
	.size	.L.str.12.123, 43

	.type	.L.str.13.124,@object           # @.str.13.124
.L.str.13.124:
	.asciz	" dimensions"
	.size	.L.str.13.124, 12

	.type	.L.str.14.125,@object           # @.str.14.125
.L.str.14.125:
	.asciz	" is accessed at "
	.size	.L.str.14.125, 17

	.type	.L.str.15.126,@object           # @.str.15.126
.L.str.15.126:
	.asciz	", which is before the min ("
	.size	.L.str.15.126, 28

	.type	.L.str.16.127,@object           # @.str.16.127
.L.str.16.127:
	.asciz	") in dimension "
	.size	.L.str.16.127, 16

	.type	.L.str.17.128,@object           # @.str.17.128
.L.str.17.128:
	.asciz	", which is beyond the max ("
	.size	.L.str.17.128, 28

	.type	.L.str.18.129,@object           # @.str.18.129
.L.str.18.129:
	.asciz	"Total allocation for buffer "
	.size	.L.str.18.129, 29

	.type	.L.str.19.130,@object           # @.str.19.130
.L.str.19.130:
	.asciz	" is "
	.size	.L.str.19.130, 5

	.type	.L.str.20.131,@object           # @.str.20.131
.L.str.20.131:
	.asciz	", which exceeds the maximum size of "
	.size	.L.str.20.131, 37

	.type	.L.str.21.132,@object           # @.str.21.132
.L.str.21.132:
	.asciz	"The extents for buffer "
	.size	.L.str.21.132, 24

	.type	.L.str.22.133,@object           # @.str.22.133
.L.str.22.133:
	.asciz	" dimension "
	.size	.L.str.22.133, 12

	.type	.L.str.23.134,@object           # @.str.23.134
.L.str.23.134:
	.asciz	" is negative ("
	.size	.L.str.23.134, 15

	.type	.L.str.24.135,@object           # @.str.24.135
.L.str.24.135:
	.asciz	"Product of extents for buffer "
	.size	.L.str.24.135, 31

	.type	.L.str.25.136,@object           # @.str.25.136
.L.str.25.136:
	.asciz	"Applying the constraints on "
	.size	.L.str.25.136, 29

	.type	.L.str.26.137,@object           # @.str.26.137
.L.str.26.137:
	.asciz	" to the required region made it smaller in dimension "
	.size	.L.str.26.137, 54

	.type	.L.str.27.138,@object           # @.str.27.138
.L.str.27.138:
	.asciz	". "
	.size	.L.str.27.138, 3

	.type	.L.str.28.139,@object           # @.str.28.139
.L.str.28.139:
	.asciz	"Required size: "
	.size	.L.str.28.139, 16

	.type	.L.str.29.140,@object           # @.str.29.140
.L.str.29.140:
	.asciz	"Constrained size: "
	.size	.L.str.29.140, 19

	.type	.L.str.30.141,@object           # @.str.30.141
.L.str.30.141:
	.asciz	"."
	.size	.L.str.30.141, 2

	.type	.L.str.31.142,@object           # @.str.31.142
.L.str.31.142:
	.asciz	"Constraint violated: "
	.size	.L.str.31.142, 22

	.type	.L.str.32.143,@object           # @.str.32.143
.L.str.32.143:
	.asciz	" ("
	.size	.L.str.32.143, 3

	.type	.L.str.33.144,@object           # @.str.33.144
.L.str.33.144:
	.asciz	") == "
	.size	.L.str.33.144, 6

	.type	.L.str.34.145,@object           # @.str.34.145
.L.str.34.145:
	.asciz	"Parameter "
	.size	.L.str.34.145, 11

	.type	.L.str.35.146,@object           # @.str.35.146
.L.str.35.146:
	.asciz	" but must be at least "
	.size	.L.str.35.146, 23

	.type	.L.str.36,@object               # @.str.36
.L.str.36:
	.asciz	" but must be at most "
	.size	.L.str.36, 22

	.type	.L.str.37,@object               # @.str.37
.L.str.37:
	.asciz	"Out of memory (halide_malloc returned nullptr)"
	.size	.L.str.37, 47

	.type	.L.str.38,@object               # @.str.38
.L.str.38:
	.asciz	"Buffer argument "
	.size	.L.str.38, 17

	.type	.L.str.39,@object               # @.str.39
.L.str.39:
	.asciz	" is nullptr"
	.size	.L.str.39, 12

	.type	.L.str.40,@object               # @.str.40
.L.str.40:
	.asciz	"Failed to dump function "
	.size	.L.str.40, 25

	.type	.L.str.41.147,@object           # @.str.41.147
.L.str.41.147:
	.asciz	" to file "
	.size	.L.str.41.147, 10

	.type	.L.str.42,@object               # @.str.42
.L.str.42:
	.asciz	" with error "
	.size	.L.str.42, 13

	.type	.L.str.43,@object               # @.str.43
.L.str.43:
	.asciz	"The host pointer of "
	.size	.L.str.43, 21

	.type	.L.str.44,@object               # @.str.44
.L.str.44:
	.asciz	" is not aligned to a "
	.size	.L.str.44, 22

	.type	.L.str.45,@object               # @.str.45
.L.str.45:
	.asciz	" bytes boundary."
	.size	.L.str.45, 17

	.type	.L.str.46,@object               # @.str.46
.L.str.46:
	.asciz	"The buffer "
	.size	.L.str.46, 12

	.type	.L.str.47,@object               # @.str.47
.L.str.47:
	.asciz	" is dirty on device, but this pipeline was compiled "
	.size	.L.str.47, 53

	.type	.L.str.48,@object               # @.str.48
.L.str.48:
	.asciz	"with no support for device to host copies."
	.size	.L.str.48, 43

	.type	.L.str.49,@object               # @.str.49
.L.str.49:
	.asciz	" is null, but the pipeline will access it on the host."
	.size	.L.str.49, 55

	.type	.L.str.50.148,@object           # @.str.50.148
.L.str.50.148:
	.asciz	"The folded storage dimension "
	.size	.L.str.50.148, 30

	.type	.L.str.51,@object               # @.str.51
.L.str.51:
	.asciz	" of "
	.size	.L.str.51, 5

	.type	.L.str.52,@object               # @.str.52
.L.str.52:
	.asciz	" was accessed out of order by loop "
	.size	.L.str.52, 36

	.type	.L.str.53,@object               # @.str.53
.L.str.53:
	.asciz	"Cannot fold dimension "
	.size	.L.str.53, 23

	.type	.L.str.54,@object               # @.str.54
.L.str.54:
	.asciz	" because an extern stage accesses ["
	.size	.L.str.54, 36

	.type	.L.str.55,@object               # @.str.55
.L.str.55:
	.asciz	", "
	.size	.L.str.55, 3

	.type	.L.str.56,@object               # @.str.56
.L.str.56:
	.asciz	"],"
	.size	.L.str.56, 3

	.type	.L.str.57,@object               # @.str.57
.L.str.57:
	.asciz	" which is outside the range currently valid: ["
	.size	.L.str.57, 47

	.type	.L.str.58.149,@object           # @.str.58.149
.L.str.58.149:
	.asciz	"]."
	.size	.L.str.58.149, 3

	.type	.L.str.59.150,@object           # @.str.59.150
.L.str.59.150:
	.asciz	" which wraps around the boundary of the fold, "
	.size	.L.str.59.150, 47

	.type	.L.str.60.151,@object           # @.str.60.151
.L.str.60.151:
	.asciz	"which occurs at multiples of "
	.size	.L.str.60.151, 30

	.type	.L.str.61.152,@object           # @.str.61.152
.L.str.61.152:
	.asciz	"The fold factor ("
	.size	.L.str.61.152, 18

	.type	.L.str.62,@object               # @.str.62
.L.str.62:
	.asciz	") of dimension "
	.size	.L.str.62, 16

	.type	.L.str.63,@object               # @.str.63
.L.str.63:
	.asciz	" is too small to store the required region accessed by loop "
	.size	.L.str.63, 61

	.type	.L.str.64.153,@object           # @.str.64.153
.L.str.64.153:
	.asciz	")."
	.size	.L.str.64.153, 3

	.type	.L.str.65,@object               # @.str.65
.L.str.65:
	.asciz	"Requirement Failed: ("
	.size	.L.str.65, 22

	.type	.L.str.66,@object               # @.str.66
.L.str.66:
	.asciz	") "
	.size	.L.str.66, 3

	.type	.L.str.67,@object               # @.str.67
.L.str.67:
	.asciz	"A schedule specialized with specialize_fail() was chosen: "
	.size	.L.str.67, 59

	.type	.L.str.68,@object               # @.str.68
.L.str.68:
	.asciz	"Buffer has a non-zero device but no device interface.\n"
	.size	.L.str.68, 55

	.type	.L.str.69,@object               # @.str.69
.L.str.69:
	.asciz	"Buffer has a non-null device_interface but device is 0.\n"
	.size	.L.str.69, 57

	.type	.L.str.70,@object               # @.str.70
.L.str.70:
	.asciz	"Buffer has both host and device dirty bits set.\n"
	.size	.L.str.70, 49

	.type	.L.str.71,@object               # @.str.71
.L.str.71:
	.asciz	"Buffer pointer passed to "
	.size	.L.str.71, 26

	.type	.L.str.72,@object               # @.str.72
.L.str.72:
	.asciz	" is null.\n"
	.size	.L.str.72, 11

	.type	.L.str.73,@object               # @.str.73
.L.str.73:
	.asciz	"The explicit allocation bound ("
	.size	.L.str.73, 32

	.type	.L.str.74,@object               # @.str.74
.L.str.74:
	.asciz	" is too small to store the required region ("
	.size	.L.str.74, 45

	.type	.L.str.75,@object               # @.str.75
.L.str.75:
	.asciz	"Buffer could not be cropped (runtime error or unimplemented device option).\n"
	.size	.L.str.75, 77

	.type	_ZZ25halide_profiler_get_stateE1s,@object # @_ZZ25halide_profiler_get_stateE1s
	.data
	.p2align	3
_ZZ25halide_profiler_get_stateE1s:
	.zero	8
	.long	1                               # 0x1
	.long	0                               # 0x0
	.long	0                               # 0x0
	.long	0                               # 0x0
	.quad	0
	.quad	0
	.quad	0
	.size	_ZZ25halide_profiler_get_stateE1s, 48

	.type	.L.str.186,@object              # @.str.186
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.186:
	.asciz	"/home/halidenightly/build_bot/worker/halide-release_14-x86-64-linux-cmake/halide-source/src/runtime/profiler_common.cpp:246 halide_abort_if_false() failed: p_stats != nullptr\n"
	.size	.L.str.186, 176

	.type	.L.str.1.187,@object            # @.str.1.187
.L.str.1.187:
	.asciz	"/home/halidenightly/build_bot/worker/halide-release_14-x86-64-linux-cmake/halide-source/src/runtime/profiler_common.cpp:273 halide_abort_if_false() failed: p_stats != nullptr\n"
	.size	.L.str.1.187, 176

	.type	.L.str.2.188,@object            # @.str.2.188
.L.str.2.188:
	.asciz	"/home/halidenightly/build_bot/worker/halide-release_14-x86-64-linux-cmake/halide-source/src/runtime/profiler_common.cpp:274 halide_abort_if_false() failed: func_id >= 0\n"
	.size	.L.str.2.188, 170

	.type	.L.str.3.189,@object            # @.str.3.189
.L.str.3.189:
	.asciz	"/home/halidenightly/build_bot/worker/halide-release_14-x86-64-linux-cmake/halide-source/src/runtime/profiler_common.cpp:275 halide_abort_if_false() failed: func_id < p_stats->num_funcs\n"
	.size	.L.str.3.189, 186

	.type	.L.str.4.190,@object            # @.str.4.190
.L.str.4.190:
	.asciz	"/home/halidenightly/build_bot/worker/halide-release_14-x86-64-linux-cmake/halide-source/src/runtime/profiler_common.cpp:309 halide_abort_if_false() failed: p_stats != nullptr\n"
	.size	.L.str.4.190, 176

	.type	.L.str.5.191,@object            # @.str.5.191
.L.str.5.191:
	.asciz	"/home/halidenightly/build_bot/worker/halide-release_14-x86-64-linux-cmake/halide-source/src/runtime/profiler_common.cpp:310 halide_abort_if_false() failed: func_id >= 0\n"
	.size	.L.str.5.191, 170

	.type	.L.str.6.192,@object            # @.str.6.192
.L.str.6.192:
	.asciz	"/home/halidenightly/build_bot/worker/halide-release_14-x86-64-linux-cmake/halide-source/src/runtime/profiler_common.cpp:311 halide_abort_if_false() failed: func_id < p_stats->num_funcs\n"
	.size	.L.str.6.192, 186

	.type	.L.str.7.164,@object            # @.str.7.164
.L.str.7.164:
	.asciz	"\n"
	.size	.L.str.7.164, 2

	.type	.L.str.8.165,@object            # @.str.8.165
.L.str.8.165:
	.asciz	" total time: "
	.size	.L.str.8.165, 14

	.type	.L.str.9.166,@object            # @.str.9.166
.L.str.9.166:
	.asciz	" ms"
	.size	.L.str.9.166, 4

	.type	.L.str.10.167,@object           # @.str.10.167
.L.str.10.167:
	.asciz	"  samples: "
	.size	.L.str.10.167, 12

	.type	.L.str.11.168,@object           # @.str.11.168
.L.str.11.168:
	.asciz	"  runs: "
	.size	.L.str.11.168, 9

	.type	.L.str.12.169,@object           # @.str.12.169
.L.str.12.169:
	.asciz	"  time/run: "
	.size	.L.str.12.169, 13

	.type	.L.str.13.170,@object           # @.str.13.170
.L.str.13.170:
	.asciz	" ms\n"
	.size	.L.str.13.170, 5

	.type	.L.str.14.171,@object           # @.str.14.171
.L.str.14.171:
	.asciz	" average threads used: "
	.size	.L.str.14.171, 24

	.type	.L.str.15.172,@object           # @.str.15.172
.L.str.15.172:
	.asciz	" heap allocations: "
	.size	.L.str.15.172, 20

	.type	.L.str.16.173,@object           # @.str.16.173
.L.str.16.173:
	.asciz	"  peak heap usage: "
	.size	.L.str.16.173, 20

	.type	.L.str.17.174,@object           # @.str.17.174
.L.str.17.174:
	.asciz	" bytes\n"
	.size	.L.str.17.174, 8

	.type	.L.str.18.175,@object           # @.str.18.175
.L.str.18.175:
	.asciz	"  "
	.size	.L.str.18.175, 3

	.type	.L.str.19.176,@object           # @.str.19.176
.L.str.19.176:
	.asciz	": "
	.size	.L.str.19.176, 3

	.type	.L.str.20.177,@object           # @.str.20.177
.L.str.20.177:
	.asciz	" "
	.size	.L.str.20.177, 2

	.type	.L.str.21.178,@object           # @.str.21.178
.L.str.21.178:
	.asciz	"ms"
	.size	.L.str.21.178, 3

	.type	.L.str.22.179,@object           # @.str.22.179
.L.str.22.179:
	.asciz	"("
	.size	.L.str.22.179, 2

	.type	.L.str.23.180,@object           # @.str.23.180
.L.str.23.180:
	.asciz	"%)"
	.size	.L.str.23.180, 3

	.type	.L.str.24.181,@object           # @.str.24.181
.L.str.24.181:
	.asciz	"threads: "
	.size	.L.str.24.181, 10

	.type	.L.str.25.182,@object           # @.str.25.182
.L.str.25.182:
	.asciz	" peak: "
	.size	.L.str.25.182, 8

	.type	.L.str.26.183,@object           # @.str.26.183
.L.str.26.183:
	.asciz	" num: "
	.size	.L.str.26.183, 7

	.type	.L.str.27.184,@object           # @.str.27.184
.L.str.27.184:
	.asciz	" avg: "
	.size	.L.str.27.184, 7

	.type	.L.str.28.185,@object           # @.str.28.185
.L.str.28.185:
	.asciz	" stack: "
	.size	.L.str.28.185, 9

	.type	.L.str.29.163,@object           # @.str.29.163
.L.str.29.163:
	.asciz	"Printer buffer allocation failed.\n"
	.size	.L.str.29.163, 35

	.type	_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE,@object # @_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE
	.data
	.weak	_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE
	.p2align	3
_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE:
	.quad	halide_default_can_use_target_features
	.size	_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE, 8

	.type	_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE,@object # @_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE
	.bss
	.weak	_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE
	.p2align	3
_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE:
	.zero	32
	.size	_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE, 32

	.type	_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE,@object # @_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE
	.weak	_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE
_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE:
	.byte	0                               # 0x0
	.size	_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE, 1

	.type	_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE,@object # @_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE
	.weak	_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE
	.p2align	3
_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE:
	.zero	8
	.size	_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE, 8

	.type	.L.str.197,@object              # @.str.197
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.197:
	.asciz	"Internal error: wrong structure size passed to halide_can_use_target_features()\n"
	.size	.L.str.197, 81

	.type	.L__unnamed_1,@object           # @0
	.section	.rodata,"a",@progbits
	.p2align	4
.L__unnamed_1:
	.zero	32
	.size	.L__unnamed_1, 32

	.type	.Lstr,@object                   # @str
	.p2align	5
.Lstr:
	.asciz	"input"
	.size	.Lstr, 6

	.type	.L__unnamed_2,@object           # @1
	.p2align	4
.L__unnamed_2:
	.zero	32
	.size	.L__unnamed_2, 32

	.type	.Lstr.200,@object               # @str.200
	.p2align	5
.Lstr.200:
	.asciz	"result"
	.size	.Lstr.200, 7

	.type	.L__unnamed_3,@object           # @2
	.section	.data.rel.ro,"aw",@progbits
	.p2align	4
.L__unnamed_3:
	.quad	.Lstr
	.long	1                               # 0x1
	.long	2                               # 0x2
	.byte	1                               # 0x1
	.byte	8                               # 0x8
	.short	1                               # 0x1
	.zero	4
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	.L__unnamed_1
	.quad	.Lstr.200
	.long	2                               # 0x2
	.long	2                               # 0x2
	.byte	1                               # 0x1
	.byte	8                               # 0x8
	.short	1                               # 0x1
	.zero	4
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	.L__unnamed_2
	.size	.L__unnamed_3, 128

	.type	.Lstr.201,@object               # @str.201
	.section	.rodata,"a",@progbits
	.p2align	5
.Lstr.201:
	.asciz	"x86-64-linux-avx-avx2-disable_llvm_loop_opt-sse41"
	.size	.Lstr.201, 50

	.type	.Lstr.202,@object               # @str.202
	.p2align	5
.Lstr.202:
	.asciz	"blur"
	.size	.Lstr.202, 5

	.type	.Lblur_metadata_storage,@object # @blur_metadata_storage
	.section	.data.rel.ro,"aw",@progbits
	.p2align	4
.Lblur_metadata_storage:
	.long	1                               # 0x1
	.long	2                               # 0x2
	.quad	.L__unnamed_3
	.quad	.Lstr.201
	.quad	.Lstr.202
	.size	.Lblur_metadata_storage, 32

	.type	.Lstr.203,@object               # @str.203
	.section	.rodata,"a",@progbits
	.p2align	5
.Lstr.203:
	.asciz	"Input buffer input"
	.size	.Lstr.203, 19

	.type	.Lstr.204,@object               # @str.204
	.p2align	5
.Lstr.204:
	.asciz	"Output buffer result"
	.size	.Lstr.204, 21

	.type	.Lstr.205,@object               # @str.205
	.p2align	5
.Lstr.205:
	.asciz	"input.stride.0"
	.size	.Lstr.205, 15

	.type	.Lstr.206,@object               # @str.206
	.p2align	5
.Lstr.206:
	.asciz	"1"
	.size	.Lstr.206, 2

	.type	.Lstr.207,@object               # @str.207
	.p2align	5
.Lstr.207:
	.asciz	"result.stride.0"
	.size	.Lstr.207, 16

	.type	.Lreltable.halide_type_to_string,@object # @reltable.halide_type_to_string
	.p2align	2
.Lreltable.halide_type_to_string:
	.long	.L.str.14.76-.Lreltable.halide_type_to_string
	.long	.L.str.15.75-.Lreltable.halide_type_to_string
	.long	.L.str.16.74-.Lreltable.halide_type_to_string
	.long	.L.str.17.73-.Lreltable.halide_type_to_string
	.size	.Lreltable.halide_type_to_string, 16

	.ident	"clang version 14.0.1 (https://github.com/llvm/llvm-project.git 311a622edd31422c0969913285e54d4778477a12)"
	.ident	"clang version 14.0.1 (https://github.com/llvm/llvm-project.git 311a622edd31422c0969913285e54d4778477a12)"
	.ident	"clang version 14.0.1 (https://github.com/llvm/llvm-project.git 311a622edd31422c0969913285e54d4778477a12)"
	.ident	"clang version 14.0.1 (https://github.com/llvm/llvm-project.git 311a622edd31422c0969913285e54d4778477a12)"
	.ident	"clang version 14.0.1 (https://github.com/llvm/llvm-project.git 311a622edd31422c0969913285e54d4778477a12)"
	.ident	"clang version 14.0.1 (https://github.com/llvm/llvm-project.git 311a622edd31422c0969913285e54d4778477a12)"
	.ident	"clang version 14.0.1 (https://github.com/llvm/llvm-project.git 311a622edd31422c0969913285e54d4778477a12)"
	.ident	"clang version 14.0.1 (https://github.com/llvm/llvm-project.git 311a622edd31422c0969913285e54d4778477a12)"
	.ident	"clang version 14.0.1 (https://github.com/llvm/llvm-project.git 311a622edd31422c0969913285e54d4778477a12)"
	.ident	"clang version 14.0.1 (https://github.com/llvm/llvm-project.git 311a622edd31422c0969913285e54d4778477a12)"
	.ident	"clang version 14.0.1 (https://github.com/llvm/llvm-project.git 311a622edd31422c0969913285e54d4778477a12)"
	.ident	"clang version 14.0.1 (https://github.com/llvm/llvm-project.git 311a622edd31422c0969913285e54d4778477a12)"
	.ident	"clang version 14.0.1 (https://github.com/llvm/llvm-project.git 311a622edd31422c0969913285e54d4778477a12)"
	.ident	"clang version 14.0.1 (https://github.com/llvm/llvm-project.git 311a622edd31422c0969913285e54d4778477a12)"
	.ident	"clang version 14.0.1 (https://github.com/llvm/llvm-project.git 311a622edd31422c0969913285e54d4778477a12)"
	.ident	"clang version 14.0.1 (https://github.com/llvm/llvm-project.git 311a622edd31422c0969913285e54d4778477a12)"
	.ident	"clang version 14.0.1 (https://github.com/llvm/llvm-project.git 311a622edd31422c0969913285e54d4778477a12)"
	.ident	"clang version 14.0.1 (https://github.com/llvm/llvm-project.git 311a622edd31422c0969913285e54d4778477a12)"
	.ident	"clang version 14.0.1 (https://github.com/llvm/llvm-project.git 311a622edd31422c0969913285e54d4778477a12)"
	.ident	"clang version 14.0.1 (https://github.com/llvm/llvm-project.git 311a622edd31422c0969913285e54d4778477a12)"
	.ident	"clang version 14.0.1 (https://github.com/llvm/llvm-project.git 311a622edd31422c0969913285e54d4778477a12)"
	.ident	"clang version 14.0.1 (https://github.com/llvm/llvm-project.git 311a622edd31422c0969913285e54d4778477a12)"
	.ident	"clang version 14.0.1 (https://github.com/llvm/llvm-project.git 311a622edd31422c0969913285e54d4778477a12)"
	.ident	"clang version 14.0.1 (https://github.com/llvm/llvm-project.git 311a622edd31422c0969913285e54d4778477a12)"
	.ident	"clang version 14.0.1 (https://github.com/llvm/llvm-project.git 311a622edd31422c0969913285e54d4778477a12)"
	.ident	"clang version 14.0.1 (https://github.com/llvm/llvm-project.git 311a622edd31422c0969913285e54d4778477a12)"
	.ident	"clang version 14.0.1 (https://github.com/llvm/llvm-project.git 311a622edd31422c0969913285e54d4778477a12)"
	.ident	"clang version 14.0.1 (https://github.com/llvm/llvm-project.git 311a622edd31422c0969913285e54d4778477a12)"
	.ident	"clang version 14.0.1 (https://github.com/llvm/llvm-project.git 311a622edd31422c0969913285e54d4778477a12)"
	.ident	"clang version 14.0.1 (https://github.com/llvm/llvm-project.git 311a622edd31422c0969913285e54d4778477a12)"
	.section	".note.GNU-stack","",@progbits
