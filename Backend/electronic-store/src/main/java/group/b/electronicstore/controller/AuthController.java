package group.b.electronicstore.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import javax.validation.Valid;

import group.b.electronicstore.config.JwtUtils;
import group.b.electronicstore.model.Account;
import group.b.electronicstore.model.AccountDetailsImpl;
import group.b.electronicstore.payload.request.LoginRequest;
import group.b.electronicstore.payload.request.SignupRequest;
import group.b.electronicstore.payload.response.AccountInfoResponse;
import group.b.electronicstore.payload.response.MessageResponse;
import group.b.electronicstore.repository.AccountRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseCookie;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/auth")
public class AuthController {
    @Autowired
    AuthenticationManager authenticationManager;

    @Autowired
    AccountRepository accountRepository;

    @Autowired
    PasswordEncoder encoder;

    @Autowired
    JwtUtils jwtUtils;

    @PostMapping("/login")
    public ResponseEntity<?> authenticateAccount(@Valid @RequestBody LoginRequest loginRequest) {

        Authentication authentication = authenticationManager
                .authenticate(new UsernamePasswordAuthenticationToken(loginRequest.getUsername(), loginRequest.getPassword()));

        SecurityContextHolder.getContext().setAuthentication(authentication);

        AccountDetailsImpl accountDetails = (AccountDetailsImpl) authentication.getPrincipal();

        ResponseCookie jwtCookie = jwtUtils.generateJwtCookie(accountDetails);
        String jwt = jwtUtils.generateJwtToken(authentication);
        List<String> roles = accountDetails.getAuthorities().stream()
                .map(item -> item.getAuthority())
                .collect(Collectors.toList());

        return ResponseEntity.ok().header(HttpHeaders.SET_COOKIE, jwtCookie.toString())
                .body(new AccountInfoResponse(
                        jwt,
                        accountDetails.getId(),
                        accountDetails.getUsername(),
                        roles));
    }

    @PostMapping("/signup")
    public ResponseEntity<?> registerAccount(@Valid @RequestBody SignupRequest signUpRequest) {
        if (accountRepository.existsByUsername(signUpRequest.getUsername())) {
            return ResponseEntity.badRequest().body(new MessageResponse("Error: Username is already taken!"));
        }

//     Create new account's account
        Account account = new Account();
        account.setUsername(signUpRequest.getUsername());
        account.setPassword(encoder.encode(signUpRequest.getPassword()));
        account.setStatus(signUpRequest.getStatus());
        account.setRole(signUpRequest.getRole());
        accountRepository.save(account);
        return ResponseEntity.ok(new MessageResponse("Account registered successfully!"));

//      Create Customer
//      User user = new User();
//      user.setAccount(account);
//      userRepository.save(user);
//      return ResponseEntity.ok(new MessageResponse("Account registered successfully!"));
    }
    @PostMapping("/signout")
    public ResponseEntity<?> logoutAccount() {
        ResponseCookie cookie = jwtUtils.getCleanJwtCookie();
        return ResponseEntity.ok().header(HttpHeaders.SET_COOKIE, cookie.toString())
                .body(new MessageResponse("You've been signed out!"));
    }
}